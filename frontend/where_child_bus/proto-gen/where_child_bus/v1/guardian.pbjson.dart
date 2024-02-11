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

import '../../google/protobuf/timestamp.pbjson.dart' as $0;
import 'resources.pbjson.dart' as $1;

@$core.Deprecated('Use guardianLoginRequestDescriptor instead')
const GuardianLoginRequest$json = {
  '1': 'GuardianLoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'guardian_id', '3': 3, '4': 1, '5': 9, '10': 'guardianId'},
  ],
};

/// Descriptor for `GuardianLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guardianLoginRequestDescriptor = $convert.base64Decode(
    'ChRHdWFyZGlhbkxvZ2luUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSGgoIcGFzc3dvcm'
    'QYAiABKAlSCHBhc3N3b3JkEh8KC2d1YXJkaWFuX2lkGAMgASgJUgpndWFyZGlhbklk');

@$core.Deprecated('Use guardianLoginResponseDescriptor instead')
const GuardianLoginResponse$json = {
  '1': 'GuardianLoginResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'guardian', '3': 2, '4': 1, '5': 11, '6': '.where_child_bus.v1.Guardian', '10': 'guardian'},
  ],
};

/// Descriptor for `GuardianLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guardianLoginResponseDescriptor = $convert.base64Decode(
    'ChVHdWFyZGlhbkxvZ2luUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxI4CghndW'
    'FyZGlhbhgCIAEoCzIcLndoZXJlX2NoaWxkX2J1cy52MS5HdWFyZGlhblIIZ3VhcmRpYW4=');

const $core.Map<$core.String, $core.dynamic> GuardianServiceBase$json = {
  '1': 'GuardianService',
  '2': [
    {'1': 'GuardianLogin', '2': '.where_child_bus.v1.GuardianLoginRequest', '3': '.where_child_bus.v1.GuardianLoginResponse'},
  ],
};

@$core.Deprecated('Use guardianServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> GuardianServiceBase$messageJson = {
  '.where_child_bus.v1.GuardianLoginRequest': GuardianLoginRequest$json,
  '.where_child_bus.v1.GuardianLoginResponse': GuardianLoginResponse$json,
  '.where_child_bus.v1.Guardian': $1.Guardian$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
};

/// Descriptor for `GuardianService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List guardianServiceDescriptor = $convert.base64Decode(
    'Cg9HdWFyZGlhblNlcnZpY2USZAoNR3VhcmRpYW5Mb2dpbhIoLndoZXJlX2NoaWxkX2J1cy52MS'
    '5HdWFyZGlhbkxvZ2luUmVxdWVzdBopLndoZXJlX2NoaWxkX2J1cy52MS5HdWFyZGlhbkxvZ2lu'
    'UmVzcG9uc2U=');

