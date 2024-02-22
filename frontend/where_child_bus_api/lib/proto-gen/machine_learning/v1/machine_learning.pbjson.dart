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

@$core.Deprecated('Use statusDescriptor instead')
const status$json = {
  '1': 'status',
  '2': [
    {'1': 'SUCCESS', '2': 0},
    {'1': 'PROCESSING', '2': 1},
    {'1': 'FAILED', '2': 2},
  ],
};

/// Descriptor for `status`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode(
    'CgZzdGF0dXMSCwoHU1VDQ0VTUxAAEg4KClBST0NFU1NJTkcQARIKCgZGQUlMRUQQAg==');

@$core.Deprecated('Use trainRequestDescriptor instead')
const TrainRequest$json = {
  '1': 'TrainRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'bus_id', '3': 2, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'child_ids', '3': 3, '4': 3, '5': 9, '10': 'childIds'},
    {'1': 'bus_type', '3': 4, '4': 1, '5': 14, '6': '.where_child_bus.v1.BusType', '10': 'busType'},
  ],
};

/// Descriptor for `TrainRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainRequestDescriptor = $convert.base64Decode(
    'CgxUcmFpblJlcXVlc3QSHQoKbnVyc2VyeV9pZBgBIAEoCVIJbnVyc2VyeUlkEhUKBmJ1c19pZB'
    'gCIAEoCVIFYnVzSWQSGwoJY2hpbGRfaWRzGAMgAygJUghjaGlsZElkcxI2CghidXNfdHlwZRgE'
    'IAEoDjIbLndoZXJlX2NoaWxkX2J1cy52MS5CdXNUeXBlUgdidXNUeXBl');

@$core.Deprecated('Use trainResponseDescriptor instead')
const TrainResponse$json = {
  '1': 'TrainResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

/// Descriptor for `TrainResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainResponseDescriptor = $convert.base64Decode(
    'Cg1UcmFpblJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCFIGc3RhdHVz');

@$core.Deprecated('Use predResponseDescriptor instead')
const PredResponse$json = {
  '1': 'PredResponse',
  '2': [
    {'1': 'is_detected', '3': 1, '4': 1, '5': 8, '10': 'isDetected'},
    {'1': 'child_ids', '3': 2, '4': 3, '5': 9, '10': 'childIds'},
  ],
};

/// Descriptor for `PredResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List predResponseDescriptor = $convert.base64Decode(
    'CgxQcmVkUmVzcG9uc2USHwoLaXNfZGV0ZWN0ZWQYASABKAhSCmlzRGV0ZWN0ZWQSGwoJY2hpbG'
    'RfaWRzGAIgAygJUghjaGlsZElkcw==');

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

