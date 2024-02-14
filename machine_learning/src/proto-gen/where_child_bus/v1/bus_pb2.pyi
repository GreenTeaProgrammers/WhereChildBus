from where_child_bus.v1 import resources_pb2 as _resources_pb2
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
