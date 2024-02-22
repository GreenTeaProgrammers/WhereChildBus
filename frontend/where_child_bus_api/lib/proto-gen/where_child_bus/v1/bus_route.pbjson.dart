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
    {'1': 'nursery_id', '3': 3, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'guardian_ids', '3': 4, '4': 3, '5': 9, '10': 'guardianIds'},
  ],
};

/// Descriptor for `CreateBusRouteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusRouteRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVCdXNSb3V0ZVJlcXVlc3QSFQoGYnVzX2lkGAEgASgJUgVidXNJZBI2CghidXNfdH'
    'lwZRgCIAEoDjIbLndoZXJlX2NoaWxkX2J1cy52MS5CdXNUeXBlUgdidXNUeXBlEh0KCm51cnNl'
    'cnlfaWQYAyABKAlSCW51cnNlcnlJZBIhCgxndWFyZGlhbl9pZHMYBCADKAlSC2d1YXJkaWFuSW'
    'Rz');

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

@$core.Deprecated('Use getBusRouteByBusIDRequestDescriptor instead')
const GetBusRouteByBusIDRequest$json = {
  '1': 'GetBusRouteByBusIDRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'bus_type', '3': 2, '4': 1, '5': 14, '6': '.where_child_bus.v1.BusType', '10': 'busType'},
  ],
};

/// Descriptor for `GetBusRouteByBusIDRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusRouteByBusIDRequestDescriptor = $convert.base64Decode(
    'ChlHZXRCdXNSb3V0ZUJ5QnVzSURSZXF1ZXN0EhUKBmJ1c19pZBgBIAEoCVIFYnVzSWQSNgoIYn'
    'VzX3R5cGUYAiABKA4yGy53aGVyZV9jaGlsZF9idXMudjEuQnVzVHlwZVIHYnVzVHlwZQ==');

@$core.Deprecated('Use getBusRouteByBusIDResponseDescriptor instead')
const GetBusRouteByBusIDResponse$json = {
  '1': 'GetBusRouteByBusIDResponse',
  '2': [
    {'1': 'bus_route', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.BusRoute', '10': 'busRoute'},
  ],
};

/// Descriptor for `GetBusRouteByBusIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusRouteByBusIDResponseDescriptor = $convert.base64Decode(
    'ChpHZXRCdXNSb3V0ZUJ5QnVzSURSZXNwb25zZRI5CglidXNfcm91dGUYASABKAsyHC53aGVyZV'
    '9jaGlsZF9idXMudjEuQnVzUm91dGVSCGJ1c1JvdXRl');

