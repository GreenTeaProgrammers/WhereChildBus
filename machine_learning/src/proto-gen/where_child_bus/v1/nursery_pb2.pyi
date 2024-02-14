from where_child_bus.v1 import resources_pb2 as _resources_pb2
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class CreateNurseryRequest(_message.Message):
    __slots__ = ("email", "password", "name", "phone_number", "address")
    EMAIL_FIELD_NUMBER: _ClassVar[int]
    PASSWORD_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    PHONE_NUMBER_FIELD_NUMBER: _ClassVar[int]
    ADDRESS_FIELD_NUMBER: _ClassVar[int]
    email: str
    password: str
    name: str
    phone_number: str
    address: str
    def __init__(self, email: _Optional[str] = ..., password: _Optional[str] = ..., name: _Optional[str] = ..., phone_number: _Optional[str] = ..., address: _Optional[str] = ...) -> None: ...

class CreateNurseryResponse(_message.Message):
    __slots__ = ("nursery",)
    NURSERY_FIELD_NUMBER: _ClassVar[int]
    nursery: _resources_pb2.NurseryResponse
    def __init__(self, nursery: _Optional[_Union[_resources_pb2.NurseryResponse, _Mapping]] = ...) -> None: ...

class NurseryLoginRequest(_message.Message):
    __slots__ = ("email", "password")
    EMAIL_FIELD_NUMBER: _ClassVar[int]
    PASSWORD_FIELD_NUMBER: _ClassVar[int]
    email: str
    password: str
    def __init__(self, email: _Optional[str] = ..., password: _Optional[str] = ...) -> None: ...

class NurseryLoginResponse(_message.Message):
    __slots__ = ("success", "nursery")
    SUCCESS_FIELD_NUMBER: _ClassVar[int]
    NURSERY_FIELD_NUMBER: _ClassVar[int]
    success: bool
    nursery: _resources_pb2.NurseryResponse
    def __init__(self, success: bool = ..., nursery: _Optional[_Union[_resources_pb2.NurseryResponse, _Mapping]] = ...) -> None: ...
