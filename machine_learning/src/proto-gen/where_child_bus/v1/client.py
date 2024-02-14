import grpc
import health_check_pb2
import health_check_pb2_grpc


ENDPOINT = 'where-child-bus-grpc-k3dkun2lpq-uw.a.run.app:443'
with grpc.secure_channel(ENDPOINT, grpc.ssl_channel_credentials()) as channel:
    stub = health_check_pb2_grpc.HealthcheckServiceStub(channel)
    request = health_check_pb2.PingRequest()
    stub.Ping(request)
    request.name = 'ping'
    response = stub.Ping(request)
    print(response.message)
    channel.close()