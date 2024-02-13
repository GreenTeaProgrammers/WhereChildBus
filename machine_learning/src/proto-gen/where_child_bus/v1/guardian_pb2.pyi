from where_child_bus.v1 import resources_pb2 as _resources_pb2
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class CreateGuardianRequest(_message.Message):
    __slots__ = ("nursery_code", "email", "password", "name", "phone_number")
    NURSERY_CODE_FIELD_NUMBER: _ClassVar[int]
    EMAIL_FIELD_NUMBER: _ClassVar[int]
    PASSWORD_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    PHONE_NUMBER_FIELD_NUMBER: _ClassVar[int]
    nursery_code: str
    email: str
    password: str
    name: str
    phone_number: str
    def __init__(self, nursery_code: _Optional[str] = ..., email: _Optional[str] = ..., password: _Optional[str] = ..., name: _Optional[str] = ..., phone_number: _Optional[str] = ...) -> None: ...

class CreateGuardianResponse(_message.Message):
    __slots__ = ("guardian",)
    GUARDIAN_FIELD_NUMBER: _ClassVar[int]
    guardian: _resources_pb2.GuardianResponse
    def __init__(self, guardian: _Optional[_Union[_resources_pb2.GuardianResponse, _Mapping]] = ...) -> None: ...

class GuardianLoginRequest(_message.Message):
    __slots__ = ("email", "password")
    EMAIL_FIELD_NUMBER: _ClassVar[int]
    PASSWORD_FIELD_NUMBER: _ClassVar[int]
    email: str
    password: str
    def __init__(self, email: _Optional[str] = ..., password: _Optional[str] = ...) -> None: ...

class GuardianLoginResponse(_message.Message):
    __slots__ = ("success", "guardian", "nursery")
    SUCCESS_FIELD_NUMBER: _ClassVar[int]
    GUARDIAN_FIELD_NUMBER: _ClassVar[int]
    NURSERY_FIELD_NUMBER: _ClassVar[int]
    success: bool
    guardian: _resources_pb2.GuardianResponse
    nursery: _resources_pb2.NurseryResponse
    def __init__(self, success: bool = ..., guardian: _Optional[_Union[_resources_pb2.GuardianResponse, _Mapping]] = ..., nursery: _Optional[_Union[_resources_pb2.NurseryResponse, _Mapping]] = ...) -> None: ...
