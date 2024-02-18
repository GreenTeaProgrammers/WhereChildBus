from where_child_bus.v1 import resources_pb2 as _resources_pb2
from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

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

class GetGuardianListByBusIdRequest(_message.Message):
    __slots__ = ("bus_id",)
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    def __init__(self, bus_id: _Optional[str] = ...) -> None: ...

class GetGuardianListByBusIdResponse(_message.Message):
    __slots__ = ("guardians",)
    GUARDIANS_FIELD_NUMBER: _ClassVar[int]
    guardians: _containers.RepeatedCompositeFieldContainer[_resources_pb2.GuardianResponse]
    def __init__(self, guardians: _Optional[_Iterable[_Union[_resources_pb2.GuardianResponse, _Mapping]]] = ...) -> None: ...

class GetGuardianByChildIdRequest(_message.Message):
    __slots__ = ("child_id",)
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    child_id: str
    def __init__(self, child_id: _Optional[str] = ...) -> None: ...

class GetGuardianByChildIdResponse(_message.Message):
    __slots__ = ("guardian",)
    GUARDIAN_FIELD_NUMBER: _ClassVar[int]
    guardian: _resources_pb2.GuardianResponse
    def __init__(self, guardian: _Optional[_Union[_resources_pb2.GuardianResponse, _Mapping]] = ...) -> None: ...

class GetGuardianListByNurseryIdRequest(_message.Message):
    __slots__ = ("nursery_id",)
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    def __init__(self, nursery_id: _Optional[str] = ...) -> None: ...

class GetGuardianListByNurseryIdResponse(_message.Message):
    __slots__ = ("guardians",)
    GUARDIANS_FIELD_NUMBER: _ClassVar[int]
    guardians: _containers.RepeatedCompositeFieldContainer[_resources_pb2.GuardianResponse]
    def __init__(self, guardians: _Optional[_Iterable[_Union[_resources_pb2.GuardianResponse, _Mapping]]] = ...) -> None: ...
