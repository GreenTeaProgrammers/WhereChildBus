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
    {'1': 'GetBusListByNurseryId', '2': '.where_child_bus.v1.GetBusListByNurseryIdRequest', '3': '.where_child_bus.v1.GetBusListByNurseryIdResponse'},
  ],
};

@$core.Deprecated('Use busServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> BusServiceBase$messageJson = {
  '.where_child_bus.v1.GetBusListByNurseryIdRequest': GetBusListByNurseryIdRequest$json,
  '.where_child_bus.v1.GetBusListByNurseryIdResponse': GetBusListByNurseryIdResponse$json,
  '.where_child_bus.v1.Bus': $1.Bus$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
};

/// Descriptor for `BusService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List busServiceDescriptor = $convert.base64Decode(
    'CgpCdXNTZXJ2aWNlEnwKFUdldEJ1c0xpc3RCeU51cnNlcnlJZBIwLndoZXJlX2NoaWxkX2J1cy'
    '52MS5HZXRCdXNMaXN0QnlOdXJzZXJ5SWRSZXF1ZXN0GjEud2hlcmVfY2hpbGRfYnVzLnYxLkdl'
    'dEJ1c0xpc3RCeU51cnNlcnlJZFJlc3BvbnNl');

