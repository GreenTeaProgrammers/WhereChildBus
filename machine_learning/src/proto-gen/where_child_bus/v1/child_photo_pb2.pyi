from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Optional as _Optional

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
