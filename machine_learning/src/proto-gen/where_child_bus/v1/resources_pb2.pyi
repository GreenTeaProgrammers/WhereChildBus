from google.protobuf import timestamp_pb2 as _timestamp_pb2
from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class Status(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    STATUS_UNSPECIFIED: _ClassVar[Status]
    STATUS_STOPPED: _ClassVar[Status]
    STATUS_RUNNING: _ClassVar[Status]
    STATUS_MAINTEINANCE: _ClassVar[Status]

class VideoType(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    VIDEO_TYPE_UNSPECIFIED: _ClassVar[VideoType]
    VIDEO_TYPE_GET_ON: _ClassVar[VideoType]
    VIDEO_TYPE_GET_OFF: _ClassVar[VideoType]

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
STATUS_UNSPECIFIED: Status
STATUS_STOPPED: Status
STATUS_RUNNING: Status
STATUS_MAINTEINANCE: Status
VIDEO_TYPE_UNSPECIFIED: VideoType
VIDEO_TYPE_GET_ON: VideoType
VIDEO_TYPE_GET_OFF: VideoType
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
    __slots__ = ("id", "nursery_id", "name", "plate_number", "status", "latitude", "longitude", "enable_face_recognition", "created_at", "updated_at")
    ID_FIELD_NUMBER: _ClassVar[int]
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    PLATE_NUMBER_FIELD_NUMBER: _ClassVar[int]
    STATUS_FIELD_NUMBER: _ClassVar[int]
    LATITUDE_FIELD_NUMBER: _ClassVar[int]
    LONGITUDE_FIELD_NUMBER: _ClassVar[int]
    ENABLE_FACE_RECOGNITION_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    UPDATED_AT_FIELD_NUMBER: _ClassVar[int]
    id: str
    nursery_id: str
    name: str
    plate_number: str
    status: Status
    latitude: float
    longitude: float
    enable_face_recognition: bool
    created_at: _timestamp_pb2.Timestamp
    updated_at: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., nursery_id: _Optional[str] = ..., name: _Optional[str] = ..., plate_number: _Optional[str] = ..., status: _Optional[_Union[Status, str]] = ..., latitude: _Optional[float] = ..., longitude: _Optional[float] = ..., enable_face_recognition: bool = ..., created_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ..., updated_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

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
    __slots__ = ("id", "guardian_id", "morning_next_station_id", "evening_next_station_id", "latitude", "longitude", "morning_order", "evening_order", "created_at", "updated_at")
    ID_FIELD_NUMBER: _ClassVar[int]
    GUARDIAN_ID_FIELD_NUMBER: _ClassVar[int]
    MORNING_NEXT_STATION_ID_FIELD_NUMBER: _ClassVar[int]
    EVENING_NEXT_STATION_ID_FIELD_NUMBER: _ClassVar[int]
    LATITUDE_FIELD_NUMBER: _ClassVar[int]
    LONGITUDE_FIELD_NUMBER: _ClassVar[int]
    MORNING_ORDER_FIELD_NUMBER: _ClassVar[int]
    EVENING_ORDER_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    UPDATED_AT_FIELD_NUMBER: _ClassVar[int]
    id: str
    guardian_id: str
    morning_next_station_id: str
    evening_next_station_id: str
    latitude: float
    longitude: float
    morning_order: int
    evening_order: int
    created_at: _timestamp_pb2.Timestamp
    updated_at: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., guardian_id: _Optional[str] = ..., morning_next_station_id: _Optional[str] = ..., evening_next_station_id: _Optional[str] = ..., latitude: _Optional[float] = ..., longitude: _Optional[float] = ..., morning_order: _Optional[int] = ..., evening_order: _Optional[int] = ..., created_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ..., updated_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

class ChildBusAssociation(_message.Message):
    __slots__ = ("id", "bus_id", "child_id", "bus_type")
    ID_FIELD_NUMBER: _ClassVar[int]
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    BUS_TYPE_FIELD_NUMBER: _ClassVar[int]
    id: str
    bus_id: str
    child_id: str
    bus_type: BusType
    def __init__(self, id: _Optional[str] = ..., bus_id: _Optional[str] = ..., child_id: _Optional[str] = ..., bus_type: _Optional[_Union[BusType, str]] = ...) -> None: ...

class BusStationAssociation(_message.Message):
    __slots__ = ("bus_id", "station_id")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    STATION_ID_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    station_id: str
    def __init__(self, bus_id: _Optional[str] = ..., station_id: _Optional[str] = ...) -> None: ...

class ChildPhoto(_message.Message):
    __slots__ = ("id", "child_id", "photo", "created_at", "updated_at")
    ID_FIELD_NUMBER: _ClassVar[int]
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    PHOTO_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    UPDATED_AT_FIELD_NUMBER: _ClassVar[int]
    id: str
    child_id: str
    photo: bytes
    created_at: _timestamp_pb2.Timestamp
    updated_at: _timestamp_pb2.Timestamp
    def __init__(self, id: _Optional[str] = ..., child_id: _Optional[str] = ..., photo: _Optional[bytes] = ..., created_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ..., updated_at: _Optional[_Union[_timestamp_pb2.Timestamp, _Mapping]] = ...) -> None: ...

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
