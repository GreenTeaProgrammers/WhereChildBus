# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: where_child_bus/v1/bus.proto
# Protobuf Python Version: 4.25.2
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from where_child_bus.v1 import resources_pb2 as where__child__bus_dot_v1_dot_resources__pb2


DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x1cwhere_child_bus/v1/bus.proto\x12\x12where_child_bus.v1\x1a\"where_child_bus/v1/resources.proto\"=\n\x1cGetBusListByNurseryIdRequest\x12\x1d\n\nnursery_id\x18\x01 \x01(\tR\tnurseryId\"N\n\x1dGetBusListByNurseryIdResponse\x12-\n\x05\x62uses\x18\x01 \x03(\x0b\x32\x17.where_child_bus.v1.BusR\x05\x62uses2\x8a\x01\n\nBusService\x12|\n\x15GetBusListByNurseryId\x12\x30.where_child_bus.v1.GetBusListByNurseryIdRequest\x1a\x31.where_child_bus.v1.GetBusListByNurseryIdResponseB\xeb\x01\n\x16\x63om.where_child_bus.v1B\x08\x42usProtoP\x01Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\xa2\x02\x03WXX\xaa\x02\x10WhereChildBus.V1\xca\x02\x10WhereChildBus\\V1\xe2\x02\x1cWhereChildBus\\V1\\GPBMetadata\xea\x02\x11WhereChildBus::V1b\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'where_child_bus.v1.bus_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:
  _globals['DESCRIPTOR']._options = None
  _globals['DESCRIPTOR']._serialized_options = b'\n\026com.where_child_bus.v1B\010BusProtoP\001Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\242\002\003WXX\252\002\020WhereChildBus.V1\312\002\020WhereChildBus\\V1\342\002\034WhereChildBus\\V1\\GPBMetadata\352\002\021WhereChildBus::V1'
  _globals['_GETBUSLISTBYNURSERYIDREQUEST']._serialized_start=88
  _globals['_GETBUSLISTBYNURSERYIDREQUEST']._serialized_end=149
  _globals['_GETBUSLISTBYNURSERYIDRESPONSE']._serialized_start=151
  _globals['_GETBUSLISTBYNURSERYIDRESPONSE']._serialized_end=229
  _globals['_BUSSERVICE']._serialized_start=232
  _globals['_BUSSERVICE']._serialized_end=370
# @@protoc_insertion_point(module_scope)