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

import '../../google/protobuf/timestamp.pbjson.dart' as $0;
import 'resources.pbjson.dart' as $1;

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

const $core.Map<$core.String, $core.dynamic> ChildServiceBase$json = {
  '1': 'ChildService',
  '2': [
    {'1': 'GetChildListByNurseryID', '2': '.where_child_bus.v1.GetChildListByNurseryIDRequest', '3': '.where_child_bus.v1.GetChildListByNurseryIDResponse'},
    {'1': 'GetChildListByGuardianID', '2': '.where_child_bus.v1.GetChildListByGuardianIDRequest', '3': '.where_child_bus.v1.GetChildListByGuardianIDResponse'},
  ],
};

@$core.Deprecated('Use childServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> ChildServiceBase$messageJson = {
  '.where_child_bus.v1.GetChildListByNurseryIDRequest': GetChildListByNurseryIDRequest$json,
  '.where_child_bus.v1.GetChildListByNurseryIDResponse': GetChildListByNurseryIDResponse$json,
  '.where_child_bus.v1.Child': $1.Child$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.where_child_bus.v1.GetChildListByGuardianIDRequest': GetChildListByGuardianIDRequest$json,
  '.where_child_bus.v1.GetChildListByGuardianIDResponse': GetChildListByGuardianIDResponse$json,
};

/// Descriptor for `ChildService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List childServiceDescriptor = $convert.base64Decode(
    'CgxDaGlsZFNlcnZpY2USggEKF0dldENoaWxkTGlzdEJ5TnVyc2VyeUlEEjIud2hlcmVfY2hpbG'
    'RfYnVzLnYxLkdldENoaWxkTGlzdEJ5TnVyc2VyeUlEUmVxdWVzdBozLndoZXJlX2NoaWxkX2J1'
    'cy52MS5HZXRDaGlsZExpc3RCeU51cnNlcnlJRFJlc3BvbnNlEoUBChhHZXRDaGlsZExpc3RCeU'
    'd1YXJkaWFuSUQSMy53aGVyZV9jaGlsZF9idXMudjEuR2V0Q2hpbGRMaXN0QnlHdWFyZGlhbklE'
    'UmVxdWVzdBo0LndoZXJlX2NoaWxkX2J1cy52MS5HZXRDaGlsZExpc3RCeUd1YXJkaWFuSURSZX'
    'Nwb25zZQ==');

