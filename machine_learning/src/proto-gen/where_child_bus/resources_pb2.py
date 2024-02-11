# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: where_child_bus/resources.proto
# Protobuf Python Version: 4.25.2
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.protobuf import timestamp_pb2 as google_dot_protobuf_dot_timestamp__pb2


DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x1fwhere_child_bus/resources.proto\x12\x0fwhere_child_bus\x1a\x1fgoogle/protobuf/timestamp.proto\"\xc8\x02\n\x07Nursery\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12!\n\x0cnursery_code\x18\x02 \x01(\tR\x0bnurseryCode\x12\x12\n\x04name\x18\x03 \x01(\tR\x04name\x12\x18\n\x07\x61\x64\x64ress\x18\x04 \x01(\tR\x07\x61\x64\x64ress\x12!\n\x0cphone_number\x18\x05 \x01(\tR\x0bphoneNumber\x12\x14\n\x05\x65mail\x18\x06 \x01(\tR\x05\x65mail\x12-\n\x12\x65ncrypted_password\x18\x07 \x01(\tR\x11\x65ncryptedPassword\x12\x39\n\ncreated_at\x18\x08 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\t \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\xab\x02\n\x08Guardian\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x1d\n\nnursery_id\x18\x02 \x01(\tR\tnurseryId\x12\x12\n\x04name\x18\x03 \x01(\tR\x04name\x12\x14\n\x05\x65mail\x18\x04 \x01(\tR\x05\x65mail\x12!\n\x0cphone_number\x18\x05 \x01(\tR\x0bphoneNumber\x12-\n\x12\x65ncrypted_password\x18\x06 \x01(\tR\x11\x65ncryptedPassword\x12\x39\n\ncreated_at\x18\x07 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\x08 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\x86\x03\n\x03\x62us\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x1d\n\nnursery_id\x18\x02 \x01(\tR\tnurseryId\x12\x12\n\x04name\x18\x03 \x01(\tR\x04name\x12!\n\x0cplate_number\x18\x04 \x01(\tR\x0bplateNumber\x12\x33\n\x06status\x18\x05 \x01(\x0e\x32\x1b.where_child_bus.bus.StatusR\x06status\x12\x1a\n\x08latitude\x18\x06 \x01(\x01R\x08latitude\x12\x1c\n\tlongitude\x18\x07 \x01(\x01R\tlongitude\x12\x39\n\ncreated_at\x18\x08 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\t \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"4\n\x06Status\x12\x0b\n\x07STOPPED\x10\x00\x12\x0b\n\x07RUNNING\x10\x01\x12\x10\n\x0cMAINTEINANCE\x10\x02\"\x85\x05\n\x05\x43hild\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x1d\n\nnursery_id\x18\x02 \x01(\tR\tnurseryId\x12\x1f\n\x0bguardian_id\x18\x03 \x01(\tR\nguardianId\x12\x12\n\x04name\x18\x04 \x01(\tR\x04name\x12\x10\n\x03\x61ge\x18\x05 \x01(\x05R\x03\x61ge\x12,\n\x03sex\x18\x06 \x01(\x0e\x32\x1a.where_child_bus.Child.SexR\x03sex\x12-\n\x13is_ride_morning_bus\x18\x07 \x01(\x08R\x10isRideMorningBus\x12\x31\n\x15is_ride_afternoon_bus\x18\x08 \x01(\x08R\x12isRideAfternoonBus\x12\x35\n\x17\x63heck_for_missing_items\x18\t \x01(\x08R\x14\x63heckForMissingItems\x12\x17\n\x07has_bag\x18\n \x01(\x08R\x06hasBag\x12\"\n\rhas_lunch_box\x18\x0b \x01(\x08R\x0bhasLunchBox\x12(\n\x10has_water_bottle\x18\x0c \x01(\x08R\x0ehasWaterBottle\x12\x1f\n\x0bhas_umbrera\x18\r \x01(\x08R\nhasUmbrera\x12\x1b\n\thas_other\x18\x0e \x01(\x08R\x08hasOther\x12\x39\n\ncreated_at\x18\x0f \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\x10 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"$\n\x03Sex\x12\x07\n\x03MAN\x10\x00\x12\t\n\x05WOMEN\x10\x01\x12\t\n\x05OTHER\x10\x02\"\xb8\x02\n\x07Station\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x1f\n\x0bguardian_id\x18\x02 \x01(\tR\nguardianId\x12\x1a\n\x08latitude\x18\x03 \x01(\x01R\x08latitude\x12\x1c\n\tlongitude\x18\x04 \x01(\x01R\tlongitude\x12#\n\rmorning_order\x18\x05 \x01(\x05R\x0cmorningOrder\x12\'\n\x0f\x61\x66ternoon_order\x18\x06 \x01(\x05R\x0e\x61\x66ternoonOrder\x12\x39\n\ncreated_at\x18\x07 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\x08 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\xc7\x01\n\x13\x43hildBusAssociation\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x15\n\x06\x62us_id\x18\x02 \x01(\tR\x05\x62usId\x12\x19\n\x08\x63hild_id\x18\x03 \x01(\tR\x07\x63hildId\x12G\n\x08\x62us_type\x18\x04 \x01(\x0e\x32,.where_child_bus.ChildBusAssociation.BusTypeR\x07\x62usType\"%\n\x07\x42usType\x12\x0b\n\x07MORNING\x10\x00\x12\r\n\tAFTERNOON\x10\x01\"M\n\x15\x42usStationAssociation\x12\x15\n\x06\x62us_id\x18\x01 \x01(\tR\x05\x62usId\x12\x1d\n\nstation_id\x18\x02 \x01(\tR\tstationId\"\xe1\x01\n\nChildPhoto\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x19\n\x08\x63hild_id\x18\x02 \x01(\tR\x07\x63hildId\x12\x1b\n\ts3_bucket\x18\x03 \x01(\tR\x08s3Bucket\x12\x15\n\x06s3_key\x18\x04 \x01(\tR\x05s3Key\x12\x39\n\ncreated_at\x18\x05 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tcreatedAt\x12\x39\n\nupdated_at\x18\x06 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\tupdatedAt\"\xad\x01\n\x0e\x42oardingRecord\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x19\n\x08\x63hild_id\x18\x02 \x01(\tR\x07\x63hildId\x12\x15\n\x06\x62us_id\x18\x03 \x01(\tR\x05\x62usId\x12\x1f\n\x0bis_boarding\x18\x04 \x01(\x08R\nisBoarding\x12\x38\n\ttimestamp\x18\x05 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\ttimestampB\xcc\x01\n\x13\x63om.where_child_busB\x0eResourcesProtoP\x01ZQgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus\xa2\x02\x03WXX\xaa\x02\rWhereChildBus\xca\x02\rWhereChildBus\xe2\x02\x19WhereChildBus\\GPBMetadata\xea\x02\rWhereChildBusb\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'where_child_bus.resources_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:
  _globals['DESCRIPTOR']._options = None
  _globals['DESCRIPTOR']._serialized_options = b'\n\023com.where_child_busB\016ResourcesProtoP\001ZQgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus\242\002\003WXX\252\002\rWhereChildBus\312\002\rWhereChildBus\342\002\031WhereChildBus\\GPBMetadata\352\002\rWhereChildBus'
  _globals['_NURSERY']._serialized_start=86
  _globals['_NURSERY']._serialized_end=414
  _globals['_GUARDIAN']._serialized_start=417
  _globals['_GUARDIAN']._serialized_end=716
  _globals['_BUS']._serialized_start=719
  _globals['_BUS']._serialized_end=1109
  _globals['_BUS_STATUS']._serialized_start=1057
  _globals['_BUS_STATUS']._serialized_end=1109
  _globals['_CHILD']._serialized_start=1112
  _globals['_CHILD']._serialized_end=1757
  _globals['_CHILD_SEX']._serialized_start=1721
  _globals['_CHILD_SEX']._serialized_end=1757
  _globals['_STATION']._serialized_start=1760
  _globals['_STATION']._serialized_end=2072
  _globals['_CHILDBUSASSOCIATION']._serialized_start=2075
  _globals['_CHILDBUSASSOCIATION']._serialized_end=2274
  _globals['_CHILDBUSASSOCIATION_BUSTYPE']._serialized_start=2237
  _globals['_CHILDBUSASSOCIATION_BUSTYPE']._serialized_end=2274
  _globals['_BUSSTATIONASSOCIATION']._serialized_start=2276
  _globals['_BUSSTATIONASSOCIATION']._serialized_end=2353
  _globals['_CHILDPHOTO']._serialized_start=2356
  _globals['_CHILDPHOTO']._serialized_end=2581
  _globals['_BOARDINGRECORD']._serialized_start=2584
  _globals['_BOARDINGRECORD']._serialized_end=2757
# @@protoc_insertion_point(module_scope)