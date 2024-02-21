# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: where_child_bus/v1/resources.proto
# Protobuf Python Version: 4.25.2
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.protobuf import timestamp_pb2 as google_dot_protobuf_dot_timestamp__pb2


DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\"where_child_bus/v1/resources.proto\x12\x12where_child_bus.v1\x1a\x1fgoogle/protobuf/timestamp.proto\"\xc2\x02\n\x07Nursery\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12!\n\x0cnursery_code\x18\x02 \x01(\tR\x0bnurseryCode\x12\x12\n\x04name\x18\x03 \x01(\tR\x04name\x12\x18\n\x07\x61\x64\x64ress\x18\x04 \x01(\tR\x07\x61\x64\x64ress\x12!\n\x0cphone_number\x18\x05 \x01(\tR\x0bphoneNumber\x12\x14\n\x05\x65mail\x18\x06 \x01(\tR\x05\x65mail\x12\'\n\x0fhashed_password\x18\x07 \x01(\tR\x0ehashedPassword\x12\x39\n\ncreated_at\x18\x08 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\t \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\xa1\x02\n\x0fNurseryResponse\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12!\n\x0cnursery_code\x18\x02 \x01(\tR\x0bnurseryCode\x12\x12\n\x04name\x18\x03 \x01(\tR\x04name\x12\x18\n\x07\x61\x64\x64ress\x18\x04 \x01(\tR\x07\x61\x64\x64ress\x12!\n\x0cphone_number\x18\x05 \x01(\tR\x0bphoneNumber\x12\x14\n\x05\x65mail\x18\x06 \x01(\tR\x05\x65mail\x12\x39\n\ncreated_at\x18\x07 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\x08 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\xff\x02\n\x08Guardian\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x1d\n\nnursery_id\x18\x02 \x01(\tR\tnurseryId\x12\x12\n\x04name\x18\x03 \x01(\tR\x04name\x12\x14\n\x05\x65mail\x18\x04 \x01(\tR\x05\x65mail\x12!\n\x0cphone_number\x18\x05 \x01(\tR\x0bphoneNumber\x12\'\n\x0fhashed_password\x18\x06 \x01(\tR\x0ehashedPassword\x12+\n\x12is_use_morning_bus\x18\x07 \x01(\x08R\x0fisUseMorningBus\x12+\n\x12is_use_evening_bus\x18\x08 \x01(\x08R\x0fisUseEveningBus\x12\x39\n\ncreated_at\x18\t \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\n \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\xde\x02\n\x10GuardianResponse\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x1d\n\nnursery_id\x18\x02 \x01(\tR\tnurseryId\x12\x12\n\x04name\x18\x03 \x01(\tR\x04name\x12\x14\n\x05\x65mail\x18\x04 \x01(\tR\x05\x65mail\x12!\n\x0cphone_number\x18\x05 \x01(\tR\x0bphoneNumber\x12+\n\x12is_use_morning_bus\x18\x06 \x01(\x08R\x0fisUseMorningBus\x12+\n\x12is_use_evening_bus\x18\x07 \x01(\x08R\x0fisUseEveningBus\x12\x39\n\ncreated_at\x18\x08 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\t \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\xab\x04\n\x03\x42us\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x1d\n\nnursery_id\x18\x02 \x01(\tR\tnurseryId\x12\x12\n\x04name\x18\x03 \x01(\tR\x04name\x12!\n\x0cplate_number\x18\x04 \x01(\tR\x0bplateNumber\x12<\n\nbus_status\x18\x05 \x01(\x0e\x32\x1d.where_child_bus.v1.BusStatusR\tbusStatus\x12\x1a\n\x08latitude\x18\x06 \x01(\x01R\x08latitude\x12\x1c\n\tlongitude\x18\x07 \x01(\x01R\tlongitude\x12\x36\n\x17\x65nable_face_recognition\x18\x08 \x01(\x08R\x15\x65nableFaceRecognition\x12\x37\n\x18morning_first_station_id\x18\t \x01(\tR\x15morningFirstStationId\x12\x37\n\x18\x65vening_first_station_id\x18\n \x01(\tR\x15\x65veningFirstStationId\x12&\n\x0fnext_station_id\x18\x0b \x01(\tR\rnextStationId\x12\x39\n\ncreated_at\x18\x0c \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\r \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\xfc\x03\n\x05\x43hild\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x1d\n\nnursery_id\x18\x02 \x01(\tR\tnurseryId\x12\x1f\n\x0bguardian_id\x18\x03 \x01(\tR\nguardianId\x12\x12\n\x04name\x18\x04 \x01(\tR\x04name\x12\x10\n\x03\x61ge\x18\x05 \x01(\x05R\x03\x61ge\x12)\n\x03sex\x18\x06 \x01(\x0e\x32\x17.where_child_bus.v1.SexR\x03sex\x12\x35\n\x17\x63heck_for_missing_items\x18\x07 \x01(\x08R\x14\x63heckForMissingItems\x12\x17\n\x07has_bag\x18\x08 \x01(\x08R\x06hasBag\x12\"\n\rhas_lunch_box\x18\t \x01(\x08R\x0bhasLunchBox\x12(\n\x10has_water_bottle\x18\n \x01(\x08R\x0ehasWaterBottle\x12!\n\x0chas_umbrella\x18\x0b \x01(\x08R\x0bhasUmbrella\x12\x1b\n\thas_other\x18\x0c \x01(\x08R\x08hasOther\x12\x39\n\ncreated_at\x18\r \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\x0e \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\xd8\x02\n\x07Station\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x1f\n\x0bguardian_id\x18\x02 \x01(\tR\nguardianId\x12\x35\n\x17morning_next_station_id\x18\x03 \x01(\tR\x14morningNextStationId\x12\x35\n\x17\x65vening_next_station_id\x18\x04 \x01(\tR\x14\x65veningNextStationId\x12\x1a\n\x08latitude\x18\x05 \x01(\x01R\x08latitude\x12\x1c\n\tlongitude\x18\x06 \x01(\x01R\tlongitude\x12\x39\n\ncreated_at\x18\x07 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\x08 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\x8f\x01\n\x13\x43hildBusAssociation\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x15\n\x06\x62us_id\x18\x02 \x01(\tR\x05\x62usId\x12\x19\n\x08\x63hild_id\x18\x03 \x01(\tR\x07\x63hildId\x12\x36\n\x08\x62us_type\x18\x04 \x01(\x0e\x32\x1b.where_child_bus.v1.BusTypeR\x07\x62usType\"M\n\x15\x42usStationAssociation\x12\x15\n\x06\x62us_id\x18\x01 \x01(\tR\x05\x62usId\x12\x1d\n\nstation_id\x18\x02 \x01(\tR\tstationId\"\xcc\x01\n\nChildPhoto\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x19\n\x08\x63hild_id\x18\x02 \x01(\tR\x07\x63hildId\x12\x1d\n\nphoto_data\x18\x03 \x01(\x0cR\tphotoData\x12\x39\n\ncreated_at\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\x05 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\xad\x01\n\x0e\x42oardingRecord\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x19\n\x08\x63hild_id\x18\x02 \x01(\tR\x07\x63hildId\x12\x15\n\x06\x62us_id\x18\x03 \x01(\tR\x05\x62usId\x12\x1f\n\x0bis_boarding\x18\x04 \x01(\x08R\nisBoarding\x12\x38\n\ttimestamp\x18\x05 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\ttimestamp*s\n\tBusStatus\x12\x1a\n\x16\x42US_STATUS_UNSPECIFIED\x10\x00\x12\x16\n\x12\x42US_STATUS_STOPPED\x10\x01\x12\x16\n\x12\x42US_STATUS_RUNNING\x10\x02\x12\x1a\n\x16\x42US_STATUS_MAINTENANCE\x10\x03*b\n\x0cVehicleEvent\x12\x1d\n\x19VEHICLE_EVENT_UNSPECIFIED\x10\x00\x12\x18\n\x14VEHICLE_EVENT_GET_ON\x10\x01\x12\x19\n\x15VEHICLE_EVENT_GET_OFF\x10\x02*E\n\x03Sex\x12\x13\n\x0fSEX_UNSPECIFIED\x10\x00\x12\x0b\n\x07SEX_MAN\x10\x01\x12\r\n\tSEX_WOMAN\x10\x02\x12\r\n\tSEX_OTHER\x10\x03*O\n\x07\x42usType\x12\x18\n\x14\x42US_TYPE_UNSPECIFIED\x10\x00\x12\x14\n\x10\x42US_TYPE_MORNING\x10\x01\x12\x14\n\x10\x42US_TYPE_EVENING\x10\x02\x42\xf1\x01\n\x16\x63om.where_child_bus.v1B\x0eResourcesProtoP\x01Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\xa2\x02\x03WXX\xaa\x02\x10WhereChildBus.V1\xca\x02\x10WhereChildBus\\V1\xe2\x02\x1cWhereChildBus\\V1\\GPBMetadata\xea\x02\x11WhereChildBus::V1b\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'where_child_bus.v1.resources_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:
  _globals['DESCRIPTOR']._options = None
  _globals['DESCRIPTOR']._serialized_options = b'\n\026com.where_child_bus.v1B\016ResourcesProtoP\001Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\242\002\003WXX\252\002\020WhereChildBus.V1\312\002\020WhereChildBus\\V1\342\002\034WhereChildBus\\V1\\GPBMetadata\352\002\021WhereChildBus::V1'
  _globals['_BUSSTATUS']._serialized_start=3471
  _globals['_BUSSTATUS']._serialized_end=3586
  _globals['_VEHICLEEVENT']._serialized_start=3588
  _globals['_VEHICLEEVENT']._serialized_end=3686
  _globals['_SEX']._serialized_start=3688
  _globals['_SEX']._serialized_end=3757
  _globals['_BUSTYPE']._serialized_start=3759
  _globals['_BUSTYPE']._serialized_end=3838
  _globals['_NURSERY']._serialized_start=92
  _globals['_NURSERY']._serialized_end=414
  _globals['_NURSERYRESPONSE']._serialized_start=417
  _globals['_NURSERYRESPONSE']._serialized_end=706
  _globals['_GUARDIAN']._serialized_start=709
  _globals['_GUARDIAN']._serialized_end=1092
  _globals['_GUARDIANRESPONSE']._serialized_start=1095
  _globals['_GUARDIANRESPONSE']._serialized_end=1445
  _globals['_BUS']._serialized_start=1448
  _globals['_BUS']._serialized_end=2003
  _globals['_CHILD']._serialized_start=2006
  _globals['_CHILD']._serialized_end=2514
  _globals['_STATION']._serialized_start=2517
  _globals['_STATION']._serialized_end=2861
  _globals['_CHILDBUSASSOCIATION']._serialized_start=2864
  _globals['_CHILDBUSASSOCIATION']._serialized_end=3007
  _globals['_BUSSTATIONASSOCIATION']._serialized_start=3009
  _globals['_BUSSTATIONASSOCIATION']._serialized_end=3086
  _globals['_CHILDPHOTO']._serialized_start=3089
  _globals['_CHILDPHOTO']._serialized_end=3293
  _globals['_BOARDINGRECORD']._serialized_start=3296
  _globals['_BOARDINGRECORD']._serialized_end=3469
# @@protoc_insertion_point(module_scope)
