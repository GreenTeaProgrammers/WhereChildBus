from typing import ClassVar as _ClassVar
from typing import Iterable as _Iterable
from typing import Mapping as _Mapping
from typing import Optional as _Optional
from typing import Union as _Union

from google.protobuf import descriptor as _descriptor
from google.protobuf import field_mask_pb2 as _field_mask_pb2
from google.protobuf import message as _message
from google.protobuf.internal import containers as _containers
from where_child_bus.v1 import resources_pb2 as _resources_pb2

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
    def __init__(
        self,
        nursery_id: _Optional[str] = ...,
        guardian_id: _Optional[str] = ...,
        name: _Optional[str] = ...,
        age: _Optional[int] = ...,
        sex: _Optional[_Union[_resources_pb2.Sex, str]] = ...,
        photos: _Optional[_Iterable[bytes]] = ...,
    ) -> None: ...

class CreateChildResponse(_message.Message):
    __slots__ = ("child",)
    CHILD_FIELD_NUMBER: _ClassVar[int]
    child: _resources_pb2.Child
    def __init__(
        self, child: _Optional[_Union[_resources_pb2.Child, _Mapping]] = ...
    ) -> None: ...

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
    def __init__(
        self,
        children: _Optional[_Iterable[_Union[_resources_pb2.Child, _Mapping]]] = ...,
        photos: _Optional[_Iterable[_Union[_resources_pb2.ChildPhoto, _Mapping]]] = ...,
    ) -> None: ...

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
    def __init__(
        self,
        children: _Optional[_Iterable[_Union[_resources_pb2.Child, _Mapping]]] = ...,
        photos: _Optional[_Iterable[_Union[_resources_pb2.ChildPhoto, _Mapping]]] = ...,
    ) -> None: ...

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
    def __init__(
        self,
        children: _Optional[_Iterable[_Union[_resources_pb2.Child, _Mapping]]] = ...,
        photos: _Optional[_Iterable[_Union[_resources_pb2.ChildPhoto, _Mapping]]] = ...,
    ) -> None: ...

class CheckIsChildInBusRequest(_message.Message):
    __slots__ = ("child_id",)
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    child_id: str
    def __init__(self, child_id: _Optional[str] = ...) -> None: ...

class CheckIsChildInBusResponse(_message.Message):
    __slots__ = ("is_in_bus",)
    IS_IN_BUS_FIELD_NUMBER: _ClassVar[int]
    is_in_bus: bool
    def __init__(self, is_in_bus: bool = ...) -> None: ...

class UpdateChildRequest(_message.Message):
    __slots__ = (
        "child_id",
        "name",
        "age",
        "sex",
        "check_for_missing_items",
        "has_bag",
        "has_lunch_box",
        "has_water_bottle",
        "has_umbrella",
        "has_other",
        "update_mask",
    )
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    AGE_FIELD_NUMBER: _ClassVar[int]
    SEX_FIELD_NUMBER: _ClassVar[int]
    CHECK_FOR_MISSING_ITEMS_FIELD_NUMBER: _ClassVar[int]
    HAS_BAG_FIELD_NUMBER: _ClassVar[int]
    HAS_LUNCH_BOX_FIELD_NUMBER: _ClassVar[int]
    HAS_WATER_BOTTLE_FIELD_NUMBER: _ClassVar[int]
    HAS_UMBRELLA_FIELD_NUMBER: _ClassVar[int]
    HAS_OTHER_FIELD_NUMBER: _ClassVar[int]
    UPDATE_MASK_FIELD_NUMBER: _ClassVar[int]
    child_id: str
    name: str
    age: int
    sex: _resources_pb2.Sex
    check_for_missing_items: bool
    has_bag: bool
    has_lunch_box: bool
    has_water_bottle: bool
    has_umbrella: bool
    has_other: bool
    update_mask: _field_mask_pb2.FieldMask
    def __init__(
        self,
        child_id: _Optional[str] = ...,
        name: _Optional[str] = ...,
        age: _Optional[int] = ...,
        sex: _Optional[_Union[_resources_pb2.Sex, str]] = ...,
        check_for_missing_items: bool = ...,
        has_bag: bool = ...,
        has_lunch_box: bool = ...,
        has_water_bottle: bool = ...,
        has_umbrella: bool = ...,
        has_other: bool = ...,
        update_mask: _Optional[_Union[_field_mask_pb2.FieldMask, _Mapping]] = ...,
    ) -> None: ...

class UpdateChildResponse(_message.Message):
    __slots__ = ("child",)
    CHILD_FIELD_NUMBER: _ClassVar[int]
    child: _resources_pb2.Child
    def __init__(
        self, child: _Optional[_Union[_resources_pb2.Child, _Mapping]] = ...
    ) -> None: ...
