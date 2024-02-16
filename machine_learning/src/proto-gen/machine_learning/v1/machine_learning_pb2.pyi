from google.protobuf.internal import containers as _containers
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Optional as _Optional

DESCRIPTOR: _descriptor.FileDescriptor

class TrainRequest(_message.Message):
    __slots__ = ("nursery_id", "child_id", "bus_id")
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    child_id: _containers.RepeatedScalarFieldContainer[str]
    bus_id: str
    def __init__(self, nursery_id: _Optional[str] = ..., child_id: _Optional[_Iterable[str]] = ..., bus_id: _Optional[str] = ...) -> None: ...

class TrainResponse(_message.Message):
    __slots__ = ("is_started",)
    IS_STARTED_FIELD_NUMBER: _ClassVar[int]
    is_started: bool
    def __init__(self, is_started: bool = ...) -> None: ...

class EvalRequest(_message.Message):
    __slots__ = ("bus_id",)
    BUS_ID_FIELD_NUMBER: _ClassVar[int]
    bus_id: str
    def __init__(self, bus_id: _Optional[str] = ...) -> None: ...

class EvalResponse(_message.Message):
    __slots__ = ("child_id",)
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    child_id: _containers.RepeatedScalarFieldContainer[str]
    def __init__(self, child_id: _Optional[_Iterable[str]] = ...) -> None: ...

class FaceDetectAndClipResponse(_message.Message):
    __slots__ = ("nursery_id", "child_id")
    NURSERY_ID_FIELD_NUMBER: _ClassVar[int]
    CHILD_ID_FIELD_NUMBER: _ClassVar[int]
    nursery_id: str
    child_id: str
    def __init__(self, nursery_id: _Optional[str] = ..., child_id: _Optional[str] = ...) -> None: ...

class FaceAndClipRequest(_message.Message):
    __slots__ = ("is_started",)
    IS_STARTED_FIELD_NUMBER: _ClassVar[int]
    is_started: bool
    def __init__(self, is_started: bool = ...) -> None: ...
