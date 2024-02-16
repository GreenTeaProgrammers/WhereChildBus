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

@$core.Deprecated('Use trainRequestDescriptor instead')
const TrainRequest$json = {
  '1': 'TrainRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'child_id', '3': 2, '4': 3, '5': 9, '10': 'childId'},
    {'1': 'bus_id', '3': 3, '4': 1, '5': 9, '10': 'busId'},
  ],
};

/// Descriptor for `TrainRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trainRequestDescriptor = $convert.base64Decode(
    'CgxUcmFpblJlcXVlc3QSHQoKbnVyc2VyeV9pZBgBIAEoCVIJbnVyc2VyeUlkEhkKCGNoaWxkX2'
    'lkGAIgAygJUgdjaGlsZElkEhUKBmJ1c19pZBgDIAEoCVIFYnVzSWQ=');

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
  ],
};

/// Descriptor for `PredRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List predRequestDescriptor = $convert.base64Decode(
    'CgtQcmVkUmVxdWVzdBIVCgZidXNfaWQYASABKAlSBWJ1c0lk');

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

