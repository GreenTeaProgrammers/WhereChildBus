import logging
from concurrent import futures
from typing import Iterable
import traceback


import grpc

from grpc_status import rpc_status
from grpc_reflection.v1alpha import reflection


from generated.machine_learning.v1 import health_check_pb2
from generated.machine_learning.v1 import health_check_pb2_grpc
from generated.machine_learning.v1 import machine_learning_pb2
from generated.machine_learning.v1 import machine_learning_pb2_grpc
from generated.where_child_bus.v1 import bus_pb2
from generated.machine_learning.v1.func_args import (
    FaceDetectAndClip_Args,
    Pred_Args,
    Train_Args,
)

from error_util import create_service_error_status


from face_detect_model.DetectFaceAndClip.detectFaceAndClip import (
    main as detect_face_and_clip_fn,
)
from face_detect_model.main import main as train_fn
from face_detect_model.pred import main as pred_fn
from generated.machine_learning.v1 import (
    health_check_pb2,
    health_check_pb2_grpc,
    machine_learning_pb2,
    machine_learning_pb2_grpc,
)
from generated.machine_learning.v1.func_args import (
    FaceDetectAndClip_Args,
    Pred_Args,
    Train_Args,
)
from generated.where_child_bus.v1 import bus_pb2
from grpc_reflection.v1alpha import reflection


class HealthCheckServiceServer(
    machine_learning_pb2_grpc.MachineLearningServiceServicer
):
    def Ping(self, request: health_check_pb2.PingRequest, context):
        logging.info("RECV: %s" % request.name)
        message = "Hello, %s!" % request.name
        logging.info("SEND: %s" % message)
        return health_check_pb2.PingResponse(message=message)


# TODO: error handling
# TODO: 非同期処理
class MachineLearningServiceServicer(
    machine_learning_pb2_grpc.MachineLearningServiceServicer
):
    def __init__(self):
        self.pred_fn = pred_fn
        self.train_fn = train_fn
        self.detect_face_and_clip_fn = detect_face_and_clip_fn

    def Pred(self, request_iterator: Iterable[bus_pb2.StreamBusVideoRequest], context):
        for request in request_iterator:
            logging.info("Pred Service Start")
            params = Pred_Args(
                nursery_id=request.nursery_id,
                bus_id=request.bus_id,
                bus_type=request.bus_type,
                video_chunk=request.video_chunk,
                photo_height=request.photo_height,
                photo_width=request.photo_width,
                vehicle_event=request.vehicle_event,
            )
            try:
                child_ids = self.pred_fn(params)
            except Exception:
                e = traceback.format_exc()
                logging.error(e)
                rich_status = create_service_error_status(e)
                context.abort_with_status(rpc_status.to_status(rich_status))
                child_ids = []

            is_detected = len(child_ids) > 0
            yield machine_learning_pb2.PredResponse(
                is_detected=is_detected, child_ids=child_ids
            )

    def Train(self, request: machine_learning_pb2.TrainRequest, context):
        logging.info("Train Service Start")
        params = Train_Args(
            nursery_id=request.nursery_id,
            child_ids=request.child_ids,
            bus_id=request.bus_id,
            bus_type=request.bus_type,
            seed=42,
            mode="train",
        )
        try:
            self.train_fn(params)
            is_started = True
        except Exception:
            is_started = False
            e = traceback.format_exc()
            logging.error(e)
            rich_status = create_service_error_status(e)
            context.abort_with_status(rpc_status.to_status(rich_status))

        return machine_learning_pb2.TrainResponse(is_started=is_started)

    def FaceDetectAndClip(
        self,
        request: machine_learning_pb2.FaceDetectAndClipRequest,
        context,
    ):
        logging.info("FaceDetectAndClip Service Start")
        params = FaceDetectAndClip_Args(
            nursery_id=request.nursery_id,
            child_id=request.child_id,
            env="remote",
        )
        try:
            self.detect_face_and_clip_fn(params)
            is_started = True
        except Exception:
            is_started = False
            e = traceback.format_exc()
            logging.error(e)
            rich_status = create_service_error_status(e)
            context.abort_with_status(rpc_status.to_status(rich_status))

        return machine_learning_pb2.FaceDetectAndClipResponse(is_started=is_started)


def serve():
    bind_address = "[::]:8080"
    server = grpc.server(futures.ThreadPoolExecutor())
    health_check_pb2_grpc.add_HealthcheckServiceServicer_to_server(
        HealthCheckServiceServer(), server
    )
    machine_learning_pb2_grpc.add_MachineLearningServiceServicer_to_server(
        MachineLearningServiceServicer(), server
    )
    service_names = (
        health_check_pb2.DESCRIPTOR.services_by_name["HealthcheckService"].full_name,
        machine_learning_pb2.DESCRIPTOR.services_by_name[
            "MachineLearningService"
        ].full_name,
        reflection.SERVICE_NAME,
    )
    reflection.enable_server_reflection(service_names, server)

    server.add_insecure_port(bind_address)
    server.start()
    logging.info("Listening on %s.", bind_address)
    server.wait_for_termination()


if __name__ == "__main__":
    logging.info("Called server.py")
    # NOTE: https://github.com/grpc/grpc/issues/17321
    # gRPCのPython環境でloggingを使う場合、server起動前にlogging.basicConfig()を実行する必要がある
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    )
    serve()
