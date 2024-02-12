# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc

from where_child_bus.v1 import bus_pb2 as where__child__bus_dot_v1_dot_bus__pb2


class BusServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.CreateBus = channel.unary_unary(
                '/where_child_bus.v1.BusService/CreateBus',
                request_serializer=where__child__bus_dot_v1_dot_bus__pb2.CreateBusRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_bus__pb2.CreateBusResponse.FromString,
                )
        self.GetBusListByNurseryId = channel.unary_unary(
                '/where_child_bus.v1.BusService/GetBusListByNurseryId',
                request_serializer=where__child__bus_dot_v1_dot_bus__pb2.GetBusListByNurseryIdRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_bus__pb2.GetBusListByNurseryIdResponse.FromString,
                )


class BusServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def CreateBus(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def GetBusListByNurseryId(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_BusServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'CreateBus': grpc.unary_unary_rpc_method_handler(
                    servicer.CreateBus,
                    request_deserializer=where__child__bus_dot_v1_dot_bus__pb2.CreateBusRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_bus__pb2.CreateBusResponse.SerializeToString,
            ),
            'GetBusListByNurseryId': grpc.unary_unary_rpc_method_handler(
                    servicer.GetBusListByNurseryId,
                    request_deserializer=where__child__bus_dot_v1_dot_bus__pb2.GetBusListByNurseryIdRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_bus__pb2.GetBusListByNurseryIdResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'where_child_bus.v1.BusService', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class BusService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def CreateBus(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.BusService/CreateBus',
            where__child__bus_dot_v1_dot_bus__pb2.CreateBusRequest.SerializeToString,
            where__child__bus_dot_v1_dot_bus__pb2.CreateBusResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def GetBusListByNurseryId(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.BusService/GetBusListByNurseryId',
            where__child__bus_dot_v1_dot_bus__pb2.GetBusListByNurseryIdRequest.SerializeToString,
            where__child__bus_dot_v1_dot_bus__pb2.GetBusListByNurseryIdResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
