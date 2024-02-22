from where_child_bus.v1 import bus_pb2 as _bus_pb2
from where_child_bus.v1 import resources_pb2 as _resources_pb2
from google.protobuf.internal import containers as _containers
from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class Status(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    STATUS_UNSPECIFIED: _ClassVar[Status]
    STATUS_SUCCESS: _ClassVar[Status]
    STATUS_PROCESSING: _ClassVar[Status]
    STATUS_FAILED: _ClassVar[Status]
    STATUS_WAITING: _ClassVar[Status]
STATUS_UNSPECIFIED: Status
STATUS_SUCCESS: Status
STATUS_PROCESSING: Status
STATUS_FAILED: Status
STATUS_WAITING: Status

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
    def __init__(self, nursery_id: _Optional[str] = ..., bus_id: _Optional[str] = ..., child_ids: _Optional[_Iterable[str]] = ..., bus_type: _Optional[_Union[_resources_pb2.BusType, str]] = ...) -> None: ...

class TrainResponse(_message.Message):
    __slots__ = ("status",)
    STATUS_FIELD_NUMBER: _ClassVar[int]
    status: Status
    def __init__(self, status: _Optional[_Union[Status, str]] = ...) -> None: ...

class PredResponse(_message.Message):
    __slots__ = ("is_detected", "child_ids")
    IS_DETECTED_FIELD_NUMBER: _ClassVar[int]
    CHILD_IDS_FIELD_NUMBER: _ClassVar[int]
    is_detected: bool
    child_ids: _containers.RepeatedScalarFieldContainer[str]
    def __init__(self, is_detected: bool = ..., child_ids: _Optional[_Iterable[str]] = ...) -> None: ...

class FaceDetectAndClipRequest(_message.Message):
    __slots__ = ("nursery_id", "child_id")
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    child_id: str
    def __init__(self, nursery_id: _Optional[str] = ..., child_id: _Optional[str] = ...) -> None: ...

class FaceDetectAndClipResponse(_message.Message):
    __slots__ = ("is_started",)
    IS_STARTED_FIELD_NUMBER: _ClassVar[int]
    is_started: bool
    def __init__(self, is_started: bool = ...) -> None: ...
