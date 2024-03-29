from where_child_bus.v1 import resources_pb2 as _resources_pb2
from google.protobuf import field_mask_pb2 as _field_mask_pb2
from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class CreateBusRequest(_message.Message):
    __slots__ = ("nursery_id", "name", "plate_number")
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    PLATE_NUMBER_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    name: str
    plate_number: str
    def __init__(self, nursery_id: _Optional[str] = ..., name: _Optional[str] = ..., plate_number: _Optional[str] = ...) -> None: ...

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

class GetRunningBusByGuardianIdRequest(_message.Message):
    __slots__ = ("guardian_id",)
    GUARDIAN_ID_FIELD_NUMBER: _ClassVar[int]
    guardian_id: str
    def __init__(self, guardian_id: _Optional[str] = ...) -> None: ...

class GetRunningBusByGuardianIdResponse(_message.Message):
    __slots__ = ("bus",)
    BUS_FIELD_NUMBER: _ClassVar[int]
    bus: _resources_pb2.Bus
    def __init__(self, bus: _Optional[_Union[_resources_pb2.Bus, _Mapping]] = ...) -> None: ...

class ChangeBusStatusRequest(_message.Message):
    __slots__ = ("bus_id", "bus_status", "bus_type")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    BUS_STATUS_FIELD_NUMBER: _ClassVar[int]
    BUS_TYPE_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    bus_status: _resources_pb2.BusStatus
    bus_type: _resources_pb2.BusType
    def __init__(self, bus_id: _Optional[str] = ..., bus_status: _Optional[_Union[_resources_pb2.BusStatus, str]] = ..., bus_type: _Optional[_Union[_resources_pb2.BusType, str]] = ...) -> None: ...

class ChangeBusStatusResponse(_message.Message):
    __slots__ = ("bus",)
    BUS_FIELD_NUMBER: _ClassVar[int]
    bus: _resources_pb2.Bus
    def __init__(self, bus: _Optional[_Union[_resources_pb2.Bus, _Mapping]] = ...) -> None: ...

class SendLocationContinuousRequest(_message.Message):
    __slots__ = ("bus_id", "latitude", "longitude")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    LATITUDE_FIELD_NUMBER: _ClassVar[int]
    LONGITUDE_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    latitude: float
    longitude: float
    def __init__(self, bus_id: _Optional[str] = ..., latitude: _Optional[float] = ..., longitude: _Optional[float] = ...) -> None: ...

class SendLocationContinuousResponse(_message.Message):
    __slots__ = ()
    def __init__(self) -> None: ...

class TrackBusContinuousRequest(_message.Message):
    __slots__ = ("bus_id",)
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    def __init__(self, bus_id: _Optional[str] = ...) -> None: ...

class TrackBusContinuousResponse(_message.Message):
    __slots__ = ("bus_id", "latitude", "longitude", "next_station_id")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    LATITUDE_FIELD_NUMBER: _ClassVar[int]
    LONGITUDE_FIELD_NUMBER: _ClassVar[int]
    NEXT_STATION_ID_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    latitude: float
    longitude: float
    next_station_id: str
    def __init__(self, bus_id: _Optional[str] = ..., latitude: _Optional[float] = ..., longitude: _Optional[float] = ..., next_station_id: _Optional[str] = ...) -> None: ...

class StreamBusVideoRequest(_message.Message):
    __slots__ = ("bus_id", "nursery_id", "bus_type", "vehicle_event", "video_chunk", "photo_height", "photo_width")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    BUS_TYPE_FIELD_NUMBER: _ClassVar[int]
    VEHICLE_EVENT_FIELD_NUMBER: _ClassVar[int]
    VIDEO_CHUNK_FIELD_NUMBER: _ClassVar[int]
    PHOTO_HEIGHT_FIELD_NUMBER: _ClassVar[int]
    PHOTO_WIDTH_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    nursery_id: str
    bus_type: _resources_pb2.BusType
    vehicle_event: _resources_pb2.VehicleEvent
    video_chunk: _containers.RepeatedScalarFieldContainer[bytes]
    photo_height: int
    photo_width: int
    def __init__(self, bus_id: _Optional[str] = ..., nursery_id: _Optional[str] = ..., bus_type: _Optional[_Union[_resources_pb2.BusType, str]] = ..., vehicle_event: _Optional[_Union[_resources_pb2.VehicleEvent, str]] = ..., video_chunk: _Optional[_Iterable[bytes]] = ..., photo_height: _Optional[int] = ..., photo_width: _Optional[int] = ...) -> None: ...

class StreamBusVideoResponse(_message.Message):
    __slots__ = ("is_detected", "children")
    IS_DETECTED_FIELD_NUMBER: _ClassVar[int]
    CHILDREN_FIELD_NUMBER: _ClassVar[int]
    is_detected: bool
    children: _containers.RepeatedCompositeFieldContainer[_resources_pb2.Child]
    def __init__(self, is_detected: bool = ..., children: _Optional[_Iterable[_Union[_resources_pb2.Child, _Mapping]]] = ...) -> None: ...

class UpdateBusRequest(_message.Message):
    __slots__ = ("bus_id", "name", "plate_number", "latitude", "longitude", "enable_face_recognition", "next_station_id", "update_mask")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    PLATE_NUMBER_FIELD_NUMBER: _ClassVar[int]
    LATITUDE_FIELD_NUMBER: _ClassVar[int]
    LONGITUDE_FIELD_NUMBER: _ClassVar[int]
    ENABLE_FACE_RECOGNITION_FIELD_NUMBER: _ClassVar[int]
    NEXT_STATION_ID_FIELD_NUMBER: _ClassVar[int]
    UPDATE_MASK_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    name: str
    plate_number: str
    latitude: float
    longitude: float
    enable_face_recognition: bool
    next_station_id: str
    update_mask: _field_mask_pb2.FieldMask
    def __init__(self, bus_id: _Optional[str] = ..., name: _Optional[str] = ..., plate_number: _Optional[str] = ..., latitude: _Optional[float] = ..., longitude: _Optional[float] = ..., enable_face_recognition: bool = ..., next_station_id: _Optional[str] = ..., update_mask: _Optional[_Union[_field_mask_pb2.FieldMask, _Mapping]] = ...) -> None: ...

class UpdateBusResponse(_message.Message):
    __slots__ = ("bus",)
    BUS_FIELD_NUMBER: _ClassVar[int]
    bus: _resources_pb2.Bus
    def __init__(self, bus: _Optional[_Union[_resources_pb2.Bus, _Mapping]] = ...) -> None: ...
