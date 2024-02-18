//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/child.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createChildRequestDescriptor instead')
const CreateChildRequest$json = {
  '1': 'CreateChildRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'guardian_id', '3': 2, '4': 1, '5': 9, '10': 'guardianId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'age', '3': 4, '4': 1, '5': 5, '10': 'age'},
    {'1': 'sex', '3': 5, '4': 1, '5': 14, '6': '.where_child_bus.v1.Sex', '10': 'sex'},
    {'1': 'photos', '3': 6, '4': 3, '5': 12, '10': 'photos'},
  ],
};

/// Descriptor for `CreateChildRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChildRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVDaGlsZFJlcXVlc3QSHQoKbnVyc2VyeV9pZBgBIAEoCVIJbnVyc2VyeUlkEh8KC2'
    'd1YXJkaWFuX2lkGAIgASgJUgpndWFyZGlhbklkEhIKBG5hbWUYAyABKAlSBG5hbWUSEAoDYWdl'
    'GAQgASgFUgNhZ2USKQoDc2V4GAUgASgOMhcud2hlcmVfY2hpbGRfYnVzLnYxLlNleFIDc2V4Eh'
    'YKBnBob3RvcxgGIAMoDFIGcGhvdG9z');

@$core.Deprecated('Use createChildResponseDescriptor instead')
const CreateChildResponse$json = {
  '1': 'CreateChildResponse',
  '2': [
    {'1': 'child', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Child', '10': 'child'},
  ],
};

/// Descriptor for `CreateChildResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChildResponseDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVDaGlsZFJlc3BvbnNlEi8KBWNoaWxkGAEgASgLMhkud2hlcmVfY2hpbGRfYnVzLn'
    'YxLkNoaWxkUgVjaGlsZA==');

@$core.Deprecated('Use getChildListByNurseryIDRequestDescriptor instead')
const GetChildListByNurseryIDRequest$json = {
  '1': 'GetChildListByNurseryIDRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
  ],
};

/// Descriptor for `GetChildListByNurseryIDRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByNurseryIDRequestDescriptor = $convert.base64Decode(
    'Ch5HZXRDaGlsZExpc3RCeU51cnNlcnlJRFJlcXVlc3QSHQoKbnVyc2VyeV9pZBgBIAEoCVIJbn'
    'Vyc2VyeUlk');

@$core.Deprecated('Use getChildListByNurseryIDResponseDescriptor instead')
const GetChildListByNurseryIDResponse$json = {
  '1': 'GetChildListByNurseryIDResponse',
  '2': [
    {'1': 'children', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Children', '9': 0, '10': 'children'},
    {'1': 'photo', '3': 2, '4': 1, '5': 11, '6': '.where_child_bus.v1.ChildPhoto', '9': 0, '10': 'photo'},
  ],
  '8': [
    {'1': 'response_type'},
  ],
};

/// Descriptor for `GetChildListByNurseryIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByNurseryIDResponseDescriptor = $convert.base64Decode(
    'Ch9HZXRDaGlsZExpc3RCeU51cnNlcnlJRFJlc3BvbnNlEjoKCGNoaWxkcmVuGAEgASgLMhwud2'
    'hlcmVfY2hpbGRfYnVzLnYxLkNoaWxkcmVuSABSCGNoaWxkcmVuEjYKBXBob3RvGAIgASgLMh4u'
    'd2hlcmVfY2hpbGRfYnVzLnYxLkNoaWxkUGhvdG9IAFIFcGhvdG9CDwoNcmVzcG9uc2VfdHlwZQ'
    '==');

@$core.Deprecated('Use getChildListByGuardianIDRequestDescriptor instead')
const GetChildListByGuardianIDRequest$json = {
  '1': 'GetChildListByGuardianIDRequest',
  '2': [
    {'1': 'guardian_id', '3': 1, '4': 1, '5': 9, '10': 'guardianId'},
  ],
};

/// Descriptor for `GetChildListByGuardianIDRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByGuardianIDRequestDescriptor = $convert.base64Decode(
    'Ch9HZXRDaGlsZExpc3RCeUd1YXJkaWFuSURSZXF1ZXN0Eh8KC2d1YXJkaWFuX2lkGAEgASgJUg'
    'pndWFyZGlhbklk');

@$core.Deprecated('Use getChildListByGuardianIDResponseDescriptor instead')
const GetChildListByGuardianIDResponse$json = {
  '1': 'GetChildListByGuardianIDResponse',
  '2': [
    {'1': 'children', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Children', '9': 0, '10': 'children'},
    {'1': 'photo', '3': 2, '4': 1, '5': 11, '6': '.where_child_bus.v1.ChildPhoto', '9': 0, '10': 'photo'},
  ],
  '8': [
    {'1': 'response_type'},
  ],
};

/// Descriptor for `GetChildListByGuardianIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByGuardianIDResponseDescriptor = $convert.base64Decode(
    'CiBHZXRDaGlsZExpc3RCeUd1YXJkaWFuSURSZXNwb25zZRI6CghjaGlsZHJlbhgBIAEoCzIcLn'
    'doZXJlX2NoaWxkX2J1cy52MS5DaGlsZHJlbkgAUghjaGlsZHJlbhI2CgVwaG90bxgCIAEoCzIe'
    'LndoZXJlX2NoaWxkX2J1cy52MS5DaGlsZFBob3RvSABSBXBob3RvQg8KDXJlc3BvbnNlX3R5cG'
    'U=');

@$core.Deprecated('Use getChildListByBusIDRequestDescriptor instead')
const GetChildListByBusIDRequest$json = {
  '1': 'GetChildListByBusIDRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
  ],
};

/// Descriptor for `GetChildListByBusIDRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByBusIDRequestDescriptor = $convert.base64Decode(
    'ChpHZXRDaGlsZExpc3RCeUJ1c0lEUmVxdWVzdBIVCgZidXNfaWQYASABKAlSBWJ1c0lk');

@$core.Deprecated('Use getChildListByBusIDResponseDescriptor instead')
const GetChildListByBusIDResponse$json = {
  '1': 'GetChildListByBusIDResponse',
  '2': [
    {'1': 'children', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Children', '9': 0, '10': 'children'},
    {'1': 'photo', '3': 2, '4': 1, '5': 11, '6': '.where_child_bus.v1.ChildPhoto', '9': 0, '10': 'photo'},
  ],
  '8': [
    {'1': 'response_type'},
  ],
};

/// Descriptor for `GetChildListByBusIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByBusIDResponseDescriptor = $convert.base64Decode(
    'ChtHZXRDaGlsZExpc3RCeUJ1c0lEUmVzcG9uc2USOgoIY2hpbGRyZW4YASABKAsyHC53aGVyZV'
    '9jaGlsZF9idXMudjEuQ2hpbGRyZW5IAFIIY2hpbGRyZW4SNgoFcGhvdG8YAiABKAsyHi53aGVy'
    'ZV9jaGlsZF9idXMudjEuQ2hpbGRQaG90b0gAUgVwaG90b0IPCg1yZXNwb25zZV90eXBl');

