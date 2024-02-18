# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: where_child_bus/v1/guardian.proto
# Protobuf Python Version: 4.25.2
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from where_child_bus.v1 import resources_pb2 as where__child__bus_dot_v1_dot_resources__pb2


DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n!where_child_bus/v1/guardian.proto\x12\x12where_child_bus.v1\x1a\"where_child_bus/v1/resources.proto\"\xa3\x01\n\x15\x43reateGuardianRequest\x12!\n\x0cnursery_code\x18\x01 \x01(\tR\x0bnurseryCode\x12\x14\n\x05\x65mail\x18\x02 \x01(\tR\x05\x65mail\x12\x1a\n\x08password\x18\x03 \x01(\tR\x08password\x12\x12\n\x04name\x18\x04 \x01(\tR\x04name\x12!\n\x0cphone_number\x18\x05 \x01(\tR\x0bphoneNumber\"Z\n\x16\x43reateGuardianResponse\x12@\n\x08guardian\x18\x01 \x01(\x0b\x32$.where_child_bus.v1.GuardianResponseR\x08guardian\"H\n\x14GuardianLoginRequest\x12\x14\n\x05\x65mail\x18\x01 \x01(\tR\x05\x65mail\x12\x1a\n\x08password\x18\x02 \x01(\tR\x08password\"\xb2\x01\n\x15GuardianLoginResponse\x12\x18\n\x07success\x18\x01 \x01(\x08R\x07success\x12@\n\x08guardian\x18\x02 \x01(\x0b\x32$.where_child_bus.v1.GuardianResponseR\x08guardian\x12=\n\x07nursery\x18\x03 \x01(\x0b\x32#.where_child_bus.v1.NurseryResponseR\x07nursery\"6\n\x1dGetGuardianListByBusIdRequest\x12\x15\n\x06\x62us_id\x18\x01 \x01(\tR\x05\x62usId\"d\n\x1eGetGuardianListByBusIdResponse\x12\x42\n\tguardians\x18\x01 \x03(\x0b\x32$.where_child_bus.v1.GuardianResponseR\tguardians\"8\n\x1bGetGuardianByChildIdRequest\x12\x19\n\x08\x63hild_id\x18\x01 \x01(\tR\x07\x63hildId\"`\n\x1cGetGuardianByChildIdResponse\x12@\n\x08guardian\x18\x01 \x01(\x0b\x32$.where_child_bus.v1.GuardianResponseR\x08guardian2\xdc\x03\n\x0fGuardianService\x12g\n\x0e\x43reateGuardian\x12).where_child_bus.v1.CreateGuardianRequest\x1a*.where_child_bus.v1.CreateGuardianResponse\x12\x64\n\rGuardianLogin\x12(.where_child_bus.v1.GuardianLoginRequest\x1a).where_child_bus.v1.GuardianLoginResponse\x12\x7f\n\x16GetGuardianListByBusId\x12\x31.where_child_bus.v1.GetGuardianListByBusIdRequest\x1a\x32.where_child_bus.v1.GetGuardianListByBusIdResponse\x12y\n\x14GetGuardianByChildId\x12/.where_child_bus.v1.GetGuardianByChildIdRequest\x1a\x30.where_child_bus.v1.GetGuardianByChildIdResponseB\xf0\x01\n\x16\x63om.where_child_bus.v1B\rGuardianProtoP\x01Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\xa2\x02\x03WXX\xaa\x02\x10WhereChildBus.V1\xca\x02\x10WhereChildBus\\V1\xe2\x02\x1cWhereChildBus\\V1\\GPBMetadata\xea\x02\x11WhereChildBus::V1b\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'where_child_bus.v1.guardian_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:
  _globals['DESCRIPTOR']._options = None
  _globals['DESCRIPTOR']._serialized_options = b'\n\026com.where_child_bus.v1B\rGuardianProtoP\001Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\242\002\003WXX\252\002\020WhereChildBus.V1\312\002\020WhereChildBus\\V1\342\002\034WhereChildBus\\V1\\GPBMetadata\352\002\021WhereChildBus::V1'
  _globals['_CREATEGUARDIANREQUEST']._serialized_start=94
  _globals['_CREATEGUARDIANREQUEST']._serialized_end=257
  _globals['_CREATEGUARDIANRESPONSE']._serialized_start=259
  _globals['_CREATEGUARDIANRESPONSE']._serialized_end=349
  _globals['_GUARDIANLOGINREQUEST']._serialized_start=351
  _globals['_GUARDIANLOGINREQUEST']._serialized_end=423
  _globals['_GUARDIANLOGINRESPONSE']._serialized_start=426
  _globals['_GUARDIANLOGINRESPONSE']._serialized_end=604
  _globals['_GETGUARDIANLISTBYBUSIDREQUEST']._serialized_start=606
  _globals['_GETGUARDIANLISTBYBUSIDREQUEST']._serialized_end=660
  _globals['_GETGUARDIANLISTBYBUSIDRESPONSE']._serialized_start=662
  _globals['_GETGUARDIANLISTBYBUSIDRESPONSE']._serialized_end=762
  _globals['_GETGUARDIANBYCHILDIDREQUEST']._serialized_start=764
  _globals['_GETGUARDIANBYCHILDIDREQUEST']._serialized_end=820
  _globals['_GETGUARDIANBYCHILDIDRESPONSE']._serialized_start=822
  _globals['_GETGUARDIANBYCHILDIDRESPONSE']._serialized_end=918
  _globals['_GUARDIANSERVICE']._serialized_start=921
  _globals['_GUARDIANSERVICE']._serialized_end=1397
# @@protoc_insertion_point(module_scope)
