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


DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x1cwhere_child_bus/v1/bus.proto\x12\x12where_child_bus.v1\x1a\"where_child_bus/v1/resources.proto\"\xcc\x01\n\x10\x43reateBusRequest\x12\x1d\n\nnursery_id\x18\x01 \x01(\tR\tnurseryId\x12\x12\n\x04name\x18\x02 \x01(\tR\x04name\x12!\n\x0cplate_number\x18\x03 \x01(\tR\x0bplateNumber\x12\x30\n\x14morning_guardian_ids\x18\x04 \x03(\tR\x12morningGuardianIds\x12\x30\n\x14\x65vening_guardian_ids\x18\x05 \x03(\tR\x12\x65veningGuardianIds\">\n\x11\x43reateBusResponse\x12)\n\x03\x62us\x18\x01 \x01(\x0b\x32\x17.where_child_bus.v1.BusR\x03\x62us\"=\n\x1cGetBusListByNurseryIdRequest\x12\x1d\n\nnursery_id\x18\x01 \x01(\tR\tnurseryId\"N\n\x1dGetBusListByNurseryIdResponse\x12-\n\x05\x62uses\x18\x01 \x03(\x0b\x32\x17.where_child_bus.v1.BusR\x05\x62uses\"c\n\x16\x43hangeBusStatusRequest\x12\x15\n\x06\x62us_id\x18\x01 \x01(\tR\x05\x62usId\x12\x32\n\x06status\x18\x02 \x01(\x0e\x32\x1a.where_child_bus.v1.StatusR\x06status\"D\n\x17\x43hangeBusStatusResponse\x12)\n\x03\x62us\x18\x01 \x01(\x0b\x32\x17.where_child_bus.v1.BusR\x03\x62us\"p\n\x1dSendLocationContinuousRequest\x12\x15\n\x06\x62us_id\x18\x01 \x01(\tR\x05\x62usId\x12\x1a\n\x08latitude\x18\x02 \x01(\x01R\x08latitude\x12\x1c\n\tlongitude\x18\x03 \x01(\x01R\tlongitude\" \n\x1eSendLocationContinuousResponse\"2\n\x19TrackBusContinuousRequest\x12\x15\n\x06\x62us_id\x18\x01 \x01(\tR\x05\x62usId\"m\n\x1aTrackBusContinuousResponse\x12\x15\n\x06\x62us_id\x18\x01 \x01(\tR\x05\x62usId\x12\x1a\n\x08latitude\x18\x02 \x01(\x01R\x08latitude\x12\x1c\n\tlongitude\x18\x03 \x01(\x01R\tlongitude\"\xe4\x01\n\x15StreamBusVideoRequest\x12\x15\n\x06\x62us_id\x18\x01 \x01(\tR\x05\x62usId\x12\x1d\n\nnursery_id\x18\x02 \x01(\tR\tnurseryId\x12\x36\n\x08\x62us_type\x18\x03 \x01(\x0e\x32\x1b.where_child_bus.v1.BusTypeR\x07\x62usType\x12<\n\nvideo_type\x18\x04 \x01(\x0e\x32\x1d.where_child_bus.v1.VideoTypeR\tvideoType\x12\x1f\n\x0bvideo_chunk\x18\x05 \x01(\x0cR\nvideoChunk\"p\n\x16StreamBusVideoResponse\x12\x1f\n\x0bis_detected\x18\x01 \x01(\x08R\nisDetected\x12\x35\n\x08\x63hildren\x18\x02 \x03(\x0b\x32\x19.where_child_bus.v1.ChildR\x08\x63hildren2\xb6\x05\n\nBusService\x12X\n\tCreateBus\x12$.where_child_bus.v1.CreateBusRequest\x1a%.where_child_bus.v1.CreateBusResponse\x12|\n\x15GetBusListByNurseryId\x12\x30.where_child_bus.v1.GetBusListByNurseryIdRequest\x1a\x31.where_child_bus.v1.GetBusListByNurseryIdResponse\x12j\n\x0f\x43hangeBusStatus\x12*.where_child_bus.v1.ChangeBusStatusRequest\x1a+.where_child_bus.v1.ChangeBusStatusResponse\x12\x81\x01\n\x16SendLocationContinuous\x12\x31.where_child_bus.v1.SendLocationContinuousRequest\x1a\x32.where_child_bus.v1.SendLocationContinuousResponse(\x01\x12u\n\x12TrackBusContinuous\x12-.where_child_bus.v1.TrackBusContinuousRequest\x1a..where_child_bus.v1.TrackBusContinuousResponse0\x01\x12i\n\x0eStreamBusVideo\x12).where_child_bus.v1.StreamBusVideoRequest\x1a*.where_child_bus.v1.StreamBusVideoResponse(\x01\x42\xeb\x01\n\x16\x63om.where_child_bus.v1B\x08\x42usProtoP\x01Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\xa2\x02\x03WXX\xaa\x02\x10WhereChildBus.V1\xca\x02\x10WhereChildBus\\V1\xe2\x02\x1cWhereChildBus\\V1\\GPBMetadata\xea\x02\x11WhereChildBus::V1b\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'where_child_bus.v1.bus_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:
  _globals['DESCRIPTOR']._options = None
  _globals['DESCRIPTOR']._serialized_options = b'\n\026com.where_child_bus.v1B\010BusProtoP\001Zfgithub.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1;where_child_busv1\242\002\003WXX\252\002\020WhereChildBus.V1\312\002\020WhereChildBus\\V1\342\002\034WhereChildBus\\V1\\GPBMetadata\352\002\021WhereChildBus::V1'
  _globals['_CREATEBUSREQUEST']._serialized_start=89
  _globals['_CREATEBUSREQUEST']._serialized_end=293
  _globals['_CREATEBUSRESPONSE']._serialized_start=295
  _globals['_CREATEBUSRESPONSE']._serialized_end=357
  _globals['_GETBUSLISTBYNURSERYIDREQUEST']._serialized_start=359
  _globals['_GETBUSLISTBYNURSERYIDREQUEST']._serialized_end=420
  _globals['_GETBUSLISTBYNURSERYIDRESPONSE']._serialized_start=422
  _globals['_GETBUSLISTBYNURSERYIDRESPONSE']._serialized_end=500
  _globals['_CHANGEBUSSTATUSREQUEST']._serialized_start=502
  _globals['_CHANGEBUSSTATUSREQUEST']._serialized_end=601
  _globals['_CHANGEBUSSTATUSRESPONSE']._serialized_start=603
  _globals['_CHANGEBUSSTATUSRESPONSE']._serialized_end=671
  _globals['_SENDLOCATIONCONTINUOUSREQUEST']._serialized_start=673
  _globals['_SENDLOCATIONCONTINUOUSREQUEST']._serialized_end=785
  _globals['_SENDLOCATIONCONTINUOUSRESPONSE']._serialized_start=787
  _globals['_SENDLOCATIONCONTINUOUSRESPONSE']._serialized_end=819
  _globals['_TRACKBUSCONTINUOUSREQUEST']._serialized_start=821
  _globals['_TRACKBUSCONTINUOUSREQUEST']._serialized_end=871
  _globals['_TRACKBUSCONTINUOUSRESPONSE']._serialized_start=873
  _globals['_TRACKBUSCONTINUOUSRESPONSE']._serialized_end=982
  _globals['_STREAMBUSVIDEOREQUEST']._serialized_start=985
  _globals['_STREAMBUSVIDEOREQUEST']._serialized_end=1213
  _globals['_STREAMBUSVIDEORESPONSE']._serialized_start=1215
  _globals['_STREAMBUSVIDEORESPONSE']._serialized_end=1327
  _globals['_BUSSERVICE']._serialized_start=1330
  _globals['_BUSSERVICE']._serialized_end=2024
# @@protoc_insertion_point(module_scope)
