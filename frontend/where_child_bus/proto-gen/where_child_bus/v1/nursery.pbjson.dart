//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/nursery.proto
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

@$core.Deprecated('Use nurseryLoginRequestDescriptor instead')
const NurseryLoginRequest$json = {
  '1': 'NurseryLoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `NurseryLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nurseryLoginRequestDescriptor = $convert.base64Decode(
    'ChNOdXJzZXJ5TG9naW5SZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIaCghwYXNzd29yZB'
    'gCIAEoCVIIcGFzc3dvcmQ=');

@$core.Deprecated('Use nurseryLoginResponseDescriptor instead')
const NurseryLoginResponse$json = {
  '1': 'NurseryLoginResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'nursery', '3': 2, '4': 1, '5': 11, '6': '.where_child_bus.v1.Nursery', '10': 'nursery'},
  ],
};

/// Descriptor for `NurseryLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nurseryLoginResponseDescriptor = $convert.base64Decode(
    'ChROdXJzZXJ5TG9naW5SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEjUKB251cn'
    'NlcnkYAiABKAsyGy53aGVyZV9jaGlsZF9idXMudjEuTnVyc2VyeVIHbnVyc2VyeQ==');

const $core.Map<$core.String, $core.dynamic> NurseryServiceBase$json = {
  '1': 'NurseryService',
  '2': [
    {'1': 'NurseryLogin', '2': '.where_child_bus.v1.NurseryLoginRequest', '3': '.where_child_bus.v1.NurseryLoginResponse'},
  ],
};

@$core.Deprecated('Use nurseryServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> NurseryServiceBase$messageJson = {
  '.where_child_bus.v1.NurseryLoginRequest': NurseryLoginRequest$json,
  '.where_child_bus.v1.NurseryLoginResponse': NurseryLoginResponse$json,
  '.where_child_bus.v1.Nursery': $1.Nursery$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
};

/// Descriptor for `NurseryService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List nurseryServiceDescriptor = $convert.base64Decode(
    'Cg5OdXJzZXJ5U2VydmljZRJhCgxOdXJzZXJ5TG9naW4SJy53aGVyZV9jaGlsZF9idXMudjEuTn'
    'Vyc2VyeUxvZ2luUmVxdWVzdBooLndoZXJlX2NoaWxkX2J1cy52MS5OdXJzZXJ5TG9naW5SZXNw'
    'b25zZQ==');

