from where_child_bus.v1 import resources_pb2 as _resources_pb2
from google.protobuf import field_mask_pb2 as _field_mask_pb2
from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class UpdateStationLocationByGuardianIdRequest(_message.Message):
    __slots__ = ("guardian_id", "longitude", "latitude")
    GUARDIAN_ID_FIELD_NUMBER: _ClassVar[int]
    LONGITUDE_FIELD_NUMBER: _ClassVar[int]
    LATITUDE_FIELD_NUMBER: _ClassVar[int]
    guardian_id: str
    longitude: float
    latitude: float
    def __init__(self, guardian_id: _Optional[str] = ..., longitude: _Optional[float] = ..., latitude: _Optional[float] = ...) -> None: ...

class UpdateStationLocationByGuardianIdResponse(_message.Message):
    __slots__ = ("station",)
    STATION_FIELD_NUMBER: _ClassVar[int]
    station: _resources_pb2.Station
    def __init__(self, station: _Optional[_Union[_resources_pb2.Station, _Mapping]] = ...) -> None: ...

class GetStationListByBusIdRequest(_message.Message):
    __slots__ = ("bus_id",)
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    def __init__(self, bus_id: _Optional[str] = ...) -> None: ...

class GetStationListByBusIdResponse(_message.Message):
    __slots__ = ("stations", "guardians", "children", "photos")
    STATIONS_FIELD_NUMBER: _ClassVar[int]
    GUARDIANS_FIELD_NUMBER: _ClassVar[int]
    CHILDREN_FIELD_NUMBER: _ClassVar[int]
    PHOTOS_FIELD_NUMBER: _ClassVar[int]
    stations: _containers.RepeatedCompositeFieldContainer[_resources_pb2.Station]
    guardians: _containers.RepeatedCompositeFieldContainer[_resources_pb2.GuardianResponse]
    children: _containers.RepeatedCompositeFieldContainer[_resources_pb2.Child]
    photos: _containers.RepeatedCompositeFieldContainer[_resources_pb2.ChildPhoto]
    def __init__(self, stations: _Optional[_Iterable[_Union[_resources_pb2.Station, _Mapping]]] = ..., guardians: _Optional[_Iterable[_Union[_resources_pb2.GuardianResponse, _Mapping]]] = ..., children: _Optional[_Iterable[_Union[_resources_pb2.Child, _Mapping]]] = ..., photos: _Optional[_Iterable[_Union[_resources_pb2.ChildPhoto, _Mapping]]] = ...) -> None: ...

class UpdateStationRequest(_message.Message):
    __slots__ = ("id", "morning_next_station_id", "morning_evening_station_id", "latitude", "longitude", "morning_order", "morning_evening_order", "update_mask")
    ID_FIELD_NUMBER: _ClassVar[int]
    MORNING_NEXT_STATION_ID_FIELD_NUMBER: _ClassVar[int]
    MORNING_EVENING_STATION_ID_FIELD_NUMBER: _ClassVar[int]
    LATITUDE_FIELD_NUMBER: _ClassVar[int]
    LONGITUDE_FIELD_NUMBER: _ClassVar[int]
    MORNING_ORDER_FIELD_NUMBER: _ClassVar[int]
    MORNING_EVENING_ORDER_FIELD_NUMBER: _ClassVar[int]
    UPDATE_MASK_FIELD_NUMBER: _ClassVar[int]
    id: str
    morning_next_station_id: str
    morning_evening_station_id: str
    latitude: float
    longitude: float
    morning_order: int
    morning_evening_order: int
    update_mask: _field_mask_pb2.FieldMask
    def __init__(self, id: _Optional[str] = ..., morning_next_station_id: _Optional[str] = ..., morning_evening_station_id: _Optional[str] = ..., latitude: _Optional[float] = ..., longitude: _Optional[float] = ..., morning_order: _Optional[int] = ..., morning_evening_order: _Optional[int] = ..., update_mask: _Optional[_Union[_field_mask_pb2.FieldMask, _Mapping]] = ...) -> None: ...

class UpdateStationResponse(_message.Message):
    __slots__ = ("station",)
    STATION_FIELD_NUMBER: _ClassVar[int]
    station: _resources_pb2.Station
    def __init__(self, station: _Optional[_Union[_resources_pb2.Station, _Mapping]] = ...) -> None: ...
