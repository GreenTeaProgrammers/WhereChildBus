//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/resources.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use busStatusDescriptor instead')
const BusStatus$json = {
  '1': 'BusStatus',
  '2': [
    {'1': 'BUS_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'BUS_STATUS_STOPPED', '2': 1},
    {'1': 'BUS_STATUS_RUNNING', '2': 2},
    {'1': 'BUS_STATUS_MAINTENANCE', '2': 3},
  ],
};

/// Descriptor for `BusStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List busStatusDescriptor = $convert.base64Decode(
    'CglCdXNTdGF0dXMSGgoWQlVTX1NUQVRVU19VTlNQRUNJRklFRBAAEhYKEkJVU19TVEFUVVNfU1'
    'RPUFBFRBABEhYKEkJVU19TVEFUVVNfUlVOTklORxACEhoKFkJVU19TVEFUVVNfTUFJTlRFTkFO'
    'Q0UQAw==');

@$core.Deprecated('Use vehicleEventDescriptor instead')
const VehicleEvent$json = {
  '1': 'VehicleEvent',
  '2': [
    {'1': 'VEHICLE_EVENT_UNSPECIFIED', '2': 0},
    {'1': 'VEHICLE_EVENT_GET_ON', '2': 1},
    {'1': 'VEHICLE_EVENT_GET_OFF', '2': 2},
  ],
};

/// Descriptor for `VehicleEvent`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List vehicleEventDescriptor = $convert.base64Decode(
    'CgxWZWhpY2xlRXZlbnQSHQoZVkVISUNMRV9FVkVOVF9VTlNQRUNJRklFRBAAEhgKFFZFSElDTE'
    'VfRVZFTlRfR0VUX09OEAESGQoVVkVISUNMRV9FVkVOVF9HRVRfT0ZGEAI=');

@$core.Deprecated('Use sexDescriptor instead')
const Sex$json = {
  '1': 'Sex',
  '2': [
    {'1': 'SEX_UNSPECIFIED', '2': 0},
    {'1': 'SEX_MAN', '2': 1},
    {'1': 'SEX_WOMAN', '2': 2},
    {'1': 'SEX_OTHER', '2': 3},
  ],
};

/// Descriptor for `Sex`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sexDescriptor = $convert.base64Decode(
    'CgNTZXgSEwoPU0VYX1VOU1BFQ0lGSUVEEAASCwoHU0VYX01BThABEg0KCVNFWF9XT01BThACEg'
    '0KCVNFWF9PVEhFUhAD');

@$core.Deprecated('Use busTypeDescriptor instead')
const BusType$json = {
  '1': 'BusType',
  '2': [
    {'1': 'BUS_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'BUS_TYPE_MORNING', '2': 1},
    {'1': 'BUS_TYPE_EVENING', '2': 2},
  ],
};

/// Descriptor for `BusType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List busTypeDescriptor = $convert.base64Decode(
    'CgdCdXNUeXBlEhgKFEJVU19UWVBFX1VOU1BFQ0lGSUVEEAASFAoQQlVTX1RZUEVfTU9STklORx'
    'ABEhQKEEJVU19UWVBFX0VWRU5JTkcQAg==');

