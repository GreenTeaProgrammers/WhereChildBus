//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/bus.proto
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

@$core.Deprecated('Use createBusRequestDescriptor instead')
const CreateBusRequest$json = {
  '1': 'CreateBusRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'plate_number', '3': 3, '4': 1, '5': 9, '10': 'plateNumber'},
    {'1': 'child_ids', '3': 4, '4': 3, '5': 9, '10': 'childIds'},
  ],
};

/// Descriptor for `CreateBusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusRequestDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVCdXNSZXF1ZXN0Eh0KCm51cnNlcnlfaWQYASABKAlSCW51cnNlcnlJZBISCgRuYW'
    '1lGAIgASgJUgRuYW1lEiEKDHBsYXRlX251bWJlchgDIAEoCVILcGxhdGVOdW1iZXISGwoJY2hp'
    'bGRfaWRzGAQgAygJUghjaGlsZElkcw==');

@$core.Deprecated('Use createBusResponseDescriptor instead')
const CreateBusResponse$json = {
  '1': 'CreateBusResponse',
  '2': [
    {'1': 'bus', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Bus', '10': 'bus'},
    {'1': 'children', '3': 2, '4': 3, '5': 11, '6': '.where_child_bus.v1.Child', '10': 'children'},
  ],
};

/// Descriptor for `CreateBusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusResponseDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVCdXNSZXNwb25zZRIpCgNidXMYASABKAsyFy53aGVyZV9jaGlsZF9idXMudjEuQn'
    'VzUgNidXMSNQoIY2hpbGRyZW4YAiADKAsyGS53aGVyZV9jaGlsZF9idXMudjEuQ2hpbGRSCGNo'
    'aWxkcmVu');

@$core.Deprecated('Use getBusListByNurseryIdRequestDescriptor instead')
const GetBusListByNurseryIdRequest$json = {
  '1': 'GetBusListByNurseryIdRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
  ],
};

/// Descriptor for `GetBusListByNurseryIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusListByNurseryIdRequestDescriptor = $convert.base64Decode(
    'ChxHZXRCdXNMaXN0QnlOdXJzZXJ5SWRSZXF1ZXN0Eh0KCm51cnNlcnlfaWQYASABKAlSCW51cn'
    'NlcnlJZA==');

@$core.Deprecated('Use getBusListByNurseryIdResponseDescriptor instead')
const GetBusListByNurseryIdResponse$json = {
  '1': 'GetBusListByNurseryIdResponse',
  '2': [
    {'1': 'buses', '3': 1, '4': 3, '5': 11, '6': '.where_child_bus.v1.Bus', '10': 'buses'},
  ],
};

/// Descriptor for `GetBusListByNurseryIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusListByNurseryIdResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRCdXNMaXN0QnlOdXJzZXJ5SWRSZXNwb25zZRItCgVidXNlcxgBIAMoCzIXLndoZXJlX2'
    'NoaWxkX2J1cy52MS5CdXNSBWJ1c2Vz');

const $core.Map<$core.String, $core.dynamic> BusServiceBase$json = {
  '1': 'BusService',
  '2': [
    {'1': 'CreateBus', '2': '.where_child_bus.v1.CreateBusRequest', '3': '.where_child_bus.v1.CreateBusResponse'},
    {'1': 'GetBusListByNurseryId', '2': '.where_child_bus.v1.GetBusListByNurseryIdRequest', '3': '.where_child_bus.v1.GetBusListByNurseryIdResponse'},
  ],
};

@$core.Deprecated('Use busServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> BusServiceBase$messageJson = {
  '.where_child_bus.v1.CreateBusRequest': CreateBusRequest$json,
  '.where_child_bus.v1.CreateBusResponse': CreateBusResponse$json,
  '.where_child_bus.v1.Bus': $1.Bus$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.where_child_bus.v1.Child': $1.Child$json,
  '.where_child_bus.v1.GetBusListByNurseryIdRequest': GetBusListByNurseryIdRequest$json,
  '.where_child_bus.v1.GetBusListByNurseryIdResponse': GetBusListByNurseryIdResponse$json,
};

/// Descriptor for `BusService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List busServiceDescriptor = $convert.base64Decode(
    'CgpCdXNTZXJ2aWNlElgKCUNyZWF0ZUJ1cxIkLndoZXJlX2NoaWxkX2J1cy52MS5DcmVhdGVCdX'
    'NSZXF1ZXN0GiUud2hlcmVfY2hpbGRfYnVzLnYxLkNyZWF0ZUJ1c1Jlc3BvbnNlEnwKFUdldEJ1'
    'c0xpc3RCeU51cnNlcnlJZBIwLndoZXJlX2NoaWxkX2J1cy52MS5HZXRCdXNMaXN0QnlOdXJzZX'
    'J5SWRSZXF1ZXN0GjEud2hlcmVfY2hpbGRfYnVzLnYxLkdldEJ1c0xpc3RCeU51cnNlcnlJZFJl'
    'c3BvbnNl');

