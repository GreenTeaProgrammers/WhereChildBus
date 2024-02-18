import argparse
import logging
import threading
from concurrent import futures

import grpc
from grpc_reflection.v1alpha import reflection

from generated.machine_learning.v1 import health_check_pb2
from generated.machine_learning.v1 import health_check_pb2_grpc
from generated.machine_learning.v1 import machine_learning_pb2
from generated.machine_learning.v1 import machine_learning_pb2_grpc
from generated.where_child_bus.v1 import bus_pb2

import logging
from concurrent import futures


from face_detect_model.DetectFaceAndClip.detectFaceAndClip import (
    main as detect_face_and_clip_fn,
)
from face_detect_model.main import (
    main as train_fn,
)
from face_detect_model.pred import (
    main as pred_fn,
)


class HealthCheckServiceServer(
    machine_learning_pb2_grpc.MachineLearningServiceServicer
):
    def Ping(self, request: health_check_pb2.PingRequest, context):
        logging.info("RECV: %s" % request.name)
        message = "Hello, %s!" % request.name
        logging.info("SEND: %s" % message)
        return health_check_pb2.PingResponse(message=message)


class MachineLearningServiceServicer(
    machine_learning_pb2_grpc.MachineLearningServiceServicer
):
    def __init__(self):
        self.pred_fn = pred_fn
        self.train_fn = train_fn
        self.detect_face_and_clip_fn = detect_face_and_clip_fn

    def Predict(self, request_iterator: bus_pb2.StreamBusVideoRequest, context):
        for req in request_iterator:
            parser = argparse.ArgumentParser()
            args = parser.parse_args()

            args.bus_id = req.bus_id
            args.bus_type = req.bus_type
            args.video_type = req.video_type
            args.video_chunk = req.video_chunk
            args.timestamp = req.timestamp

            try:
                child_ids = self.pred_fn(args)
            except Exception as e:
                logging.error(e)
                child_ids = []
            yield machine_learning_pb2.PredResponse(child_ids=child_ids)

    def Train(self, request: machine_learning_pb2.TrainRequest, context):
        parser = argparse.ArgumentParser()
        args = parser.parse_args()

        args.nursery_id = request.nursery_id
        args.child_ids = request.child_ids
        args.bus_id = request.bus_id
        args.bus_type = request.bus_type
        args.seed = 42
        args.mode = "train"
        # mainメソッドを別スレッドで実行
        try:
            thread = threading.Thread(target=self.train_fn, args=(args,))
            thread.start()
            is_started = True
        except Exception as e:
            logging.error(e)
            is_started = False

        return machine_learning_pb2.TrainResponse(is_started=is_started)

    def FaceDetectAndClip(
        self,
        request: machine_learning_pb2.FaceDetectAndClipRequest,
        context,
    ):
        parser = argparse.ArgumentParser()
        args = parser.parse_args()

        args.nursery_id = request.nursery_id
        args.child_id = request.child_id
        args.env = "remote"
        # mainメソッドを別スレッドで実行
        try:
            thread = threading.Thread(target=self.detect_face_and_clip_fn, args=(args,))
            thread.start()
            is_started = True
        except Exception as e:
            logging.error(e)
            is_started = False

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
