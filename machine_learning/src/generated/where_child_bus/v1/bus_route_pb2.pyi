from where_child_bus.v1 import resources_pb2 as _resources_pb2
from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class CreateBusRouteRequest(_message.Message):
    __slots__ = ("bus_id", "bus_type", "nursery_id", "guardian_ids")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    BUS_TYPE_FIELD_NUMBER: _ClassVar[int]
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    GUARDIAN_IDS_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    bus_type: _resources_pb2.BusType
    nursery_id: str
    guardian_ids: _containers.RepeatedScalarFieldContainer[str]
    def __init__(self, bus_id: _Optional[str] = ..., bus_type: _Optional[_Union[_resources_pb2.BusType, str]] = ..., nursery_id: _Optional[str] = ..., guardian_ids: _Optional[_Iterable[str]] = ...) -> None: ...

class CreateBusRouteResponse(_message.Message):
    __slots__ = ("bus_route",)
    BUS_ROUTE_FIELD_NUMBER: _ClassVar[int]
    bus_route: _resources_pb2.BusRoute
    def __init__(self, bus_route: _Optional[_Union[_resources_pb2.BusRoute, _Mapping]] = ...) -> None: ...

class GetBusRouteByBusIDRequest(_message.Message):
    __slots__ = ("bus_id", "bus_type")
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    BUS_TYPE_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    bus_type: _resources_pb2.BusType
    def __init__(self, bus_id: _Optional[str] = ..., bus_type: _Optional[_Union[_resources_pb2.BusType, str]] = ...) -> None: ...

class GetBusRouteByBusIDResponse(_message.Message):
    __slots__ = ("bus_route",)
    BUS_ROUTE_FIELD_NUMBER: _ClassVar[int]
    bus_route: _resources_pb2.BusRoute
    def __init__(self, bus_route: _Optional[_Union[_resources_pb2.BusRoute, _Mapping]] = ...) -> None: ...
