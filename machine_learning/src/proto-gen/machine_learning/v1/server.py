from concurrent import futures
import grpc
import machine_learning_pb2
import machine_learning_pb2_grpc

class HelloWorld(machine_learning_pb2_grpc.MachineLearningServiceServicer):
    def SayHello(self, request, context):
        print("RECV: %s" % request.name)
        message = "Hello, %s!" % request.name
        print("SEND: %s" % message)
        return machine_learning_pb2.PingResponse(message=message)

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    machine_learning_pb2_grpc.add_MachineLearningServiceServicer_to_server(HelloWorld(), server)
    server.add_insecure_port('[::]:8080')
    server.start()
    server.wait_for_termination()

if __name__ == '__main__':
    serve()