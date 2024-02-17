//
//  Generated code. Do not modify.
//  source: machine_learning/v1/machine_learning.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use busTypeDescriptor instead')
const BusType$json = {
  '1': 'BusType',
  '2': [
    {'1': 'BUS_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'BUS_TYPE_MORNING', '2': 1},
    {'1': 'BUS_TYPE_EVENING', '2': 2},
  ],
};

/// Descriptor for `BusType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List busTypeDescriptor = $convert.base64Decode(
    'CgdCdXNUeXBlEhgKFEJVU19UWVBFX1VOU1BFQ0lGSUVEEAASFAoQQlVTX1RZUEVfTU9STklORx'
    'ABEhQKEEJVU19UWVBFX0VWRU5JTkcQAg==');

@$core.Deprecated('Use videoTypeDescriptor instead')
const VideoType$json = {
  '1': 'VideoType',
  '2': [
    {'1': 'VIDEO_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'VIDEO_TYPE_GET_ON', '2': 1},
    {'1': 'VIDEO_TYPE_GET_OFF', '2': 2},
  ],
};

/// Descriptor for `VideoType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List videoTypeDescriptor = $convert.base64Decode(
    'CglWaWRlb1R5cGUSGgoWVklERU9fVFlQRV9VTlNQRUNJRklFRBAAEhUKEVZJREVPX1RZUEVfR0'
    'VUX09OEAESFgoSVklERU9fVFlQRV9HRVRfT0ZGEAI=');

@$core.Deprecated('Use trainRequestDescriptor instead')
const TrainRequest$json = {
  '1': 'TrainRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'bus_id', '3': 2, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'child_ids', '3': 3, '4': 3, '5': 9, '10': 'childIds'},
    {'1': 'bus_type', '3': 4, '4': 1, '5': 14, '6': '.machine_learning.v1.BusType', '10': 'busType'},
  ],
};

/// Descriptor for `TrainRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainRequestDescriptor = $convert.base64Decode(
    'CgxUcmFpblJlcXVlc3QSHQoKbnVyc2VyeV9pZBgBIAEoCVIJbnVyc2VyeUlkEhUKBmJ1c19pZB'
    'gCIAEoCVIFYnVzSWQSGwoJY2hpbGRfaWRzGAMgAygJUghjaGlsZElkcxI3CghidXNfdHlwZRgE'
    'IAEoDjIcLm1hY2hpbmVfbGVhcm5pbmcudjEuQnVzVHlwZVIHYnVzVHlwZQ==');

@$core.Deprecated('Use trainResponseDescriptor instead')
const TrainResponse$json = {
  '1': 'TrainResponse',
  '2': [
    {'1': 'is_started', '3': 1, '4': 1, '5': 8, '10': 'isStarted'},
  ],
};

/// Descriptor for `TrainResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainResponseDescriptor = $convert.base64Decode(
    'Cg1UcmFpblJlc3BvbnNlEh0KCmlzX3N0YXJ0ZWQYASABKAhSCWlzU3RhcnRlZA==');

@$core.Deprecated('Use predRequestDescriptor instead')
const PredRequest$json = {
  '1': 'PredRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'bus_type', '3': 2, '4': 1, '5': 14, '6': '.machine_learning.v1.BusType', '10': 'busType'},
    {'1': 'video_type', '3': 3, '4': 1, '5': 14, '6': '.machine_learning.v1.VideoType', '10': 'videoType'},
    {'1': 'video_chunk', '3': 4, '4': 1, '5': 12, '10': 'videoChunk'},
    {'1': 'timestamp', '3': 5, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `PredRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List predRequestDescriptor = $convert.base64Decode(
    'CgtQcmVkUmVxdWVzdBIVCgZidXNfaWQYASABKAlSBWJ1c0lkEjcKCGJ1c190eXBlGAIgASgOMh'
    'wubWFjaGluZV9sZWFybmluZy52MS5CdXNUeXBlUgdidXNUeXBlEj0KCnZpZGVvX3R5cGUYAyAB'
    'KA4yHi5tYWNoaW5lX2xlYXJuaW5nLnYxLlZpZGVvVHlwZVIJdmlkZW9UeXBlEh8KC3ZpZGVvX2'
    'NodW5rGAQgASgMUgp2aWRlb0NodW5rEhwKCXRpbWVzdGFtcBgFIAEoA1IJdGltZXN0YW1w');

@$core.Deprecated('Use predResponseDescriptor instead')
const PredResponse$json = {
  '1': 'PredResponse',
  '2': [
    {'1': 'child_id', '3': 1, '4': 3, '5': 9, '10': 'childId'},
  ],
};

/// Descriptor for `PredResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List predResponseDescriptor = $convert.base64Decode(
    'CgxQcmVkUmVzcG9uc2USGQoIY2hpbGRfaWQYASADKAlSB2NoaWxkSWQ=');

@$core.Deprecated('Use faceDetectAndClipRequestDescriptor instead')
const FaceDetectAndClipRequest$json = {
  '1': 'FaceDetectAndClipRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'child_id', '3': 2, '4': 1, '5': 9, '10': 'childId'},
  ],
};

/// Descriptor for `FaceDetectAndClipRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List faceDetectAndClipRequestDescriptor = $convert.base64Decode(
    'ChhGYWNlRGV0ZWN0QW5kQ2xpcFJlcXVlc3QSHQoKbnVyc2VyeV9pZBgBIAEoCVIJbnVyc2VyeU'
    'lkEhkKCGNoaWxkX2lkGAIgASgJUgdjaGlsZElk');

@$core.Deprecated('Use faceDetectAndClipResponseDescriptor instead')
const FaceDetectAndClipResponse$json = {
  '1': 'FaceDetectAndClipResponse',
  '2': [
    {'1': 'is_started', '3': 1, '4': 1, '5': 8, '10': 'isStarted'},
  ],
};

/// Descriptor for `FaceDetectAndClipResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List faceDetectAndClipResponseDescriptor = $convert.base64Decode(
    'ChlGYWNlRGV0ZWN0QW5kQ2xpcFJlc3BvbnNlEh0KCmlzX3N0YXJ0ZWQYASABKAhSCWlzU3Rhcn'
    'RlZA==');

