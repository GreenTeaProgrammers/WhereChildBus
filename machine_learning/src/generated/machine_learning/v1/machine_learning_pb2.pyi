from typing import ClassVar as _ClassVar
from typing import Iterable as _Iterable
from typing import Optional as _Optional
from typing import Union as _Union

from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf.internal import containers as _containers
from where_child_bus.v1 import bus_pb2 as _bus_pb2
from where_child_bus.v1 import resources_pb2 as _resources_pb2

DESCRIPTOR: _descriptor.FileDescriptor

class TrainRequest(_message.Message):
    __slots__ = ("nursery_id", "bus_id", "child_ids", "bus_type")
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    CHILD_IDS_FIELD_NUMBER: _ClassVar[int]
    BUS_TYPE_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    bus_id: str
    child_ids: _containers.RepeatedScalarFieldContainer[str]
    bus_type: _resources_pb2.BusType
    def __init__(
        self,
        nursery_id: _Optional[str] = ...,
        bus_id: _Optional[str] = ...,
        child_ids: _Optional[_Iterable[str]] = ...,
        bus_type: _Optional[_Union[_resources_pb2.BusType, str]] = ...,
    ) -> None: ...

class TrainResponse(_message.Message):
    __slots__ = ("is_started",)
    IS_STARTED_FIELD_NUMBER: _ClassVar[int]
    is_started: bool
    def __init__(self, is_started: bool = ...) -> None: ...

class PredResponse(_message.Message):
    __slots__ = ("is_detected", "child_ids")
    IS_DETECTED_FIELD_NUMBER: _ClassVar[int]
    CHILD_IDS_FIELD_NUMBER: _ClassVar[int]
    is_detected: bool
    child_ids: _containers.RepeatedScalarFieldContainer[str]
    def __init__(
        self, is_detected: bool = ..., child_ids: _Optional[_Iterable[str]] = ...
    ) -> None: ...

class FaceDetectAndClipRequest(_message.Message):
    __slots__ = ("nursery_id", "child_id")
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    child_id: str
    def __init__(
        self, nursery_id: _Optional[str] = ..., child_id: _Optional[str] = ...
    ) -> None: ...

class FaceDetectAndClipResponse(_message.Message):
    __slots__ = ("is_started",)
    IS_STARTED_FIELD_NUMBER: _ClassVar[int]
    is_started: bool
    def __init__(self, is_started: bool = ...) -> None: ...
