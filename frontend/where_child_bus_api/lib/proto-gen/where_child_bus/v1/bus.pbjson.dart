//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/bus.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createBusRequestDescriptor instead')
const CreateBusRequest$json = {
  '1': 'CreateBusRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'plate_number', '3': 3, '4': 1, '5': 9, '10': 'plateNumber'},
    {'1': 'morning_guardian_ids', '3': 4, '4': 3, '5': 9, '10': 'morningGuardianIds'},
    {'1': 'evening_guardian_ids', '3': 5, '4': 3, '5': 9, '10': 'eveningGuardianIds'},
  ],
};

/// Descriptor for `CreateBusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusRequestDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVCdXNSZXF1ZXN0Eh0KCm51cnNlcnlfaWQYASABKAlSCW51cnNlcnlJZBISCgRuYW'
    '1lGAIgASgJUgRuYW1lEiEKDHBsYXRlX251bWJlchgDIAEoCVILcGxhdGVOdW1iZXISMAoUbW9y'
    'bmluZ19ndWFyZGlhbl9pZHMYBCADKAlSEm1vcm5pbmdHdWFyZGlhbklkcxIwChRldmVuaW5nX2'
    'd1YXJkaWFuX2lkcxgFIAMoCVISZXZlbmluZ0d1YXJkaWFuSWRz');

@$core.Deprecated('Use createBusResponseDescriptor instead')
const CreateBusResponse$json = {
  '1': 'CreateBusResponse',
  '2': [
    {'1': 'bus', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Bus', '10': 'bus'},
  ],
};

/// Descriptor for `CreateBusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusResponseDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVCdXNSZXNwb25zZRIpCgNidXMYASABKAsyFy53aGVyZV9jaGlsZF9idXMudjEuQn'
    'VzUgNidXM=');

@$core.Deprecated('Use getBusListByNurseryIdRequestDescriptor instead')
const GetBusListByNurseryIdRequest$json = {
  '1': 'GetBusListByNurseryIdRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
  ],
};

/// Descriptor for `GetBusListByNurseryIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusListByNurseryIdRequestDescriptor = $convert.base64Decode(
    'ChxHZXRCdXNMaXN0QnlOdXJzZXJ5SWRSZXF1ZXN0Eh0KCm51cnNlcnlfaWQYASABKAlSCW51cn'
    'NlcnlJZA==');

@$core.Deprecated('Use getBusListByNurseryIdResponseDescriptor instead')
const GetBusListByNurseryIdResponse$json = {
  '1': 'GetBusListByNurseryIdResponse',
  '2': [
    {'1': 'buses', '3': 1, '4': 3, '5': 11, '6': '.where_child_bus.v1.Bus', '10': 'buses'},
  ],
};

/// Descriptor for `GetBusListByNurseryIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusListByNurseryIdResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRCdXNMaXN0QnlOdXJzZXJ5SWRSZXNwb25zZRItCgVidXNlcxgBIAMoCzIXLndoZXJlX2'
    'NoaWxkX2J1cy52MS5CdXNSBWJ1c2Vz');

@$core.Deprecated('Use changeBusStatusRequestDescriptor instead')
const ChangeBusStatusRequest$json = {
  '1': 'ChangeBusStatusRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.where_child_bus.v1.Status', '10': 'status'},
  ],
};

/// Descriptor for `ChangeBusStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeBusStatusRequestDescriptor = $convert.base64Decode(
    'ChZDaGFuZ2VCdXNTdGF0dXNSZXF1ZXN0EhUKBmJ1c19pZBgBIAEoCVIFYnVzSWQSMgoGc3RhdH'
    'VzGAIgASgOMhoud2hlcmVfY2hpbGRfYnVzLnYxLlN0YXR1c1IGc3RhdHVz');

@$core.Deprecated('Use changeBusStatusResponseDescriptor instead')
const ChangeBusStatusResponse$json = {
  '1': 'ChangeBusStatusResponse',
  '2': [
    {'1': 'bus', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Bus', '10': 'bus'},
  ],
};

/// Descriptor for `ChangeBusStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeBusStatusResponseDescriptor = $convert.base64Decode(
    'ChdDaGFuZ2VCdXNTdGF0dXNSZXNwb25zZRIpCgNidXMYASABKAsyFy53aGVyZV9jaGlsZF9idX'
    'MudjEuQnVzUgNidXM=');

