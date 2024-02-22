# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc

from generated.machine_learning.v1 import (
    machine_learning_pb2 as machine__learning_dot_v1_dot_machine__learning__pb2,
)
from generated.where_child_bus.v1 import (
    bus_pb2 as where__child__bus_dot_v1_dot_bus__pb2,
)


class MachineLearningServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.Train = channel.stream_stream(
            "/machine_learning.v1.MachineLearningService/Train",
            request_serializer=machine__learning_dot_v1_dot_machine__learning__pb2.TrainRequest.SerializeToString,
            response_deserializer=machine__learning_dot_v1_dot_machine__learning__pb2.TrainResponse.FromString,
        )
        self.Pred = channel.stream_stream(
            "/machine_learning.v1.MachineLearningService/Pred",
            request_serializer=where__child__bus_dot_v1_dot_bus__pb2.StreamBusVideoRequest.SerializeToString,
            response_deserializer=machine__learning_dot_v1_dot_machine__learning__pb2.PredResponse.FromString,
        )
        self.FaceDetectAndClip = channel.unary_unary(
            "/machine_learning.v1.MachineLearningService/FaceDetectAndClip",
            request_serializer=machine__learning_dot_v1_dot_machine__learning__pb2.FaceDetectAndClipRequest.SerializeToString,
            response_deserializer=machine__learning_dot_v1_dot_machine__learning__pb2.FaceDetectAndClipResponse.FromString,
        )


class MachineLearningServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def Train(self, request_iterator, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details("Method not implemented!")
        raise NotImplementedError("Method not implemented!")

    def Pred(self, request_iterator, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details("Method not implemented!")
        raise NotImplementedError("Method not implemented!")

    def FaceDetectAndClip(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details("Method not implemented!")
        raise NotImplementedError("Method not implemented!")


def add_MachineLearningServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
        "Train": grpc.stream_stream_rpc_method_handler(
            servicer.Train,
            request_deserializer=machine__learning_dot_v1_dot_machine__learning__pb2.TrainRequest.FromString,
            response_serializer=machine__learning_dot_v1_dot_machine__learning__pb2.TrainResponse.SerializeToString,
        ),
        "Pred": grpc.stream_stream_rpc_method_handler(
            servicer.Pred,
            request_deserializer=where__child__bus_dot_v1_dot_bus__pb2.StreamBusVideoRequest.FromString,
            response_serializer=machine__learning_dot_v1_dot_machine__learning__pb2.PredResponse.SerializeToString,
        ),
        "FaceDetectAndClip": grpc.unary_unary_rpc_method_handler(
            servicer.FaceDetectAndClip,
            request_deserializer=machine__learning_dot_v1_dot_machine__learning__pb2.FaceDetectAndClipRequest.FromString,
            response_serializer=machine__learning_dot_v1_dot_machine__learning__pb2.FaceDetectAndClipResponse.SerializeToString,
        ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
        "machine_learning.v1.MachineLearningService", rpc_method_handlers
    )
    server.add_generic_rpc_handlers((generic_handler,))


# This class is part of an EXPERIMENTAL API.
class MachineLearningService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def Train(
        request_iterator,
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
        return grpc.experimental.stream_stream(
            request_iterator,
            target,
            "/machine_learning.v1.MachineLearningService/Train",
            machine__learning_dot_v1_dot_machine__learning__pb2.TrainRequest.SerializeToString,
            machine__learning_dot_v1_dot_machine__learning__pb2.TrainResponse.FromString,
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
    def Pred(
        request_iterator,
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
        return grpc.experimental.stream_stream(
            request_iterator,
            target,
            "/machine_learning.v1.MachineLearningService/Pred",
            where__child__bus_dot_v1_dot_bus__pb2.StreamBusVideoRequest.SerializeToString,
            machine__learning_dot_v1_dot_machine__learning__pb2.PredResponse.FromString,
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
    def FaceDetectAndClip(
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
            "/machine_learning.v1.MachineLearningService/FaceDetectAndClip",
            machine__learning_dot_v1_dot_machine__learning__pb2.FaceDetectAndClipRequest.SerializeToString,
            machine__learning_dot_v1_dot_machine__learning__pb2.FaceDetectAndClipResponse.FromString,
            options,
            channel_credentials,
            insecure,
            call_credentials,
            compression,
            wait_for_ready,
            timeout,
            metadata,
        )
