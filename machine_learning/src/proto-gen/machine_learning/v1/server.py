from concurrent import futures
import grpc
import machine_learning_pb2
import machine_learning_pb2_grpc
from grpc_reflection.v1alpha import reflection


class HealthCheck(machine_learning_pb2_grpc.MachineLearningServiceServicer):
    def Ping(self, request, context):
        print("RECV: %s" % request.message)
        message = "Hello, %s!" % request.message
        print("SEND: %s" % message)
        return machine_learning_pb2.PingResponse(message=message)


class MachineLearningServiceServicer(
    machine_learning_pb2_grpc.MachineLearningServiceServicer
):
    def Predict(self, request, context):
        pass

    def Train(self, request, context):
        pass

    def FaceDetectAndClip(self, request, context):
        pass


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    machine_learning_pb2_grpc.add_MachineLearningServiceServicer_to_server(
        HealthCheck(), server
    )

    # Reflection APIの設定
    SERVICE_NAMES = (
        machine_learning_pb2.DESCRIPTOR.services_by_name[
            "MachineLearningService"
        ].full_name,
        reflection.SERVICE_NAME,
    )
    reflection.enable_server_reflection(SERVICE_NAMES, server)

    server.add_insecure_port("[::]:8080")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    serve()
