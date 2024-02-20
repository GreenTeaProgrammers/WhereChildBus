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

@$core.Deprecated('Use updateStationLocationByGuardianIdRequestDescriptor instead')
const UpdateStationLocationByGuardianIdRequest$json = {
  '1': 'UpdateStationLocationByGuardianIdRequest',
  '2': [
    {'1': 'guardian_id', '3': 1, '4': 1, '5': 9, '10': 'guardianId'},
    {'1': 'longitude', '3': 2, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'latitude', '3': 3, '4': 1, '5': 1, '10': 'latitude'},
  ],
};

/// Descriptor for `UpdateStationLocationByGuardianIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStationLocationByGuardianIdRequestDescriptor = $convert.base64Decode(
    'CihVcGRhdGVTdGF0aW9uTG9jYXRpb25CeUd1YXJkaWFuSWRSZXF1ZXN0Eh8KC2d1YXJkaWFuX2'
    'lkGAEgASgJUgpndWFyZGlhbklkEhwKCWxvbmdpdHVkZRgCIAEoAVIJbG9uZ2l0dWRlEhoKCGxh'
    'dGl0dWRlGAMgASgBUghsYXRpdHVkZQ==');

@$core.Deprecated('Use updateStationLocationByGuardianIdResponseDescriptor instead')
const UpdateStationLocationByGuardianIdResponse$json = {
  '1': 'UpdateStationLocationByGuardianIdResponse',
  '2': [
    {'1': 'station', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Station', '10': 'station'},
  ],
};

/// Descriptor for `UpdateStationLocationByGuardianIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStationLocationByGuardianIdResponseDescriptor = $convert.base64Decode(
    'CilVcGRhdGVTdGF0aW9uTG9jYXRpb25CeUd1YXJkaWFuSWRSZXNwb25zZRI1CgdzdGF0aW9uGA'
    'EgASgLMhsud2hlcmVfY2hpbGRfYnVzLnYxLlN0YXRpb25SB3N0YXRpb24=');

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
    {'1': 'photos', '3': 4, '4': 3, '5': 11, '6': '.where_child_bus.v1.ChildPhoto', '10': 'photos'},
  ],
};

/// Descriptor for `GetStationListByBusIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStationListByBusIdResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRTdGF0aW9uTGlzdEJ5QnVzSWRSZXNwb25zZRI3CghzdGF0aW9ucxgBIAMoCzIbLndoZX'
    'JlX2NoaWxkX2J1cy52MS5TdGF0aW9uUghzdGF0aW9ucxJCCglndWFyZGlhbnMYAiADKAsyJC53'
    'aGVyZV9jaGlsZF9idXMudjEuR3VhcmRpYW5SZXNwb25zZVIJZ3VhcmRpYW5zEjUKCGNoaWxkcm'
    'VuGAMgAygLMhkud2hlcmVfY2hpbGRfYnVzLnYxLkNoaWxkUghjaGlsZHJlbhI2CgZwaG90b3MY'
    'BCADKAsyHi53aGVyZV9jaGlsZF9idXMudjEuQ2hpbGRQaG90b1IGcGhvdG9z');

@$core.Deprecated('Use getUnregisteredStationListRequestDescriptor instead')
const GetUnregisteredStationListRequest$json = {
  '1': 'GetUnregisteredStationListRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
  ],
};

/// Descriptor for `GetUnregisteredStationListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUnregisteredStationListRequestDescriptor = $convert.base64Decode(
    'CiFHZXRVbnJlZ2lzdGVyZWRTdGF0aW9uTGlzdFJlcXVlc3QSFQoGYnVzX2lkGAEgASgJUgVidX'
    'NJZA==');

@$core.Deprecated('Use getUnregisteredStationListResponseDescriptor instead')
const GetUnregisteredStationListResponse$json = {
  '1': 'GetUnregisteredStationListResponse',
  '2': [
    {'1': 'stations', '3': 1, '4': 3, '5': 11, '6': '.where_child_bus.v1.Station', '10': 'stations'},
    {'1': 'guardians', '3': 2, '4': 3, '5': 11, '6': '.where_child_bus.v1.GuardianResponse', '10': 'guardians'},
  ],
};

/// Descriptor for `GetUnregisteredStationListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUnregisteredStationListResponseDescriptor = $convert.base64Decode(
    'CiJHZXRVbnJlZ2lzdGVyZWRTdGF0aW9uTGlzdFJlc3BvbnNlEjcKCHN0YXRpb25zGAEgAygLMh'
    'sud2hlcmVfY2hpbGRfYnVzLnYxLlN0YXRpb25SCHN0YXRpb25zEkIKCWd1YXJkaWFucxgCIAMo'
    'CzIkLndoZXJlX2NoaWxkX2J1cy52MS5HdWFyZGlhblJlc3BvbnNlUglndWFyZGlhbnM=');

@$core.Deprecated('Use updateStationRequestDescriptor instead')
const UpdateStationRequest$json = {
  '1': 'UpdateStationRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'bus_id', '3': 2, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'latitude', '3': 3, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 4, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'update_mask', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'updateMask'},
  ],
};

/// Descriptor for `UpdateStationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStationRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVTdGF0aW9uUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSFQoGYnVzX2lkGAIgASgJUg'
    'VidXNJZBIaCghsYXRpdHVkZRgDIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAQgASgBUgls'
    'b25naXR1ZGUSOwoLdXBkYXRlX21hc2sYBSABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYX'
    'NrUgp1cGRhdGVNYXNr');

@$core.Deprecated('Use updateStationResponseDescriptor instead')
const UpdateStationResponse$json = {
  '1': 'UpdateStationResponse',
  '2': [
    {'1': 'station', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Station', '10': 'station'},
  ],
};

/// Descriptor for `UpdateStationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStationResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVTdGF0aW9uUmVzcG9uc2USNQoHc3RhdGlvbhgBIAEoCzIbLndoZXJlX2NoaWxkX2'
    'J1cy52MS5TdGF0aW9uUgdzdGF0aW9u');

