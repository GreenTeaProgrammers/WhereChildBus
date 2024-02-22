//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/bus_route.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createBusRouteRequestDescriptor instead')
const CreateBusRouteRequest$json = {
  '1': 'CreateBusRouteRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'bus_type', '3': 2, '4': 1, '5': 14, '6': '.where_child_bus.v1.BusType', '10': 'busType'},
    {'1': 'guardian_ids', '3': 3, '4': 3, '5': 9, '10': 'guardianIds'},
  ],
};

/// Descriptor for `CreateBusRouteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusRouteRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVCdXNSb3V0ZVJlcXVlc3QSFQoGYnVzX2lkGAEgASgJUgVidXNJZBI2CghidXNfdH'
    'lwZRgCIAEoDjIbLndoZXJlX2NoaWxkX2J1cy52MS5CdXNUeXBlUgdidXNUeXBlEiEKDGd1YXJk'
    'aWFuX2lkcxgDIAMoCVILZ3VhcmRpYW5JZHM=');

@$core.Deprecated('Use createBusRouteResponseDescriptor instead')
const CreateBusRouteResponse$json = {
  '1': 'CreateBusRouteResponse',
  '2': [
    {'1': 'bus_route', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.BusRoute', '10': 'busRoute'},
  ],
};

/// Descriptor for `CreateBusRouteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusRouteResponseDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVCdXNSb3V0ZVJlc3BvbnNlEjkKCWJ1c19yb3V0ZRgBIAEoCzIcLndoZXJlX2NoaW'
    'xkX2J1cy52MS5CdXNSb3V0ZVIIYnVzUm91dGU=');

@$core.Deprecated('Use getBusRouteRequestDescriptor instead')
const GetBusRouteRequest$json = {
  '1': 'GetBusRouteRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'bus_type', '3': 2, '4': 1, '5': 14, '6': '.where_child_bus.v1.BusType', '10': 'busType'},
  ],
};

/// Descriptor for `GetBusRouteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusRouteRequestDescriptor = $convert.base64Decode(
    'ChJHZXRCdXNSb3V0ZVJlcXVlc3QSFQoGYnVzX2lkGAEgASgJUgVidXNJZBI2CghidXNfdHlwZR'
    'gCIAEoDjIbLndoZXJlX2NoaWxkX2J1cy52MS5CdXNUeXBlUgdidXNUeXBl');

@$core.Deprecated('Use getBusRouteResponseDescriptor instead')
const GetBusRouteResponse$json = {
  '1': 'GetBusRouteResponse',
  '2': [
    {'1': 'bus_route', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.BusRoute', '10': 'busRoute'},
  ],
};

/// Descriptor for `GetBusRouteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusRouteResponseDescriptor = $convert.base64Decode(
    'ChNHZXRCdXNSb3V0ZVJlc3BvbnNlEjkKCWJ1c19yb3V0ZRgBIAEoCzIcLndoZXJlX2NoaWxkX2'
    'J1cy52MS5CdXNSb3V0ZVIIYnVzUm91dGU=');

