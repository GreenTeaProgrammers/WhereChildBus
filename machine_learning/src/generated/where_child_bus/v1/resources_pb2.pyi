from google.protobuf import timestamp_pb2 as _timestamp_pb2
from google.protobuf.internal import containers as _containers
from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class BusStatus(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    BUS_STATUS_UNSPECIFIED: _ClassVar[BusStatus]
    BUS_STATUS_STOPPED: _ClassVar[BusStatus]
    BUS_STATUS_RUNNING: _ClassVar[BusStatus]
    BUS_STATUS_MAINTENANCE: _ClassVar[BusStatus]

class VehicleEvent(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    VEHICLE_EVENT_UNSPECIFIED: _ClassVar[VehicleEvent]
    VEHICLE_EVENT_GET_ON: _ClassVar[VehicleEvent]
    VEHICLE_EVENT_GET_OFF: _ClassVar[VehicleEvent]

class Sex(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    SEX_UNSPECIFIED: _ClassVar[Sex]
    SEX_MAN: _ClassVar[Sex]
    SEX_WOMAN: _ClassVar[Sex]
    SEX_OTHER: _ClassVar[Sex]

class BusType(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    BUS_TYPE_UNSPECIFIED: _ClassVar[BusType]
    BUS_TYPE_MORNING: _ClassVar[BusType]
    BUS_TYPE_EVENING: _ClassVar[BusType]
BUS_STATUS_UNSPECIFIED: BusStatus
BUS_STATUS_STOPPED: BusStatus
BUS_STATUS_RUNNING: BusStatus
BUS_STATUS_MAINTENANCE: BusStatus
VEHICLE_EVENT_UNSPECIFIED: VehicleEvent
VEHICLE_EVENT_GET_ON: VehicleEvent
VEHICLE_EVENT_GET_OFF: VehicleEvent
SEX_UNSPECIFIED: Sex
SEX_MAN: Sex
SEX_WOMAN: Sex
SEX_OTHER: Sex
BUS_TYPE_UNSPECIFIED: BusType
BUS_TYPE_MORNING: BusType
BUS_TYPE_EVENING: BusType

class Nursery(_message.Message):
    __slots__ = ("id", "nursery_code", "name", "address", "phone_number", "email", "hashed_password", "created_at", "updated_at")
    ID_FIELD_NUMBER: _ClassVar[int]
    NURSERY_CODE_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    ADDRESS_FIELD_NUMBER: _ClassVar[int]
    PHONE_NUMBER_FIELD_NUMBER: _ClassVar[int]
    EMAIL_FIELD_NUMBER: _ClassVar[int]
    HASHED_PASSWORD_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    UPDATED_AT_FIELD_NUMBER: _ClassVar[int]
    id: str
    nursery_code: str
    name: str
    address: str
    phone_number: str
    email: str
    hashed_password: str
    created_at: _timestamp_pb2.Timestamp
    updated_at: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., nursery_code: _Optional[str] = ..., name: _Optional[str] = ..., address: _Optional[str] = ..., phone_number: _Optional[str] = ..., email: _Optional[str] = ..., hashed_password: _Optional[str] = ..., created_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ..., updated_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class NurseryResponse(_message.Message):
    __slots__ = ("id", "nursery_code", "name", "address", "phone_number", "email", "created_at", "updated_at")
    ID_FIELD_NUMBER: _ClassVar[int]
    NURSERY_CODE_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    ADDRESS_FIELD_NUMBER: _ClassVar[int]
    PHONE_NUMBER_FIELD_NUMBER: _ClassVar[int]
    EMAIL_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    UPDATED_AT_FIELD_NUMBER: _ClassVar[int]
    id: str
    nursery_code: str
    name: str
    address: str
    phone_number: str
    email: str
    created_at: _timestamp_pb2.Timestamp
    updated_at: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., nursery_code: _Optional[str] = ..., name: _Optional[str] = ..., address: _Optional[str] = ..., phone_number: _Optional[str] = ..., email: _Optional[str] = ..., created_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ..., updated_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class Guardian(_message.Message):
    __slots__ = ("id", "nursery_id", "name", "email", "phone_number", "hashed_password", "is_use_morning_bus", "is_use_evening_bus", "created_at", "updated_at")
    ID_FIELD_NUMBER: _ClassVar[int]
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    EMAIL_FIELD_NUMBER: _ClassVar[int]
    PHONE_NUMBER_FIELD_NUMBER: _ClassVar[int]
    HASHED_PASSWORD_FIELD_NUMBER: _ClassVar[int]
    IS_USE_MORNING_BUS_FIELD_NUMBER: _ClassVar[int]
    IS_USE_EVENING_BUS_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    UPDATED_AT_FIELD_NUMBER: _ClassVar[int]
    id: str
    nursery_id: str
    name: str
    email: str
    phone_number: str
    hashed_password: str
    is_use_morning_bus: bool
    is_use_evening_bus: bool
    created_at: _timestamp_pb2.Timestamp
    updated_at: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., nursery_id: _Optional[str] = ..., name: _Optional[str] = ..., email: _Optional[str] = ..., phone_number: _Optional[str] = ..., hashed_password: _Optional[str] = ..., is_use_morning_bus: bool = ..., is_use_evening_bus: bool = ..., created_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ..., updated_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class GuardianResponse(_message.Message):
    __slots__ = ("id", "nursery_id", "name", "email", "phone_number", "is_use_morning_bus", "is_use_evening_bus", "created_at", "updated_at")
    ID_FIELD_NUMBER: _ClassVar[int]
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    EMAIL_FIELD_NUMBER: _ClassVar[int]
    PHONE_NUMBER_FIELD_NUMBER: _ClassVar[int]
    IS_USE_MORNING_BUS_FIELD_NUMBER: _ClassVar[int]
    IS_USE_EVENING_BUS_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    UPDATED_AT_FIELD_NUMBER: _ClassVar[int]
    id: str
    nursery_id: str
    name: str
    email: str
    phone_number: str
    is_use_morning_bus: bool
    is_use_evening_bus: bool
    created_at: _timestamp_pb2.Timestamp
    updated_at: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., nursery_id: _Optional[str] = ..., name: _Optional[str] = ..., email: _Optional[str] = ..., phone_number: _Optional[str] = ..., is_use_morning_bus: bool = ..., is_use_evening_bus: bool = ..., created_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ..., updated_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class Bus(_message.Message):
    __slots__ = ("id", "nursery_id", "name", "plate_number", "bus_status", "latitude", "longitude", "enable_face_recognition", "next_station_id", "created_at", "updated_at")
    ID_FIELD_NUMBER: _ClassVar[int]
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    PLATE_NUMBER_FIELD_NUMBER: _ClassVar[int]
    BUS_STATUS_FIELD_NUMBER: _ClassVar[int]
    LATITUDE_FIELD_NUMBER: _ClassVar[int]
    LONGITUDE_FIELD_NUMBER: _ClassVar[int]
    ENABLE_FACE_RECOGNITION_FIELD_NUMBER: _ClassVar[int]
    NEXT_STATION_ID_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    UPDATED_AT_FIELD_NUMBER: _ClassVar[int]
    id: str
    nursery_id: str
    name: str
    plate_number: str
    bus_status: BusStatus
    latitude: float
    longitude: float
    enable_face_recognition: bool
    next_station_id: str
    created_at: _timestamp_pb2.Timestamp
    updated_at: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., nursery_id: _Optional[str] = ..., name: _Optional[str] = ..., plate_number: _Optional[str] = ..., bus_status: _Optional[_Union[BusStatus, str]] = ..., latitude: _Optional[float] = ..., longitude: _Optional[float] = ..., enable_face_recognition: bool = ..., next_station_id: _Optional[str] = ..., created_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ..., updated_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class Child(_message.Message):
    __slots__ = ("id", "nursery_id", "guardian_id", "name", "age", "sex", "check_for_missing_items", "has_bag", "has_lunch_box", "has_water_bottle", "has_umbrella", "has_other", "created_at", "updated_at")
    ID_FIELD_NUMBER: _ClassVar[int]
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    GUARDIAN_ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    AGE_FIELD_NUMBER: _ClassVar[int]
    SEX_FIELD_NUMBER: _ClassVar[int]
    CHECK_FOR_MISSING_ITEMS_FIELD_NUMBER: _ClassVar[int]
    HAS_BAG_FIELD_NUMBER: _ClassVar[int]
    HAS_LUNCH_BOX_FIELD_NUMBER: _ClassVar[int]
    HAS_WATER_BOTTLE_FIELD_NUMBER: _ClassVar[int]
    HAS_UMBRELLA_FIELD_NUMBER: _ClassVar[int]
    HAS_OTHER_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    UPDATED_AT_FIELD_NUMBER: _ClassVar[int]
    id: str
    nursery_id: str
    guardian_id: str
    name: str
    age: int
    sex: Sex
    check_for_missing_items: bool
    has_bag: bool
    has_lunch_box: bool
    has_water_bottle: bool
    has_umbrella: bool
    has_other: bool
    created_at: _timestamp_pb2.Timestamp
    updated_at: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., nursery_id: _Optional[str] = ..., guardian_id: _Optional[str] = ..., name: _Optional[str] = ..., age: _Optional[int] = ..., sex: _Optional[_Union[Sex, str]] = ..., check_for_missing_items: bool = ..., has_bag: bool = ..., has_lunch_box: bool = ..., has_water_bottle: bool = ..., has_umbrella: bool = ..., has_other: bool = ..., created_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ..., updated_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class Station(_message.Message):
    __slots__ = ("id", "guardian_id", "latitude", "longitude", "created_at", "updated_at")
    ID_FIELD_NUMBER: _ClassVar[int]
    GUARDIAN_ID_FIELD_NUMBER: _ClassVar[int]
    LATITUDE_FIELD_NUMBER: _ClassVar[int]
    LONGITUDE_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    UPDATED_AT_FIELD_NUMBER: _ClassVar[int]
    id: str
    guardian_id: str
    latitude: float
    longitude: float
    created_at: _timestamp_pb2.Timestamp
    updated_at: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., guardian_id: _Optional[str] = ..., latitude: _Optional[float] = ..., longitude: _Optional[float] = ..., created_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ..., updated_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class ChildBusAssociation(_message.Message):
    __slots__ = ("bus_route_id", "child_id")
    BUS_ROUTE_ID_FIELD_NUMBER: _ClassVar[int]
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    bus_route_id: str
    child_id: str
    def __init__(self, bus_route_id: _Optional[str] = ..., child_id: _Optional[str] = ...) -> None: ...

class ChildPhoto(_message.Message):
    __slots__ = ("id", "child_id", "photo_data", "created_at", "updated_at")
    ID_FIELD_NUMBER: _ClassVar[int]
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    PHOTO_DATA_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    UPDATED_AT_FIELD_NUMBER: _ClassVar[int]
    id: str
    child_id: str
    photo_data: bytes
    created_at: _timestamp_pb2.Timestamp
    updated_at: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., child_id: _Optional[str] = ..., photo_data: _Optional[bytes] = ..., created_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ..., updated_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class BoardingRecord(_message.Message):
    __slots__ = ("id", "child_id", "bus_id", "is_boarding", "timestamp")
    ID_FIELD_NUMBER: _ClassVar[int]
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    IS_BOARDING_FIELD_NUMBER: _ClassVar[int]
    TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    id: str
    child_id: str
    bus_id: str
    is_boarding: bool
    timestamp: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., child_id: _Optional[str] = ..., bus_id: _Optional[str] = ..., is_boarding: bool = ..., timestamp: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class BusRoute(_message.Message):
    __slots__ = ("id", "bus_id", "ordered_station_ids", "bus_type")
    ID_FIELD_NUMBER: _ClassVar[int]
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    ORDERED_STATION_IDS_FIELD_NUMBER: _ClassVar[int]
    BUS_TYPE_FIELD_NUMBER: _ClassVar[int]
    id: str
    bus_id: str
    ordered_station_ids: _containers.RepeatedScalarFieldContainer[str]
    bus_type: BusType
    def __init__(self, id: _Optional[str] = ..., bus_id: _Optional[str] = ..., ordered_station_ids: _Optional[_Iterable[str]] = ..., bus_type: _Optional[_Union[BusType, str]] = ...) -> None: ...
