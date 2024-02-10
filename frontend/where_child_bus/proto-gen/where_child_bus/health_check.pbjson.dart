//
//  Generated code. Do not modify.
//  source: where_child_bus/health_check.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use pingRequestDescriptor instead')
const PingRequest$json = {
  '1': 'PingRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `PingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingRequestDescriptor = $convert.base64Decode(
    'CgtQaW5nUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1l');

@$core.Deprecated('Use pingResponseDescriptor instead')
const PingResponse$json = {
  '1': 'PingResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `PingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingResponseDescriptor = $convert.base64Decode(
    'CgxQaW5nUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

const $core.Map<$core.String, $core.dynamic> HealthcheckServiceBase$json = {
  '1': 'HealthcheckService',
  '2': [
    {'1': 'Ping', '2': '.where_child_bus.PingRequest', '3': '.where_child_bus.PingResponse'},
  ],
};

@$core.Deprecated('Use healthcheckServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> HealthcheckServiceBase$messageJson = {
  '.where_child_bus.PingRequest': PingRequest$json,
  '.where_child_bus.PingResponse': PingResponse$json,
};

/// Descriptor for `HealthcheckService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List healthcheckServiceDescriptor = $convert.base64Decode(
    'ChJIZWFsdGhjaGVja1NlcnZpY2USQwoEUGluZxIcLndoZXJlX2NoaWxkX2J1cy5QaW5nUmVxdW'
    'VzdBodLndoZXJlX2NoaWxkX2J1cy5QaW5nUmVzcG9uc2U=');

