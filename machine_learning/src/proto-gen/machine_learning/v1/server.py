import argparse
import logging
import threading
from concurrent import futures

import grpc
import health_check_pb2
import health_check_pb2_grpc
import machine_learning_pb2
import machine_learning_pb2_grpc

import logging
import os
from concurrent import futures

import grpc

from face_detect_model.DetectFaceAndClip.detectFaceAndClip import main


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
    # TODO: implement Predict
    def Predict(self, request: machine_learning_pb2.PredRequest, context):
        pass

    # TODO: implement Train
    def Train(self, request: machine_learning_pb2.TrainRequest, context):
        pass

    def FaceDetectAndClip(
        self,
        request: machine_learning_pb2.FaceDetectAndClipRequest,
        context,
    ):
        pass
        # parser = argparse.ArgumentParser()
        # args = parser.parse_args()

        # args.nursery_id = request.nursery_id
        # args.child_id = request.child_id
        # args.env = "remote"
        # # mainメソッドを別スレッドで実行
        # try:
        #     thread = threading.Thread(target=main, args=(args,))
        #     thread.start()
        #     is_started = True
        # except Exception as e:
        #     logging.error(e)
        #     is_started = False

        # return machine_learning_pb2.FaceDetectAndClipResponse(is_started=is_started)


def serve():
    bind_address = f"[::]:8080"
    server = grpc.server(futures.ThreadPoolExecutor())
    health_check_pb2_grpc.add_HealthcheckServiceServicer_to_server(
        HealthCheckServiceServer(), server
    )
    machine_learning_pb2_grpc.add_MachineLearningServiceServicer_to_server(
        MachineLearningServiceServicer(), server
    )
    server.add_insecure_port(bind_address)
    server.start()
    logging.info("Listening on %s.", bind_address)
    server.wait_for_termination()

if __name__ == "__main__":
    print("Called server.py")
    # NOTE: https://github.com/grpc/grpc/issues/17321
    # gRPCのPython環境でloggingを使う場合、server起動前にlogging.basicConfig()を実行する必要がある
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    )
    serve()
