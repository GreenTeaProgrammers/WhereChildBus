from where_child_bus.v1 import resources_pb2 as _resources_pb2
from google.protobuf import timestamp_pb2 as _timestamp_pb2
from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class CreateBusRequest(_message.Message):
    __slots__ = ("nursery_id", "name", "plate_number", "morning_guardian_ids", "evening_guardian_ids")
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    PLATE_NUMBER_FIELD_NUMBER: _ClassVar[int]
    MORNING_GUARDIAN_IDS_FIELD_NUMBER: _ClassVar[int]
    EVENING_GUARDIAN_IDS_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    name: str
    plate_number: str
    morning_guardian_ids: _containers.RepeatedScalarFieldContainer[str]
    evening_guardian_ids: _containers.RepeatedScalarFieldContainer[str]
    def __init__(self, nursery_id: _Optional[str] = ..., name: _Optional[str] = ..., plate_number: _Optional[str] = ..., morning_guardian_ids: _Optional[_Iterable[str]] = ..., evening_guardian_ids: _Optional[_Iterable[str]] = ...) -> None: ...

class CreateBusResponse(_message.Message):
    __slots__ = ("bus",)
    BUS_FIELD_NUMBER: _ClassVar[int]
    bus: _resources_pb2.Bus
    def __init__(self, bus: _Optional[_Union[_resources_pb2.Bus, _Mapping]] = ...) -> None: ...

class GetBusListByNurseryIdRequest(_message.Message):
    __slots__ = ("nursery_id",)
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    def __init__(self, nursery_id: _Optional[str] = ...) -> None: ...

class GetBusListByNurseryIdResponse(_message.Message):
    __slots__ = ("buses",)
    BUSES_FIELD_NUMBER: _ClassVar[int]
    buses: _containers.RepeatedCompositeFieldContainer[_resources_pb2.Bus]
    def __init__(self, buses: _Optional[_Iterable[_Union[_resources_pb2.Bus, _Mapping]]] = ...) -> None: ...

class ChangeBusStatusRequest(_message.Message):
    __slots__ = ("bus_id", "status")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    STATUS_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    status: _resources_pb2.Status
    def __init__(self, bus_id: _Optional[str] = ..., status: _Optional[_Union[_resources_pb2.Status, str]] = ...) -> None: ...

class ChangeBusStatusResponse(_message.Message):
    __slots__ = ("bus",)
    BUS_FIELD_NUMBER: _ClassVar[int]
    bus: _resources_pb2.Bus
    def __init__(self, bus: _Optional[_Union[_resources_pb2.Bus, _Mapping]] = ...) -> None: ...

class SendLocationContinuousRequest(_message.Message):
    __slots__ = ("bus_id", "latitude", "longitude", "timestamp")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    LATITUDE_FIELD_NUMBER: _ClassVar[int]
    LONGITUDE_FIELD_NUMBER: _ClassVar[int]
    TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    latitude: float
    longitude: float
    timestamp: _timestamp_pb2.Timestamp
    def __init__(self, bus_id: _Optional[str] = ..., latitude: _Optional[float] = ..., longitude: _Optional[float] = ..., timestamp: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class SendLocationContinuousResponse(_message.Message):
    __slots__ = ()
    def __init__(self) -> None: ...

class TrackBusContinuousRequest(_message.Message):
    __slots__ = ("bus_id",)
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    def __init__(self, bus_id: _Optional[str] = ...) -> None: ...

class TrackBusContinuousResponse(_message.Message):
    __slots__ = ("bus_id", "latitude", "longitude", "timestamp")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    LATITUDE_FIELD_NUMBER: _ClassVar[int]
    LONGITUDE_FIELD_NUMBER: _ClassVar[int]
    TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    latitude: float
    longitude: float
    timestamp: _timestamp_pb2.Timestamp
    def __init__(self, bus_id: _Optional[str] = ..., latitude: _Optional[float] = ..., longitude: _Optional[float] = ..., timestamp: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class StreamBusVideoRequest(_message.Message):
    __slots__ = ("bus_id", "bus_type", "video_type", "video_chunk", "timestamp")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    BUS_TYPE_FIELD_NUMBER: _ClassVar[int]
    VIDEO_TYPE_FIELD_NUMBER: _ClassVar[int]
    VIDEO_CHUNK_FIELD_NUMBER: _ClassVar[int]
    TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    bus_type: _resources_pb2.BusType
    video_type: _resources_pb2.VideoType
    video_chunk: bytes
    timestamp: _timestamp_pb2.Timestamp
    def __init__(self, bus_id: _Optional[str] = ..., bus_type: _Optional[_Union[_resources_pb2.BusType, str]] = ..., video_type: _Optional[_Union[_resources_pb2.VideoType, str]] = ..., video_chunk: _Optional[bytes] = ..., timestamp: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class StreamBusVideoResponse(_message.Message):
    __slots__ = ()
    def __init__(self) -> None: ...
