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

@$core.Deprecated('Use createGuardianRequestDescriptor instead')
const CreateGuardianRequest$json = {
  '1': 'CreateGuardianRequest',
  '2': [
    {'1': 'nursery_code', '3': 1, '4': 1, '5': 9, '10': 'nurseryCode'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone_number', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
  ],
};

/// Descriptor for `CreateGuardianRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGuardianRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVHdWFyZGlhblJlcXVlc3QSIQoMbnVyc2VyeV9jb2RlGAEgASgJUgtudXJzZXJ5Q2'
    '9kZRIUCgVlbWFpbBgCIAEoCVIFZW1haWwSGgoIcGFzc3dvcmQYAyABKAlSCHBhc3N3b3JkEhIK'
    'BG5hbWUYBCABKAlSBG5hbWUSIQoMcGhvbmVfbnVtYmVyGAUgASgJUgtwaG9uZU51bWJlcg==');

@$core.Deprecated('Use createGuardianResponseDescriptor instead')
const CreateGuardianResponse$json = {
  '1': 'CreateGuardianResponse',
  '2': [
    {'1': 'guardian', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.GuardianResponse', '10': 'guardian'},
  ],
};

/// Descriptor for `CreateGuardianResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGuardianResponseDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVHdWFyZGlhblJlc3BvbnNlEkAKCGd1YXJkaWFuGAEgASgLMiQud2hlcmVfY2hpbG'
    'RfYnVzLnYxLkd1YXJkaWFuUmVzcG9uc2VSCGd1YXJkaWFu');

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
    {'1': 'nursery', '3': 3, '4': 1, '5': 11, '6': '.where_child_bus.v1.NurseryResponse', '10': 'nursery'},
  ],
};

/// Descriptor for `GuardianLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guardianLoginResponseDescriptor = $convert.base64Decode(
    'ChVHdWFyZGlhbkxvZ2luUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxJACghndW'
    'FyZGlhbhgCIAEoCzIkLndoZXJlX2NoaWxkX2J1cy52MS5HdWFyZGlhblJlc3BvbnNlUghndWFy'
    'ZGlhbhI9CgdudXJzZXJ5GAMgASgLMiMud2hlcmVfY2hpbGRfYnVzLnYxLk51cnNlcnlSZXNwb2'
    '5zZVIHbnVyc2VyeQ==');

@$core.Deprecated('Use getGuardianListByBusIdRequestDescriptor instead')
const GetGuardianListByBusIdRequest$json = {
  '1': 'GetGuardianListByBusIdRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
  ],
};

/// Descriptor for `GetGuardianListByBusIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGuardianListByBusIdRequestDescriptor = $convert.base64Decode(
    'Ch1HZXRHdWFyZGlhbkxpc3RCeUJ1c0lkUmVxdWVzdBIVCgZidXNfaWQYASABKAlSBWJ1c0lk');

@$core.Deprecated('Use getGuardianListByBusIdResponseDescriptor instead')
const GetGuardianListByBusIdResponse$json = {
  '1': 'GetGuardianListByBusIdResponse',
  '2': [
    {'1': 'guardians', '3': 1, '4': 3, '5': 11, '6': '.where_child_bus.v1.GuardianResponse', '10': 'guardians'},
  ],
};

/// Descriptor for `GetGuardianListByBusIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGuardianListByBusIdResponseDescriptor = $convert.base64Decode(
    'Ch5HZXRHdWFyZGlhbkxpc3RCeUJ1c0lkUmVzcG9uc2USQgoJZ3VhcmRpYW5zGAEgAygLMiQud2'
    'hlcmVfY2hpbGRfYnVzLnYxLkd1YXJkaWFuUmVzcG9uc2VSCWd1YXJkaWFucw==');

@$core.Deprecated('Use getGuardianByChildIdRequestDescriptor instead')
const GetGuardianByChildIdRequest$json = {
  '1': 'GetGuardianByChildIdRequest',
  '2': [
    {'1': 'child_id', '3': 1, '4': 1, '5': 9, '10': 'childId'},
  ],
};

/// Descriptor for `GetGuardianByChildIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGuardianByChildIdRequestDescriptor = $convert.base64Decode(
    'ChtHZXRHdWFyZGlhbkJ5Q2hpbGRJZFJlcXVlc3QSGQoIY2hpbGRfaWQYASABKAlSB2NoaWxkSW'
    'Q=');

@$core.Deprecated('Use getGuardianByChildIdResponseDescriptor instead')
const GetGuardianByChildIdResponse$json = {
  '1': 'GetGuardianByChildIdResponse',
  '2': [
    {'1': 'guardian', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.GuardianResponse', '10': 'guardian'},
  ],
};

/// Descriptor for `GetGuardianByChildIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGuardianByChildIdResponseDescriptor = $convert.base64Decode(
    'ChxHZXRHdWFyZGlhbkJ5Q2hpbGRJZFJlc3BvbnNlEkAKCGd1YXJkaWFuGAEgASgLMiQud2hlcm'
    'VfY2hpbGRfYnVzLnYxLkd1YXJkaWFuUmVzcG9uc2VSCGd1YXJkaWFu');

