# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc
import grpc.experimental

import health_check_pb2 as machine__learning_dot_v1_dot_health__check__pb2


class HealthcheckServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.Ping = channel.unary_unary(
                '/machine_learning.v1.HealthcheckService/Ping',
                request_serializer=machine__learning_dot_v1_dot_health__check__pb2.PingRequest.SerializeToString,
                response_deserializer=machine__learning_dot_v1_dot_health__check__pb2.PingResponse.FromString,
                )


class HealthcheckServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def Ping(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_HealthcheckServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'Ping': grpc.unary_unary_rpc_method_handler(
                    servicer.Ping,
                    request_deserializer=machine__learning_dot_v1_dot_health__check__pb2.PingRequest.FromString,
                    response_serializer=machine__learning_dot_v1_dot_health__check__pb2.PingResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'machine_learning.v1.HealthcheckService', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class HealthcheckService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def Ping(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/machine_learning.v1.HealthcheckService/Ping',
            machine__learning_dot_v1_dot_health__check__pb2.PingRequest.SerializeToString,
            machine__learning_dot_v1_dot_health__check__pb2.PingResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
