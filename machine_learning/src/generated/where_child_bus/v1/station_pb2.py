# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: where_child_bus/v1/station.proto
# Protobuf Python Version: 4.25.2
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from where_child_bus.v1 import resources_pb2 as where__child__bus_dot_v1_dot_resources__pb2
from google.protobuf import field_mask_pb2 as google_dot_protobuf_dot_field__mask__pb2


DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n where_child_bus/v1/station.proto\x12\x12where_child_bus.v1\x1a\"where_child_bus/v1/resources.proto\x1a google/protobuf/field_mask.proto\"\x85\x01\n(UpdateStationLocationByGuardianIdRequest\x12\x1f\n\x0bguardian_id\x18\x01 \x01(\tR\nguardianId\x12\x1c\n\tlongitude\x18\x02 \x01(\x01R\tlongitude\x12\x1a\n\x08latitude\x18\x03 \x01(\x01R\x08latitude\"b\n)UpdateStationLocationByGuardianIdResponse\x12\x35\n\x07station\x18\x01 \x01(\x0b\x32\x1b.where_child_bus.v1.StationR\x07station\"5\n\x1cGetStationListByBusIdRequest\x12\x15\n\x06\x62us_id\x18\x01 \x01(\tR\x05\x62usId\"\x8b\x02\n\x1dGetStationListByBusIdResponse\x12\x37\n\x08stations\x18\x01 \x03(\x0b\x32\x1b.where_child_bus.v1.StationR\x08stations\x12\x42\n\tguardians\x18\x02 \x03(\x0b\x32$.where_child_bus.v1.GuardianResponseR\tguardians\x12\x35\n\x08\x63hildren\x18\x03 \x03(\x0b\x32\x19.where_child_bus.v1.ChildR\x08\x63hildren\x12\x36\n\x06photos\x18\x04 \x03(\x0b\x32\x1e.where_child_bus.v1.ChildPhotoR\x06photos\":\n!GetUnregisteredStationListRequest\x12\x15\n\x06\x62us_id\x18\x01 \x01(\tR\x05\x62usId\"\xa1\x01\n\"GetUnregisteredStationListResponse\x12\x37\n\x08stations\x18\x01 \x03(\x0b\x32\x1b.where_child_bus.v1.StationR\x08stations\x12\x42\n\tguardians\x18\x02 \x03(\x0b\x32$.where_child_bus.v1.GuardianResponseR\tguardians\"\xb4\x01\n\x14UpdateStationRequest\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x15\n\x06\x62us_id\x18\x02 \x01(\tR\x05\x62usId\x12\x1a\n\x08latitude\x18\x03 \x01(\x01R\x08latitude\x12\x1c\n\tlongitude\x18\x04 \x01(\x01R\tlongitude\x12;\n\x0bupdate_mask\x18\x05 \x01(\x0b\x32\x1a.google.protobuf.FieldMaskR\nupdateMask\"N\n\x15UpdateStationResponse\x12\x35\n\x07station\x18\x01 \x01(\x0b\x32\x1b.where_child_bus.v1.StationR\x07station2\xa5\x04\n\x0eStationService\x12\xa0\x01\n!UpdateStationLocationByGuardianId\x12<.where_child_bus.v1.UpdateStationLocationByGuardianIdRequest\x1a=.where_child_bus.v1.UpdateStationLocationByGuardianIdResponse\x12|\n\x15GetStationListByBusId\x12\x30.where_child_bus.v1.GetStationListByBusIdRequest\x1a\x31.where_child_bus.v1.GetStationListByBusIdResponse\x12\x8b\x01\n\x1aGetUnregisteredStationList\x12\x35.where_child_bus.v1.GetUnregisteredStationListRequest\x1a\x36.where_child_bus.v1.GetUnregisteredStationListResponse\x12\x64\n\rUpdateStation\x12(.where_child_bus.v1.UpdateStationRequest\x1a).where_child_bus.v1.UpdateStationResponseB\xef\x01\n\x16\x63om.where_child_bus.v1B\x0cStationProtoP\x01Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\xa2\x02\x03WXX\xaa\x02\x10WhereChildBus.V1\xca\x02\x10WhereChildBus\\V1\xe2\x02\x1cWhereChildBus\\V1\\GPBMetadata\xea\x02\x11WhereChildBus::V1b\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'where_child_bus.v1.station_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:
  _globals['DESCRIPTOR']._options = None
  _globals['DESCRIPTOR']._serialized_options = b'\n\026com.where_child_bus.v1B\014StationProtoP\001Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\242\002\003WXX\252\002\020WhereChildBus.V1\312\002\020WhereChildBus\\V1\342\002\034WhereChildBus\\V1\\GPBMetadata\352\002\021WhereChildBus::V1'
  _globals['_UPDATESTATIONLOCATIONBYGUARDIANIDREQUEST']._serialized_start=127
  _globals['_UPDATESTATIONLOCATIONBYGUARDIANIDREQUEST']._serialized_end=260
  _globals['_UPDATESTATIONLOCATIONBYGUARDIANIDRESPONSE']._serialized_start=262
  _globals['_UPDATESTATIONLOCATIONBYGUARDIANIDRESPONSE']._serialized_end=360
  _globals['_GETSTATIONLISTBYBUSIDREQUEST']._serialized_start=362
  _globals['_GETSTATIONLISTBYBUSIDREQUEST']._serialized_end=415
  _globals['_GETSTATIONLISTBYBUSIDRESPONSE']._serialized_start=418
  _globals['_GETSTATIONLISTBYBUSIDRESPONSE']._serialized_end=685
  _globals['_GETUNREGISTEREDSTATIONLISTREQUEST']._serialized_start=687
  _globals['_GETUNREGISTEREDSTATIONLISTREQUEST']._serialized_end=745
  _globals['_GETUNREGISTEREDSTATIONLISTRESPONSE']._serialized_start=748
  _globals['_GETUNREGISTEREDSTATIONLISTRESPONSE']._serialized_end=909
  _globals['_UPDATESTATIONREQUEST']._serialized_start=912
  _globals['_UPDATESTATIONREQUEST']._serialized_end=1092
  _globals['_UPDATESTATIONRESPONSE']._serialized_start=1094
  _globals['_UPDATESTATIONRESPONSE']._serialized_end=1172
  _globals['_STATIONSERVICE']._serialized_start=1175
  _globals['_STATIONSERVICE']._serialized_end=1724
# @@protoc_insertion_point(module_scope)
