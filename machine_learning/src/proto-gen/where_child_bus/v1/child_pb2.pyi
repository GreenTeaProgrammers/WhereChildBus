from where_child_bus.v1 import resources_pb2 as _resources_pb2
from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class CreateChildRequest(_message.Message):
    __slots__ = ("nursery_id", "guardian_id", "name", "age", "sex", "photos")
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    GUARDIAN_ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    AGE_FIELD_NUMBER: _ClassVar[int]
    SEX_FIELD_NUMBER: _ClassVar[int]
    PHOTOS_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    guardian_id: str
    name: str
    age: int
    sex: _resources_pb2.Sex
    photos: _containers.RepeatedScalarFieldContainer[bytes]
    def __init__(self, nursery_id: _Optional[str] = ..., guardian_id: _Optional[str] = ..., name: _Optional[str] = ..., age: _Optional[int] = ..., sex: _Optional[_Union[_resources_pb2.Sex, str]] = ..., photos: _Optional[_Iterable[bytes]] = ...) -> None: ...

class CreateChildResponse(_message.Message):
    __slots__ = ("child",)
    CHILD_FIELD_NUMBER: _ClassVar[int]
    child: _resources_pb2.Child
    def __init__(self, child: _Optional[_Union[_resources_pb2.Child, _Mapping]] = ...) -> None: ...

class GetChildListByNurseryIDRequest(_message.Message):
    __slots__ = ("nursery_id",)
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    def __init__(self, nursery_id: _Optional[str] = ...) -> None: ...

class GetChildListByNurseryIDResponse(_message.Message):
    __slots__ = ("children", "photos")
    CHILDREN_FIELD_NUMBER: _ClassVar[int]
    PHOTOS_FIELD_NUMBER: _ClassVar[int]
    children: _containers.RepeatedCompositeFieldContainer[_resources_pb2.Child]
    photos: _containers.RepeatedCompositeFieldContainer[_resources_pb2.ChildPhoto]
    def __init__(self, children: _Optional[_Iterable[_Union[_resources_pb2.Child, _Mapping]]] = ..., photos: _Optional[_Iterable[_Union[_resources_pb2.ChildPhoto, _Mapping]]] = ...) -> None: ...

class GetChildListByGuardianIDRequest(_message.Message):
    __slots__ = ("guardian_id",)
    GUARDIAN_ID_FIELD_NUMBER: _ClassVar[int]
    guardian_id: str
    def __init__(self, guardian_id: _Optional[str] = ...) -> None: ...

class GetChildListByGuardianIDResponse(_message.Message):
    __slots__ = ("children", "photos")
    CHILDREN_FIELD_NUMBER: _ClassVar[int]
    PHOTOS_FIELD_NUMBER: _ClassVar[int]
    children: _containers.RepeatedCompositeFieldContainer[_resources_pb2.Child]
    photos: _containers.RepeatedCompositeFieldContainer[_resources_pb2.ChildPhoto]
    def __init__(self, children: _Optional[_Iterable[_Union[_resources_pb2.Child, _Mapping]]] = ..., photos: _Optional[_Iterable[_Union[_resources_pb2.ChildPhoto, _Mapping]]] = ...) -> None: ...

class GetChildListByBusIDRequest(_message.Message):
    __slots__ = ("bus_id",)
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    def __init__(self, bus_id: _Optional[str] = ...) -> None: ...

class GetChildListByBusIDResponse(_message.Message):
    __slots__ = ("children", "photos")
    CHILDREN_FIELD_NUMBER: _ClassVar[int]
    PHOTOS_FIELD_NUMBER: _ClassVar[int]
    children: _containers.RepeatedCompositeFieldContainer[_resources_pb2.Child]
    photos: _containers.RepeatedCompositeFieldContainer[_resources_pb2.ChildPhoto]
    def __init__(self, children: _Optional[_Iterable[_Union[_resources_pb2.Child, _Mapping]]] = ..., photos: _Optional[_Iterable[_Union[_resources_pb2.ChildPhoto, _Mapping]]] = ...) -> None: ...
