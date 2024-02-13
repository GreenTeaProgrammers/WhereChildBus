# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc
import grpc.experimental


from where_child_bus.v1 import station_pb2 as where__child__bus_dot_v1_dot_station__pb2


class StationServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.CreateStation = channel.unary_unary(
                '/where_child_bus.v1.StationService/CreateStation',
                request_serializer=where__child__bus_dot_v1_dot_station__pb2.CreateStationRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_station__pb2.CreateStationResponse.FromString,
                )
        self.GetStationListByBusId = channel.unary_unary(
                '/where_child_bus.v1.StationService/GetStationListByBusId',
                request_serializer=where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdResponse.FromString,
                )


class StationServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def CreateStation(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def GetStationListByBusId(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_StationServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'CreateStation': grpc.unary_unary_rpc_method_handler(
                    servicer.CreateStation,
                    request_deserializer=where__child__bus_dot_v1_dot_station__pb2.CreateStationRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_station__pb2.CreateStationResponse.SerializeToString,
            ),
            'GetStationListByBusId': grpc.unary_unary_rpc_method_handler(
                    servicer.GetStationListByBusId,
                    request_deserializer=where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'where_child_bus.v1.StationService', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class StationService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def CreateStation(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.StationService/CreateStation',
            where__child__bus_dot_v1_dot_station__pb2.CreateStationRequest.SerializeToString,
            where__child__bus_dot_v1_dot_station__pb2.CreateStationResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def GetStationListByBusId(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.StationService/GetStationListByBusId',
            where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdRequest.SerializeToString,
            where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
