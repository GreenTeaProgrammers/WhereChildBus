# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc
from where_child_bus.v1 import station_pb2 as where__child__bus_dot_v1_dot_station__pb2


class StationServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.UpdateStationLocationByGuardianId = channel.unary_unary(
            "/where_child_bus.v1.StationService/UpdateStationLocationByGuardianId",
            request_serializer=where__child__bus_dot_v1_dot_station__pb2.UpdateStationLocationByGuardianIdRequest.SerializeToString,
            response_deserializer=where__child__bus_dot_v1_dot_station__pb2.UpdateStationLocationByGuardianIdResponse.FromString,
        )
        self.GetStationListByBusId = channel.unary_unary(
                '/where_child_bus.v1.StationService/GetStationListByBusId',
                request_serializer=where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdResponse.FromString,
                )
        self.GetUnregisteredStationList = channel.unary_unary(
                '/where_child_bus.v1.StationService/GetUnregisteredStationList',
                request_serializer=where__child__bus_dot_v1_dot_station__pb2.GetUnregisteredStationListRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_station__pb2.GetUnregisteredStationListResponse.FromString,
                )

        self.UpdateStation = channel.unary_unary(
            "/where_child_bus.v1.StationService/UpdateStation",
            request_serializer=where__child__bus_dot_v1_dot_station__pb2.UpdateStationRequest.SerializeToString,
            response_deserializer=where__child__bus_dot_v1_dot_station__pb2.UpdateStationResponse.FromString,
        )


class StationServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def UpdateStationLocationByGuardianId(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details("Method not implemented!")
        raise NotImplementedError("Method not implemented!")

    def GetStationListByBusId(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details("Method not implemented!")
        raise NotImplementedError("Method not implemented!")

    def GetUnregisteredStationList(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def UpdateStation(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details("Method not implemented!")
        raise NotImplementedError("Method not implemented!")


def add_StationServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {

            'UpdateStationLocationByGuardianId': grpc.unary_unary_rpc_method_handler(
                    servicer.UpdateStationLocationByGuardianId,
                    request_deserializer=where__child__bus_dot_v1_dot_station__pb2.UpdateStationLocationByGuardianIdRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_station__pb2.UpdateStationLocationByGuardianIdResponse.SerializeToString,
            ),
            'GetStationListByBusId': grpc.unary_unary_rpc_method_handler(
                    servicer.GetStationListByBusId,
                    request_deserializer=where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdResponse.SerializeToString,
            ),
            'GetUnregisteredStationList': grpc.unary_unary_rpc_method_handler(
                    servicer.GetUnregisteredStationList,
                    request_deserializer=where__child__bus_dot_v1_dot_station__pb2.GetUnregisteredStationListRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_station__pb2.GetUnregisteredStationListResponse.SerializeToString,
            ),
            'UpdateStation': grpc.unary_unary_rpc_method_handler(
                    servicer.UpdateStation,
                    request_deserializer=where__child__bus_dot_v1_dot_station__pb2.UpdateStationRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_station__pb2.UpdateStationResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
        "where_child_bus.v1.StationService", rpc_method_handlers
    )
    server.add_generic_rpc_handlers((generic_handler,))


# This class is part of an EXPERIMENTAL API.
class StationService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def UpdateStationLocationByGuardianId(
        request,
        target,
        options=(),
        channel_credentials=None,
        call_credentials=None,
        insecure=False,
        compression=None,
        wait_for_ready=None,
        timeout=None,
        metadata=None,
    ):
        return grpc.experimental.unary_unary(
            request,
            target,
            "/where_child_bus.v1.StationService/UpdateStationLocationByGuardianId",
            where__child__bus_dot_v1_dot_station__pb2.UpdateStationLocationByGuardianIdRequest.SerializeToString,
            where__child__bus_dot_v1_dot_station__pb2.UpdateStationLocationByGuardianIdResponse.FromString,
            options,
            channel_credentials,
            insecure,
            call_credentials,
            compression,
            wait_for_ready,
            timeout,
            metadata,
        )

    @staticmethod
    def GetStationListByBusId(
        request,
        target,
        options=(),
        channel_credentials=None,
        call_credentials=None,
        insecure=False,
        compression=None,
        wait_for_ready=None,
        timeout=None,
        metadata=None,
    ):
        return grpc.experimental.unary_unary(
            request,
            target,
            "/where_child_bus.v1.StationService/GetStationListByBusId",
            where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdRequest.SerializeToString,
            where__child__bus_dot_v1_dot_station__pb2.GetStationListByBusIdResponse.FromString,
            options,
            channel_credentials,
            insecure,
            call_credentials,
            compression,
            wait_for_ready,
            timeout,
            metadata,
        )

    @staticmethod

    def GetUnregisteredStationList(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.StationService/GetUnregisteredStationList',
            where__child__bus_dot_v1_dot_station__pb2.GetUnregisteredStationListRequest.SerializeToString,
            where__child__bus_dot_v1_dot_station__pb2.GetUnregisteredStationListResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def UpdateStation(request,
            target,
            "/where_child_bus.v1.StationService/UpdateStation",
            where__child__bus_dot_v1_dot_station__pb2.UpdateStationRequest.SerializeToString,
            where__child__bus_dot_v1_dot_station__pb2.UpdateStationResponse.FromString,
            options,
            channel_credentials,
            insecure,
            call_credentials,
            compression,
            wait_for_ready,
            timeout,
            metadata,
        )
