# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc

from where_child_bus.v1 import child_pb2 as where__child__bus_dot_v1_dot_child__pb2


class ChildServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.CreateChild = channel.unary_unary(
                '/where_child_bus.v1.ChildService/CreateChild',
                request_serializer=where__child__bus_dot_v1_dot_child__pb2.CreateChildRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_child__pb2.CreateChildResponse.FromString,
                )
        self.GetChildListByNurseryID = channel.unary_unary(
                '/where_child_bus.v1.ChildService/GetChildListByNurseryID',
                request_serializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByNurseryIDRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByNurseryIDResponse.FromString,
                )
        self.GetChildListByGuardianID = channel.unary_unary(
                '/where_child_bus.v1.ChildService/GetChildListByGuardianID',
                request_serializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByGuardianIDRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByGuardianIDResponse.FromString,
                )
        self.GetChildListByBusID = channel.unary_unary(
                '/where_child_bus.v1.ChildService/GetChildListByBusID',
                request_serializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByBusIDRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByBusIDResponse.FromString,
                )
        self.CheckIsChildInBus = channel.unary_unary(
                '/where_child_bus.v1.ChildService/CheckIsChildInBus',
                request_serializer=where__child__bus_dot_v1_dot_child__pb2.CheckIsChildInBusRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_child__pb2.CheckIsChildInBusResponse.FromString,
                )
        self.UpdateChild = channel.unary_unary(
                '/where_child_bus.v1.ChildService/UpdateChild',
                request_serializer=where__child__bus_dot_v1_dot_child__pb2.UpdateChildRequest.SerializeToString,
                response_deserializer=where__child__bus_dot_v1_dot_child__pb2.UpdateChildResponse.FromString,
                )


class ChildServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def CreateChild(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def GetChildListByNurseryID(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def GetChildListByGuardianID(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def GetChildListByBusID(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def CheckIsChildInBus(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def UpdateChild(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_ChildServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'CreateChild': grpc.unary_unary_rpc_method_handler(
                    servicer.CreateChild,
                    request_deserializer=where__child__bus_dot_v1_dot_child__pb2.CreateChildRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_child__pb2.CreateChildResponse.SerializeToString,
            ),
            'GetChildListByNurseryID': grpc.unary_unary_rpc_method_handler(
                    servicer.GetChildListByNurseryID,
                    request_deserializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByNurseryIDRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByNurseryIDResponse.SerializeToString,
            ),
            'GetChildListByGuardianID': grpc.unary_unary_rpc_method_handler(
                    servicer.GetChildListByGuardianID,
                    request_deserializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByGuardianIDRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByGuardianIDResponse.SerializeToString,
            ),
            'GetChildListByBusID': grpc.unary_unary_rpc_method_handler(
                    servicer.GetChildListByBusID,
                    request_deserializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByBusIDRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_child__pb2.GetChildListByBusIDResponse.SerializeToString,
            ),
            'CheckIsChildInBus': grpc.unary_unary_rpc_method_handler(
                    servicer.CheckIsChildInBus,
                    request_deserializer=where__child__bus_dot_v1_dot_child__pb2.CheckIsChildInBusRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_child__pb2.CheckIsChildInBusResponse.SerializeToString,
            ),
            'UpdateChild': grpc.unary_unary_rpc_method_handler(
                    servicer.UpdateChild,
                    request_deserializer=where__child__bus_dot_v1_dot_child__pb2.UpdateChildRequest.FromString,
                    response_serializer=where__child__bus_dot_v1_dot_child__pb2.UpdateChildResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'where_child_bus.v1.ChildService', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class ChildService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def CreateChild(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.ChildService/CreateChild',
            where__child__bus_dot_v1_dot_child__pb2.CreateChildRequest.SerializeToString,
            where__child__bus_dot_v1_dot_child__pb2.CreateChildResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def GetChildListByNurseryID(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.ChildService/GetChildListByNurseryID',
            where__child__bus_dot_v1_dot_child__pb2.GetChildListByNurseryIDRequest.SerializeToString,
            where__child__bus_dot_v1_dot_child__pb2.GetChildListByNurseryIDResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def GetChildListByGuardianID(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.ChildService/GetChildListByGuardianID',
            where__child__bus_dot_v1_dot_child__pb2.GetChildListByGuardianIDRequest.SerializeToString,
            where__child__bus_dot_v1_dot_child__pb2.GetChildListByGuardianIDResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def GetChildListByBusID(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.ChildService/GetChildListByBusID',
            where__child__bus_dot_v1_dot_child__pb2.GetChildListByBusIDRequest.SerializeToString,
            where__child__bus_dot_v1_dot_child__pb2.GetChildListByBusIDResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def CheckIsChildInBus(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.ChildService/CheckIsChildInBus',
            where__child__bus_dot_v1_dot_child__pb2.CheckIsChildInBusRequest.SerializeToString,
            where__child__bus_dot_v1_dot_child__pb2.CheckIsChildInBusResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def UpdateChild(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/where_child_bus.v1.ChildService/UpdateChild',
            where__child__bus_dot_v1_dot_child__pb2.UpdateChildRequest.SerializeToString,
            where__child__bus_dot_v1_dot_child__pb2.UpdateChildResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
