# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: where_child_bus/v1/nursery.proto
# Protobuf Python Version: 4.25.2
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from where_child_bus.v1 import resources_pb2 as where__child__bus_dot_v1_dot_resources__pb2


DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n where_child_bus/v1/nursery.proto\x12\x12where_child_bus.v1\x1a\"where_child_bus/v1/resources.proto\"\x99\x01\n\x14\x43reateNurseryRequest\x12\x14\n\x05\x65mail\x18\x01 \x01(\tR\x05\x65mail\x12\x1a\n\x08password\x18\x02 \x01(\tR\x08password\x12\x12\n\x04name\x18\x03 \x01(\tR\x04name\x12!\n\x0cphone_number\x18\x04 \x01(\tR\x0bphoneNumber\x12\x18\n\x07\x61\x64\x64ress\x18\x05 \x01(\tR\x07\x61\x64\x64ress\"V\n\x15\x43reateNurseryResponse\x12=\n\x07nursery\x18\x01 \x01(\x0b\x32#.where_child_bus.v1.NurseryResponseR\x07nursery\"G\n\x13NurseryLoginRequest\x12\x14\n\x05\x65mail\x18\x01 \x01(\tR\x05\x65mail\x12\x1a\n\x08password\x18\x02 \x01(\tR\x08password\"o\n\x14NurseryLoginResponse\x12\x18\n\x07success\x18\x01 \x01(\x08R\x07success\x12=\n\x07nursery\x18\x02 \x01(\x0b\x32#.where_child_bus.v1.NurseryResponseR\x07nursery2\xd9\x01\n\x0eNurseryService\x12\x64\n\rCreateNursery\x12(.where_child_bus.v1.CreateNurseryRequest\x1a).where_child_bus.v1.CreateNurseryResponse\x12\x61\n\x0cNurseryLogin\x12\'.where_child_bus.v1.NurseryLoginRequest\x1a(.where_child_bus.v1.NurseryLoginResponseB\xef\x01\n\x16\x63om.where_child_bus.v1B\x0cNurseryProtoP\x01Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\xa2\x02\x03WXX\xaa\x02\x10WhereChildBus.V1\xca\x02\x10WhereChildBus\\V1\xe2\x02\x1cWhereChildBus\\V1\\GPBMetadata\xea\x02\x11WhereChildBus::V1b\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'where_child_bus.v1.nursery_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:
  _globals['DESCRIPTOR']._options = None
  _globals['DESCRIPTOR']._serialized_options = b'\n\026com.where_child_bus.v1B\014NurseryProtoP\001Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\242\002\003WXX\252\002\020WhereChildBus.V1\312\002\020WhereChildBus\\V1\342\002\034WhereChildBus\\V1\\GPBMetadata\352\002\021WhereChildBus::V1'
  _globals['_CREATENURSERYREQUEST']._serialized_start=93
  _globals['_CREATENURSERYREQUEST']._serialized_end=246
  _globals['_CREATENURSERYRESPONSE']._serialized_start=248
  _globals['_CREATENURSERYRESPONSE']._serialized_end=334
  _globals['_NURSERYLOGINREQUEST']._serialized_start=336
  _globals['_NURSERYLOGINREQUEST']._serialized_end=407
  _globals['_NURSERYLOGINRESPONSE']._serialized_start=409
  _globals['_NURSERYLOGINRESPONSE']._serialized_end=520
  _globals['_NURSERYSERVICE']._serialized_start=523
  _globals['_NURSERYSERVICE']._serialized_end=740
# @@protoc_insertion_point(module_scope)
