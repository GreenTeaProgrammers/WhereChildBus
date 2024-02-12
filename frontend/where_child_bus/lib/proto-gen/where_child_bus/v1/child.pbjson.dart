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
    {'1': 'children', '3': 1, '4': 3, '5': 11, '6': '.where_child_bus.v1.Child', '10': 'children'},
  ],
};

/// Descriptor for `GetChildListByNurseryIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByNurseryIDResponseDescriptor = $convert.base64Decode(
    'Ch9HZXRDaGlsZExpc3RCeU51cnNlcnlJRFJlc3BvbnNlEjUKCGNoaWxkcmVuGAEgAygLMhkud2'
    'hlcmVfY2hpbGRfYnVzLnYxLkNoaWxkUghjaGlsZHJlbg==');

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
    {'1': 'children', '3': 1, '4': 3, '5': 11, '6': '.where_child_bus.v1.Child', '10': 'children'},
  ],
};

/// Descriptor for `GetChildListByGuardianIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByGuardianIDResponseDescriptor = $convert.base64Decode(
    'CiBHZXRDaGlsZExpc3RCeUd1YXJkaWFuSURSZXNwb25zZRI1CghjaGlsZHJlbhgBIAMoCzIZLn'
    'doZXJlX2NoaWxkX2J1cy52MS5DaGlsZFIIY2hpbGRyZW4=');

