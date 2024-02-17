from google.protobuf.internal import containers as _containers
from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class BusType(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    BUS_TYPE_UNSPECIFIED: _ClassVar[BusType]
    BUS_TYPE_MORNING: _ClassVar[BusType]
    BUS_TYPE_EVENING: _ClassVar[BusType]

class VideoType(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    VIDEO_TYPE_UNSPECIFIED: _ClassVar[VideoType]
    VIDEO_TYPE_GET_ON: _ClassVar[VideoType]
    VIDEO_TYPE_GET_OFF: _ClassVar[VideoType]
BUS_TYPE_UNSPECIFIED: BusType
BUS_TYPE_MORNING: BusType
BUS_TYPE_EVENING: BusType
VIDEO_TYPE_UNSPECIFIED: VideoType
VIDEO_TYPE_GET_ON: VideoType
VIDEO_TYPE_GET_OFF: VideoType

class TrainRequest(_message.Message):
    __slots__ = ("nursery_id", "bus_id", "child_ids", "bus_type")
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    CHILD_IDS_FIELD_NUMBER: _ClassVar[int]
    BUS_TYPE_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    bus_id: str
    child_ids: _containers.RepeatedScalarFieldContainer[str]
    bus_type: BusType
    def __init__(self, nursery_id: _Optional[str] = ..., bus_id: _Optional[str] = ..., child_ids: _Optional[_Iterable[str]] = ..., bus_type: _Optional[_Union[BusType, str]] = ...) -> None: ...

class TrainResponse(_message.Message):
    __slots__ = ("is_started",)
    IS_STARTED_FIELD_NUMBER: _ClassVar[int]
    is_started: bool
    def __init__(self, is_started: bool = ...) -> None: ...

class PredRequest(_message.Message):
    __slots__ = ("bus_id", "bus_type", "video_type", "video_chunk", "timestamp")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    BUS_TYPE_FIELD_NUMBER: _ClassVar[int]
    VIDEO_TYPE_FIELD_NUMBER: _ClassVar[int]
    VIDEO_CHUNK_FIELD_NUMBER: _ClassVar[int]
    TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    bus_type: BusType
    video_type: VideoType
    video_chunk: bytes
    timestamp: int
    def __init__(self, bus_id: _Optional[str] = ..., bus_type: _Optional[_Union[BusType, str]] = ..., video_type: _Optional[_Union[VideoType, str]] = ..., video_chunk: _Optional[bytes] = ..., timestamp: _Optional[int] = ...) -> None: ...

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
