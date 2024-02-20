from dataclasses import dataclass


@dataclass
class Pred_Args:
    nursery_id: str
    bus_id: str
    bus_type: int
    video_chunk: list[str]
    vehicle_event: str
    photo_height: int
    photo_width: int


@dataclass
class Train_Args:
    nursery_id: str
    child_ids: str
    bus_id: str
    bus_type: int
    seed: int
    mode: str


@dataclass
class FaceDetectAndClip_Args:
    nursery_id: str
    child_id: str
    env: str