@$core.Deprecated('Use nurseryDescriptor instead')
const Nursery$json = {
  '1': 'Nursery',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_code', '3': 2, '4': 1, '5': 9, '10': 'nurseryCode'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
    {'1': 'phone_number', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'email', '3': 6, '4': 1, '5': 9, '10': 'email'},
    {'1': 'hashed_password', '3': 7, '4': 1, '5': 9, '10': 'hashedPassword'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Nursery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nurseryDescriptor = $convert.base64Decode(
    'CgdOdXJzZXJ5Eg4KAmlkGAEgASgJUgJpZBIhCgxudXJzZXJ5X2NvZGUYAiABKAlSC251cnNlcn'
    'lDb2RlEhIKBG5hbWUYAyABKAlSBG5hbWUSGAoHYWRkcmVzcxgEIAEoCVIHYWRkcmVzcxIhCgxw'
    'aG9uZV9udW1iZXIYBSABKAlSC3Bob25lTnVtYmVyEhQKBWVtYWlsGAYgASgJUgVlbWFpbBInCg'
    '9oYXNoZWRfcGFzc3dvcmQYByABKAlSDmhhc2hlZFBhc3N3b3JkEjkKCmNyZWF0ZWRfYXQYCCAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdB'
    'gJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use nurseryResponseDescriptor instead')
const NurseryResponse$json = {
  '1': 'NurseryResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_code', '3': 2, '4': 1, '5': 9, '10': 'nurseryCode'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
    {'1': 'phone_number', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'email', '3': 6, '4': 1, '5': 9, '10': 'email'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `NurseryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nurseryResponseDescriptor = $convert.base64Decode(
    'Cg9OdXJzZXJ5UmVzcG9uc2USDgoCaWQYASABKAlSAmlkEiEKDG51cnNlcnlfY29kZRgCIAEoCV'
    'ILbnVyc2VyeUNvZGUSEgoEbmFtZRgDIAEoCVIEbmFtZRIYCgdhZGRyZXNzGAQgASgJUgdhZGRy'
    'ZXNzEiEKDHBob25lX251bWJlchgFIAEoCVILcGhvbmVOdW1iZXISFAoFZW1haWwYBiABKAlSBW'
    'VtYWlsEjkKCmNyZWF0ZWRfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglj'
    'cmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbX'
    'BSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use guardianDescriptor instead')
const Guardian$json = {
  '1': 'Guardian',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone_number', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'hashed_password', '3': 6, '4': 1, '5': 9, '10': 'hashedPassword'},
    {'1': 'is_use_morning_bus', '3': 7, '4': 1, '5': 8, '10': 'isUseMorningBus'},
    {'1': 'is_use_evening_bus', '3': 8, '4': 1, '5': 8, '10': 'isUseEveningBus'},
    {'1': 'created_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Guardian`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guardianDescriptor = $convert.base64Decode(
    'CghHdWFyZGlhbhIOCgJpZBgBIAEoCVICaWQSHQoKbnVyc2VyeV9pZBgCIAEoCVIJbnVyc2VyeU'
    'lkEhIKBG5hbWUYAyABKAlSBG5hbWUSFAoFZW1haWwYBCABKAlSBWVtYWlsEiEKDHBob25lX251'
    'bWJlchgFIAEoCVILcGhvbmVOdW1iZXISJwoPaGFzaGVkX3Bhc3N3b3JkGAYgASgJUg5oYXNoZW'
    'RQYXNzd29yZBIrChJpc191c2VfbW9ybmluZ19idXMYByABKAhSD2lzVXNlTW9ybmluZ0J1cxIr'
    'ChJpc191c2VfZXZlbmluZ19idXMYCCABKAhSD2lzVXNlRXZlbmluZ0J1cxI5CgpjcmVhdGVkX2'
    'F0GAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0'
    'ZWRfYXQYCiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use guardianResponseDescriptor instead')
const GuardianResponse$json = {
  '1': 'GuardianResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone_number', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'is_use_morning_bus', '3': 6, '4': 1, '5': 8, '10': 'isUseMorningBus'},
    {'1': 'is_use_evening_bus', '3': 7, '4': 1, '5': 8, '10': 'isUseEveningBus'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `GuardianResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guardianResponseDescriptor = $convert.base64Decode(
    'ChBHdWFyZGlhblJlc3BvbnNlEg4KAmlkGAEgASgJUgJpZBIdCgpudXJzZXJ5X2lkGAIgASgJUg'
    'ludXJzZXJ5SWQSEgoEbmFtZRgDIAEoCVIEbmFtZRIUCgVlbWFpbBgEIAEoCVIFZW1haWwSIQoM'
    'cGhvbmVfbnVtYmVyGAUgASgJUgtwaG9uZU51bWJlchIrChJpc191c2VfbW9ybmluZ19idXMYBi'
    'ABKAhSD2lzVXNlTW9ybmluZ0J1cxIrChJpc191c2VfZXZlbmluZ19idXMYByABKAhSD2lzVXNl'
    'RXZlbmluZ0J1cxI5CgpjcmVhdGVkX2F0GAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYCSABKAsyGi5nb29nbGUucHJvdG9idWYuVGlt'
    'ZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use busDescriptor instead')
const Bus$json = {
  '1': 'Bus',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'plate_number', '3': 4, '4': 1, '5': 9, '10': 'plateNumber'},
    {'1': 'bus_status', '3': 5, '4': 1, '5': 14, '6': '.where_child_bus.v1.BusStatus', '10': 'busStatus'},
    {'1': 'latitude', '3': 6, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 7, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'enable_face_recognition', '3': 8, '4': 1, '5': 8, '10': 'enableFaceRecognition'},
    {'1': 'next_station_id', '3': 11, '4': 1, '5': 9, '10': 'nextStationId'},
    {'1': 'latest_morning_route_id', '3': 14, '4': 1, '5': 9, '10': 'latestMorningRouteId'},
    {'1': 'latest_evening_route_id', '3': 15, '4': 1, '5': 9, '10': 'latestEveningRouteId'},
    {'1': 'created_at', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Bus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List busDescriptor = $convert.base64Decode(
    'CgNCdXMSDgoCaWQYASABKAlSAmlkEh0KCm51cnNlcnlfaWQYAiABKAlSCW51cnNlcnlJZBISCg'
    'RuYW1lGAMgASgJUgRuYW1lEiEKDHBsYXRlX251bWJlchgEIAEoCVILcGxhdGVOdW1iZXISPAoK'
    'YnVzX3N0YXR1cxgFIAEoDjIdLndoZXJlX2NoaWxkX2J1cy52MS5CdXNTdGF0dXNSCWJ1c1N0YX'
    'R1cxIaCghsYXRpdHVkZRgGIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAcgASgBUglsb25n'
    'aXR1ZGUSNgoXZW5hYmxlX2ZhY2VfcmVjb2duaXRpb24YCCABKAhSFWVuYWJsZUZhY2VSZWNvZ2'
    '5pdGlvbhImCg9uZXh0X3N0YXRpb25faWQYCyABKAlSDW5leHRTdGF0aW9uSWQSNQoXbGF0ZXN0'
    'X21vcm5pbmdfcm91dGVfaWQYDiABKAlSFGxhdGVzdE1vcm5pbmdSb3V0ZUlkEjUKF2xhdGVzdF'
    '9ldmVuaW5nX3JvdXRlX2lkGA8gASgJUhRsYXRlc3RFdmVuaW5nUm91dGVJZBI5CgpjcmVhdGVk'
    'X2F0GAwgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZG'
    'F0ZWRfYXQYDSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use childDescriptor instead')
const Child$json = {
  '1': 'Child',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'guardian_id', '3': 3, '4': 1, '5': 9, '10': 'guardianId'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'age', '3': 5, '4': 1, '5': 5, '10': 'age'},
    {'1': 'sex', '3': 6, '4': 1, '5': 14, '6': '.where_child_bus.v1.Sex', '10': 'sex'},
    {'1': 'check_for_missing_items', '3': 7, '4': 1, '5': 8, '10': 'checkForMissingItems'},
    {'1': 'has_bag', '3': 8, '4': 1, '5': 8, '10': 'hasBag'},
    {'1': 'has_lunch_box', '3': 9, '4': 1, '5': 8, '10': 'hasLunchBox'},
    {'1': 'has_water_bottle', '3': 10, '4': 1, '5': 8, '10': 'hasWaterBottle'},
    {'1': 'has_umbrella', '3': 11, '4': 1, '5': 8, '10': 'hasUmbrella'},
    {'1': 'has_other', '3': 12, '4': 1, '5': 8, '10': 'hasOther'},
    {'1': 'created_at', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Child`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List childDescriptor = $convert.base64Decode(
    'CgVDaGlsZBIOCgJpZBgBIAEoCVICaWQSHQoKbnVyc2VyeV9pZBgCIAEoCVIJbnVyc2VyeUlkEh'
    '8KC2d1YXJkaWFuX2lkGAMgASgJUgpndWFyZGlhbklkEhIKBG5hbWUYBCABKAlSBG5hbWUSEAoD'
    'YWdlGAUgASgFUgNhZ2USKQoDc2V4GAYgASgOMhcud2hlcmVfY2hpbGRfYnVzLnYxLlNleFIDc2'
    'V4EjUKF2NoZWNrX2Zvcl9taXNzaW5nX2l0ZW1zGAcgASgIUhRjaGVja0Zvck1pc3NpbmdJdGVt'
    'cxIXCgdoYXNfYmFnGAggASgIUgZoYXNCYWcSIgoNaGFzX2x1bmNoX2JveBgJIAEoCFILaGFzTH'
    'VuY2hCb3gSKAoQaGFzX3dhdGVyX2JvdHRsZRgKIAEoCFIOaGFzV2F0ZXJCb3R0bGUSIQoMaGFz'
    'X3VtYnJlbGxhGAsgASgIUgtoYXNVbWJyZWxsYRIbCgloYXNfb3RoZXIYDCABKAhSCGhhc090aG'
    'VyEjkKCmNyZWF0ZWRfYXQYDSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVh'
    'dGVkQXQSOQoKdXBkYXRlZF9hdBgOIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCX'
    'VwZGF0ZWRBdA==');

@$core.Deprecated('Use stationDescriptor instead')
const Station$json = {
  '1': 'Station',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'guardian_id', '3': 2, '4': 1, '5': 9, '10': 'guardianId'},
    {'1': 'latitude', '3': 5, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 6, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Station`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stationDescriptor = $convert.base64Decode(
    'CgdTdGF0aW9uEg4KAmlkGAEgASgJUgJpZBIfCgtndWFyZGlhbl9pZBgCIAEoCVIKZ3VhcmRpYW'
    '5JZBIaCghsYXRpdHVkZRgFIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAYgASgBUglsb25n'
    'aXR1ZGUSOQoKY3JlYXRlZF9hdBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCW'
    'NyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFt'
    'cFIJdXBkYXRlZEF0');

@$core.Deprecated('Use childBusAssociationDescriptor instead')
const ChildBusAssociation$json = {
  '1': 'ChildBusAssociation',
  '2': [
    {'1': 'bus_route_id', '3': 1, '4': 1, '5': 9, '10': 'busRouteId'},
    {'1': 'child_id', '3': 2, '4': 1, '5': 9, '10': 'childId'},
  ],
};

/// Descriptor for `ChildBusAssociation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List childBusAssociationDescriptor = $convert.base64Decode(
    'ChNDaGlsZEJ1c0Fzc29jaWF0aW9uEiAKDGJ1c19yb3V0ZV9pZBgBIAEoCVIKYnVzUm91dGVJZB'
    'IZCghjaGlsZF9pZBgCIAEoCVIHY2hpbGRJZA==');

@$core.Deprecated('Use childPhotoDescriptor instead')
const ChildPhoto$json = {
  '1': 'ChildPhoto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'child_id', '3': 2, '4': 1, '5': 9, '10': 'childId'},
    {'1': 'photo_data', '3': 3, '4': 1, '5': 12, '10': 'photoData'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `ChildPhoto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List childPhotoDescriptor = $convert.base64Decode(
    'CgpDaGlsZFBob3RvEg4KAmlkGAEgASgJUgJpZBIZCghjaGlsZF9pZBgCIAEoCVIHY2hpbGRJZB'
    'IdCgpwaG90b19kYXRhGAMgASgMUglwaG90b0RhdGESOQoKY3JlYXRlZF9hdBgEIAEoCzIaLmdv'
    'b2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAUgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0');

@$core.Deprecated('Use boardingRecordDescriptor instead')
const BoardingRecord$json = {
  '1': 'BoardingRecord',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'child_id', '3': 2, '4': 1, '5': 9, '10': 'childId'},
    {'1': 'bus_id', '3': 3, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'is_boarding', '3': 4, '4': 1, '5': 8, '10': 'isBoarding'},
    {'1': 'timestamp', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
  ],
};

/// Descriptor for `BoardingRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boardingRecordDescriptor = $convert.base64Decode(
    'Cg5Cb2FyZGluZ1JlY29yZBIOCgJpZBgBIAEoCVICaWQSGQoIY2hpbGRfaWQYAiABKAlSB2NoaW'
    'xkSWQSFQoGYnVzX2lkGAMgASgJUgVidXNJZBIfCgtpc19ib2FyZGluZxgEIAEoCFIKaXNCb2Fy'
    'ZGluZxI4Cgl0aW1lc3RhbXAYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW'
    '1lc3RhbXA=');

@$core.Deprecated('Use busRouteDescriptor instead')
const BusRoute$json = {
  '1': 'BusRoute',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'bus_id', '3': 2, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'ordered_stations', '3': 3, '4': 3, '5': 11, '6': '.where_child_bus.v1.Station', '10': 'orderedStations'},
    {'1': 'bus_type', '3': 4, '4': 1, '5': 14, '6': '.where_child_bus.v1.BusType', '10': 'busType'},
  ],
};

/// Descriptor for `BusRoute`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List busRouteDescriptor = $convert.base64Decode(
    'CghCdXNSb3V0ZRIOCgJpZBgBIAEoCVICaWQSFQoGYnVzX2lkGAIgASgJUgVidXNJZBJGChBvcm'
    'RlcmVkX3N0YXRpb25zGAMgAygLMhsud2hlcmVfY2hpbGRfYnVzLnYxLlN0YXRpb25SD29yZGVy'
    'ZWRTdGF0aW9ucxI2CghidXNfdHlwZRgEIAEoDjIbLndoZXJlX2NoaWxkX2J1cy52MS5CdXNUeX'
    'BlUgdidXNUeXBl');

