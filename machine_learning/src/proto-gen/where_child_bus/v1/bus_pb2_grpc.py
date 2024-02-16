# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc
import grpc.experimental

import bus_pb2 as where__child__bus_dot_v1_dot_bus__pb2


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
        self.ChangeBusStatus = channel.unary_unary(
                '/where_child_bus.v1.BusService/ChangeBusStatus',
                request_serializer=where__child__bus_dot_v1_dot_bus__pb2.ChangeBusStatusRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_bus__pb2.ChangeBusStatusResponse.FromString,
                )
        self.SendLocationContinuous = channel.stream_unary(
                '/where_child_bus.v1.BusService/SendLocationContinuous',
                request_serializer=where__child__bus_dot_v1_dot_bus__pb2.SendLocationContinuousRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_bus__pb2.SendLocationContinuousResponse.FromString,
                )
        self.TrackBusContinuous = channel.unary_stream(
                '/where_child_bus.v1.BusService/TrackBusContinuous',
                request_serializer=where__child__bus_dot_v1_dot_bus__pb2.TrackBusContinuousRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_bus__pb2.TrackBusContinuousResponse.FromString,
                )
        self.StreamBusVideo = channel.stream_unary(
                '/where_child_bus.v1.BusService/StreamBusVideo',
                request_serializer=where__child__bus_dot_v1_dot_bus__pb2.StreamBusVideoRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_bus__pb2.StreamBusVideoResponse.FromString,
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

    def ChangeBusStatus(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def SendLocationContinuous(self, request_iterator, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def TrackBusContinuous(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def StreamBusVideo(self, request_iterator, context):
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
            'ChangeBusStatus': grpc.unary_unary_rpc_method_handler(
                    servicer.ChangeBusStatus,
                    request_deserializer=where__child__bus_dot_v1_dot_bus__pb2.ChangeBusStatusRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_bus__pb2.ChangeBusStatusResponse.SerializeToString,
            ),
            'SendLocationContinuous': grpc.stream_unary_rpc_method_handler(
                    servicer.SendLocationContinuous,
                    request_deserializer=where__child__bus_dot_v1_dot_bus__pb2.SendLocationContinuousRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_bus__pb2.SendLocationContinuousResponse.SerializeToString,
            ),
            'TrackBusContinuous': grpc.unary_stream_rpc_method_handler(
                    servicer.TrackBusContinuous,
                    request_deserializer=where__child__bus_dot_v1_dot_bus__pb2.TrackBusContinuousRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_bus__pb2.TrackBusContinuousResponse.SerializeToString,
            ),
            'StreamBusVideo': grpc.stream_unary_rpc_method_handler(
                    servicer.StreamBusVideo,
                    request_deserializer=where__child__bus_dot_v1_dot_bus__pb2.StreamBusVideoRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_bus__pb2.StreamBusVideoResponse.SerializeToString,
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

    @staticmethod
    def ChangeBusStatus(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.BusService/ChangeBusStatus',
            where__child__bus_dot_v1_dot_bus__pb2.ChangeBusStatusRequest.SerializeToString,
            where__child__bus_dot_v1_dot_bus__pb2.ChangeBusStatusResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def SendLocationContinuous(request_iterator,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.stream_unary(request_iterator, target, '/where_child_bus.v1.BusService/SendLocationContinuous',
            where__child__bus_dot_v1_dot_bus__pb2.SendLocationContinuousRequest.SerializeToString,
            where__child__bus_dot_v1_dot_bus__pb2.SendLocationContinuousResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def TrackBusContinuous(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_stream(request, target, '/where_child_bus.v1.BusService/TrackBusContinuous',
            where__child__bus_dot_v1_dot_bus__pb2.TrackBusContinuousRequest.SerializeToString,
            where__child__bus_dot_v1_dot_bus__pb2.TrackBusContinuousResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def StreamBusVideo(request_iterator,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.stream_unary(request_iterator, target, '/where_child_bus.v1.BusService/StreamBusVideo',
            where__child__bus_dot_v1_dot_bus__pb2.StreamBusVideoRequest.SerializeToString,
            where__child__bus_dot_v1_dot_bus__pb2.StreamBusVideoResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
