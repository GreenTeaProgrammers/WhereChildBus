# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: where_child_bus/health_check.proto
# Protobuf Python Version: 4.25.2
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\"where_child_bus/health_check.proto\x12\x0fwhere_child_bus\"!\n\x0bPingRequest\x12\x12\n\x04name\x18\x01 \x01(\tR\x04name\"(\n\x0cPingResponse\x12\x18\n\x07message\x18\x01 \x01(\tR\x07message2Y\n\x12HealthcheckService\x12\x43\n\x04Ping\x12\x1c.where_child_bus.PingRequest\x1a\x1d.where_child_bus.PingResponseB\xce\x01\n\x13\x63om.where_child_busB\x10HealthCheckProtoP\x01ZQgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus\xa2\x02\x03WXX\xaa\x02\rWhereChildBus\xca\x02\rWhereChildBus\xe2\x02\x19WhereChildBus\\GPBMetadata\xea\x02\rWhereChildBusb\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'where_child_bus.health_check_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:
  _globals['DESCRIPTOR']._options = None
  _globals['DESCRIPTOR']._serialized_options = b'\n\023com.where_child_busB\020HealthCheckProtoP\001ZQgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus\242\002\003WXX\252\002\rWhereChildBus\312\002\rWhereChildBus\342\002\031WhereChildBus\\GPBMetadata\352\002\rWhereChildBus'
  _globals['_PINGREQUEST']._serialized_start=55
  _globals['_PINGREQUEST']._serialized_end=88
  _globals['_PINGRESPONSE']._serialized_start=90
  _globals['_PINGRESPONSE']._serialized_end=130
  _globals['_HEALTHCHECKSERVICE']._serialized_start=132
  _globals['_HEALTHCHECKSERVICE']._serialized_end=221
# @@protoc_insertion_point(module_scope)
