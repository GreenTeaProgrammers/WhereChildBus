//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/guardian.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use guardianLoginRequestDescriptor instead')
const GuardianLoginRequest$json = {
  '1': 'GuardianLoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `GuardianLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guardianLoginRequestDescriptor = $convert.base64Decode(
    'ChRHdWFyZGlhbkxvZ2luUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSGgoIcGFzc3dvcm'
    'QYAiABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use guardianLoginResponseDescriptor instead')
const GuardianLoginResponse$json = {
  '1': 'GuardianLoginResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'guardian', '3': 2, '4': 1, '5': 11, '6': '.where_child_bus.v1.GuardianResponse', '10': 'guardian'},
    {'1': 'nursery', '3': 3, '4': 1, '5': 11, '6': '.where_child_bus.v1.NurseryReponse', '10': 'nursery'},
  ],
};

/// Descriptor for `GuardianLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guardianLoginResponseDescriptor = $convert.base64Decode(
    'ChVHdWFyZGlhbkxvZ2luUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxJACghndW'
    'FyZGlhbhgCIAEoCzIkLndoZXJlX2NoaWxkX2J1cy52MS5HdWFyZGlhblJlc3BvbnNlUghndWFy'
    'ZGlhbhI8CgdudXJzZXJ5GAMgASgLMiIud2hlcmVfY2hpbGRfYnVzLnYxLk51cnNlcnlSZXBvbn'
    'NlUgdudXJzZXJ5');

