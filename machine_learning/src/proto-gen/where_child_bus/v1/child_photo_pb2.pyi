from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class DuplicationCheckRequest(_message.Message):
    __slots__ = ("child_ids",)
    CHILD_IDS_FIELD_NUMBER: _ClassVar[int]
    child_ids: _containers.RepeatedScalarFieldContainer[str]
    def __init__(self, child_ids: _Optional[_Iterable[str]] = ...) -> None: ...

class DuplicationCheckResponse(_message.Message):
    __slots__ = ("is_duplicated", "photo_ids", "duplicated_photos")
    IS_DUPLICATED_FIELD_NUMBER: _ClassVar[int]
    PHOTO_IDS_FIELD_NUMBER: _ClassVar[int]
    DUPLICATED_PHOTOS_FIELD_NUMBER: _ClassVar[int]
    is_duplicated: bool
    photo_ids: _containers.RepeatedScalarFieldContainer[str]
    duplicated_photos: _containers.RepeatedScalarFieldContainer[bytes]
    def __init__(self, is_duplicated: bool = ..., photo_ids: _Optional[_Iterable[str]] = ..., duplicated_photos: _Optional[_Iterable[bytes]] = ...) -> None: ...

class DeleteChildPhotoRequest(_message.Message):
    __slots__ = ("ids",)
    IDS_FIELD_NUMBER: _ClassVar[int]
    ids: _containers.RepeatedScalarFieldContainer[str]
    def __init__(self, ids: _Optional[_Iterable[str]] = ...) -> None: ...

class DeleteChildPhotoResponse(_message.Message):
    __slots__ = ("is_success_list", "ids")
    IS_SUCCESS_LIST_FIELD_NUMBER: _ClassVar[int]
    IDS_FIELD_NUMBER: _ClassVar[int]
    is_success_list: _containers.RepeatedScalarFieldContainer[bool]
    ids: _containers.RepeatedScalarFieldContainer[str]
    def __init__(self, is_success_list: _Optional[_Iterable[bool]] = ..., ids: _Optional[_Iterable[str]] = ...) -> None: ...

class GetChildPhotoRequest(_message.Message):
    __slots__ = ("child_id",)
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    child_id: str
    def __init__(self, child_id: _Optional[str] = ...) -> None: ...

class ChildPhotoResponse(_message.Message):
    __slots__ = ("child_photo_id", "photo")
    CHILD_PHOTO_ID_FIELD_NUMBER: _ClassVar[int]
    PHOTO_FIELD_NUMBER: _ClassVar[int]
    child_photo_id: str
    photo: bytes
    def __init__(self, child_photo_id: _Optional[str] = ..., photo: _Optional[bytes] = ...) -> None: ...

class GetChildPhotoResponse(_message.Message):
    __slots__ = ("child_photos",)
    CHILD_PHOTOS_FIELD_NUMBER: _ClassVar[int]
    child_photos: _containers.RepeatedCompositeFieldContainer[ChildPhotoResponse]
    def __init__(self, child_photos: _Optional[_Iterable[_Union[ChildPhotoResponse, _Mapping]]] = ...) -> None: ...
