//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/station.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createStationRequestDescriptor instead')
const CreateStationRequest$json = {
  '1': 'CreateStationRequest',
  '2': [
    {'1': 'guardian_id', '3': 1, '4': 1, '5': 9, '10': 'guardianId'},
    {'1': 'longtitude', '3': 2, '4': 1, '5': 1, '10': 'longtitude'},
    {'1': 'latitude', '3': 3, '4': 1, '5': 1, '10': 'latitude'},
  ],
};

/// Descriptor for `CreateStationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStationRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVTdGF0aW9uUmVxdWVzdBIfCgtndWFyZGlhbl9pZBgBIAEoCVIKZ3VhcmRpYW5JZB'
    'IeCgpsb25ndGl0dWRlGAIgASgBUgpsb25ndGl0dWRlEhoKCGxhdGl0dWRlGAMgASgBUghsYXRp'
    'dHVkZQ==');

@$core.Deprecated('Use createStationResponseDescriptor instead')
const CreateStationResponse$json = {
  '1': 'CreateStationResponse',
  '2': [
    {'1': 'station', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Station', '10': 'station'},
  ],
};

/// Descriptor for `CreateStationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStationResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVTdGF0aW9uUmVzcG9uc2USNQoHc3RhdGlvbhgBIAEoCzIbLndoZXJlX2NoaWxkX2'
    'J1cy52MS5TdGF0aW9uUgdzdGF0aW9u');

@$core.Deprecated('Use getStationListByBusIdRequestDescriptor instead')
const GetStationListByBusIdRequest$json = {
  '1': 'GetStationListByBusIdRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
  ],
};

/// Descriptor for `GetStationListByBusIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStationListByBusIdRequestDescriptor = $convert.base64Decode(
    'ChxHZXRTdGF0aW9uTGlzdEJ5QnVzSWRSZXF1ZXN0EhUKBmJ1c19pZBgBIAEoCVIFYnVzSWQ=');

@$core.Deprecated('Use getStationListByBusIdResponseDescriptor instead')
const GetStationListByBusIdResponse$json = {
  '1': 'GetStationListByBusIdResponse',
  '2': [
    {'1': 'stations', '3': 1, '4': 3, '5': 11, '6': '.where_child_bus.v1.Station', '10': 'stations'},
    {'1': 'guardians', '3': 2, '4': 3, '5': 11, '6': '.where_child_bus.v1.GuardianResponse', '10': 'guardians'},
    {'1': 'children', '3': 3, '4': 3, '5': 11, '6': '.where_child_bus.v1.Child', '10': 'children'},
  ],
};

/// Descriptor for `GetStationListByBusIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStationListByBusIdResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRTdGF0aW9uTGlzdEJ5QnVzSWRSZXNwb25zZRI3CghzdGF0aW9ucxgBIAMoCzIbLndoZX'
    'JlX2NoaWxkX2J1cy52MS5TdGF0aW9uUghzdGF0aW9ucxJCCglndWFyZGlhbnMYAiADKAsyJC53'
    'aGVyZV9jaGlsZF9idXMudjEuR3VhcmRpYW5SZXNwb25zZVIJZ3VhcmRpYW5zEjUKCGNoaWxkcm'
    'VuGAMgAygLMhkud2hlcmVfY2hpbGRfYnVzLnYxLkNoaWxkUghjaGlsZHJlbg==');

