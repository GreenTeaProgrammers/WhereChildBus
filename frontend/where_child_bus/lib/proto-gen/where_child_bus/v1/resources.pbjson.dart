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
    {'1': 'encrypted_password', '3': 7, '4': 1, '5': 9, '10': 'encryptedPassword'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Nursery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nurseryDescriptor = $convert.base64Decode(
    'CgdOdXJzZXJ5Eg4KAmlkGAEgASgJUgJpZBIhCgxudXJzZXJ5X2NvZGUYAiABKAlSC251cnNlcn'
    'lDb2RlEhIKBG5hbWUYAyABKAlSBG5hbWUSGAoHYWRkcmVzcxgEIAEoCVIHYWRkcmVzcxIhCgxw'
    'aG9uZV9udW1iZXIYBSABKAlSC3Bob25lTnVtYmVyEhQKBWVtYWlsGAYgASgJUgVlbWFpbBItCh'
    'JlbmNyeXB0ZWRfcGFzc3dvcmQYByABKAlSEWVuY3J5cHRlZFBhc3N3b3JkEjkKCmNyZWF0ZWRf'
    'YXQYCCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYX'
    'RlZF9hdBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use nurseryReponseDescriptor instead')
const NurseryReponse$json = {
  '1': 'NurseryReponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone_number', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `NurseryReponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nurseryReponseDescriptor = $convert.base64Decode(
    'Cg5OdXJzZXJ5UmVwb25zZRIOCgJpZBgBIAEoCVICaWQSHQoKbnVyc2VyeV9pZBgCIAEoCVIJbn'
    'Vyc2VyeUlkEhIKBG5hbWUYAyABKAlSBG5hbWUSFAoFZW1haWwYBCABKAlSBWVtYWlsEiEKDHBo'
    'b25lX251bWJlchgFIAEoCVILcGhvbmVOdW1iZXISOQoKY3JlYXRlZF9hdBgGIAEoCzIaLmdvb2'
    'dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAcgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0');

@$core.Deprecated('Use guardianDescriptor instead')
const Guardian$json = {
  '1': 'Guardian',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone_number', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'encrypted_password', '3': 6, '4': 1, '5': 9, '10': 'encryptedPassword'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Guardian`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guardianDescriptor = $convert.base64Decode(
    'CghHdWFyZGlhbhIOCgJpZBgBIAEoCVICaWQSHQoKbnVyc2VyeV9pZBgCIAEoCVIJbnVyc2VyeU'
    'lkEhIKBG5hbWUYAyABKAlSBG5hbWUSFAoFZW1haWwYBCABKAlSBWVtYWlsEiEKDHBob25lX251'
    'bWJlchgFIAEoCVILcGhvbmVOdW1iZXISLQoSZW5jcnlwdGVkX3Bhc3N3b3JkGAYgASgJUhFlbm'
    'NyeXB0ZWRQYXNzd29yZBI5CgpjcmVhdGVkX2F0GAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRp'
    'bWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYCCABKAsyGi5nb29nbGUucHJvdG9idW'
    'YuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use guardianResponseDescriptor instead')
const GuardianResponse$json = {
  '1': 'GuardianResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone_number', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `GuardianResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guardianResponseDescriptor = $convert.base64Decode(
    'ChBHdWFyZGlhblJlc3BvbnNlEg4KAmlkGAEgASgJUgJpZBIdCgpudXJzZXJ5X2lkGAIgASgJUg'
    'ludXJzZXJ5SWQSEgoEbmFtZRgDIAEoCVIEbmFtZRIUCgVlbWFpbBgEIAEoCVIFZW1haWwSIQoM'
    'cGhvbmVfbnVtYmVyGAUgASgJUgtwaG9uZU51bWJlchI5CgpjcmVhdGVkX2F0GAYgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYByABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use busDescriptor instead')
const Bus$json = {
  '1': 'Bus',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'plate_number', '3': 4, '4': 1, '5': 9, '10': 'plateNumber'},
    {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.where_child_bus.v1.Bus.Status', '10': 'status'},
    {'1': 'latitude', '3': 6, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 7, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
  '4': [Bus_Status$json],
};

@$core.Deprecated('Use busDescriptor instead')
const Bus_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'STATUS_UNSPECIFIED', '2': 0},
    {'1': 'STATUS_STOPPED', '2': 1},
    {'1': 'STATUS_RUNNING', '2': 2},
    {'1': 'STATUS_MAINTEINANCE', '2': 3},
  ],
};

/// Descriptor for `Bus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List busDescriptor = $convert.base64Decode(
    'CgNCdXMSDgoCaWQYASABKAlSAmlkEh0KCm51cnNlcnlfaWQYAiABKAlSCW51cnNlcnlJZBISCg'
    'RuYW1lGAMgASgJUgRuYW1lEiEKDHBsYXRlX251bWJlchgEIAEoCVILcGxhdGVOdW1iZXISNgoG'
    'c3RhdHVzGAUgASgOMh4ud2hlcmVfY2hpbGRfYnVzLnYxLkJ1cy5TdGF0dXNSBnN0YXR1cxIaCg'
    'hsYXRpdHVkZRgGIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAcgASgBUglsb25naXR1ZGUS'
    'OQoKY3JlYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZW'
    'RBdBI5Cgp1cGRhdGVkX2F0GAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBk'
    'YXRlZEF0ImEKBlN0YXR1cxIWChJTVEFUVVNfVU5TUEVDSUZJRUQQABISCg5TVEFUVVNfU1RPUF'
    'BFRBABEhIKDlNUQVRVU19SVU5OSU5HEAISFwoTU1RBVFVTX01BSU5URUlOQU5DRRAD');

@$core.Deprecated('Use childDescriptor instead')
const Child$json = {
  '1': 'Child',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'guardian_id', '3': 3, '4': 1, '5': 9, '10': 'guardianId'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'age', '3': 5, '4': 1, '5': 5, '10': 'age'},
    {'1': 'sex', '3': 6, '4': 1, '5': 14, '6': '.where_child_bus.v1.Child.Sex', '10': 'sex'},
    {'1': 'is_ride_morning_bus', '3': 7, '4': 1, '5': 8, '10': 'isRideMorningBus'},
    {'1': 'is_ride_evening_bus', '3': 8, '4': 1, '5': 8, '10': 'isRideEveningBus'},
    {'1': 'check_for_missing_items', '3': 9, '4': 1, '5': 8, '10': 'checkForMissingItems'},
    {'1': 'has_bag', '3': 10, '4': 1, '5': 8, '10': 'hasBag'},
    {'1': 'has_lunch_box', '3': 11, '4': 1, '5': 8, '10': 'hasLunchBox'},
    {'1': 'has_water_bottle', '3': 12, '4': 1, '5': 8, '10': 'hasWaterBottle'},
    {'1': 'has_umbrera', '3': 13, '4': 1, '5': 8, '10': 'hasUmbrera'},
    {'1': 'has_other', '3': 14, '4': 1, '5': 8, '10': 'hasOther'},
    {'1': 'created_at', '3': 15, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 16, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
  '4': [Child_Sex$json],
};

@$core.Deprecated('Use childDescriptor instead')
const Child_Sex$json = {
  '1': 'Sex',
  '2': [
    {'1': 'SEX_UNSPECIFIED', '2': 0},
    {'1': 'SEX_MAN', '2': 1},
    {'1': 'SEX_WOMEN', '2': 2},
    {'1': 'SEX_OTHER', '2': 3},
  ],
};

/// Descriptor for `Child`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List childDescriptor = $convert.base64Decode(
    'CgVDaGlsZBIOCgJpZBgBIAEoCVICaWQSHQoKbnVyc2VyeV9pZBgCIAEoCVIJbnVyc2VyeUlkEh'
    '8KC2d1YXJkaWFuX2lkGAMgASgJUgpndWFyZGlhbklkEhIKBG5hbWUYBCABKAlSBG5hbWUSEAoD'
    'YWdlGAUgASgFUgNhZ2USLwoDc2V4GAYgASgOMh0ud2hlcmVfY2hpbGRfYnVzLnYxLkNoaWxkLl'
    'NleFIDc2V4Ei0KE2lzX3JpZGVfbW9ybmluZ19idXMYByABKAhSEGlzUmlkZU1vcm5pbmdCdXMS'
    'LQoTaXNfcmlkZV9ldmVuaW5nX2J1cxgIIAEoCFIQaXNSaWRlRXZlbmluZ0J1cxI1ChdjaGVja1'
    '9mb3JfbWlzc2luZ19pdGVtcxgJIAEoCFIUY2hlY2tGb3JNaXNzaW5nSXRlbXMSFwoHaGFzX2Jh'
    'ZxgKIAEoCFIGaGFzQmFnEiIKDWhhc19sdW5jaF9ib3gYCyABKAhSC2hhc0x1bmNoQm94EigKEG'
    'hhc193YXRlcl9ib3R0bGUYDCABKAhSDmhhc1dhdGVyQm90dGxlEh8KC2hhc191bWJyZXJhGA0g'
    'ASgIUgpoYXNVbWJyZXJhEhsKCWhhc19vdGhlchgOIAEoCFIIaGFzT3RoZXISOQoKY3JlYXRlZF'
    '9hdBgPIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRh'
    'dGVkX2F0GBAgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0IkUKA1'
    'NleBITCg9TRVhfVU5TUEVDSUZJRUQQABILCgdTRVhfTUFOEAESDQoJU0VYX1dPTUVOEAISDQoJ'
    'U0VYX09USEVSEAM=');

@$core.Deprecated('Use stationDescriptor instead')
const Station$json = {
  '1': 'Station',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'guardian_id', '3': 2, '4': 1, '5': 9, '10': 'guardianId'},
    {'1': 'latitude', '3': 3, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 4, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'morning_order', '3': 5, '4': 1, '5': 5, '10': 'morningOrder'},
    {'1': 'evening_order', '3': 6, '4': 1, '5': 5, '10': 'eveningOrder'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Station`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stationDescriptor = $convert.base64Decode(
    'CgdTdGF0aW9uEg4KAmlkGAEgASgJUgJpZBIfCgtndWFyZGlhbl9pZBgCIAEoCVIKZ3VhcmRpYW'
    '5JZBIaCghsYXRpdHVkZRgDIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAQgASgBUglsb25n'
    'aXR1ZGUSIwoNbW9ybmluZ19vcmRlchgFIAEoBVIMbW9ybmluZ09yZGVyEiMKDWV2ZW5pbmdfb3'
    'JkZXIYBiABKAVSDGV2ZW5pbmdPcmRlchI5CgpjcmVhdGVkX2F0GAcgASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYCCABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use childBusAssociationDescriptor instead')
const ChildBusAssociation$json = {
  '1': 'ChildBusAssociation',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'bus_id', '3': 2, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'child_id', '3': 3, '4': 1, '5': 9, '10': 'childId'},
    {'1': 'bus_type', '3': 4, '4': 1, '5': 14, '6': '.where_child_bus.v1.ChildBusAssociation.BusType', '10': 'busType'},
  ],
  '4': [ChildBusAssociation_BusType$json],
};

@$core.Deprecated('Use childBusAssociationDescriptor instead')
const ChildBusAssociation_BusType$json = {
  '1': 'BusType',
  '2': [
    {'1': 'BUS_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'BUS_TYPE_MORNING', '2': 1},
    {'1': 'BUS_TYPE_EVENING', '2': 2},
  ],
};

/// Descriptor for `ChildBusAssociation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List childBusAssociationDescriptor = $convert.base64Decode(
    'ChNDaGlsZEJ1c0Fzc29jaWF0aW9uEg4KAmlkGAEgASgJUgJpZBIVCgZidXNfaWQYAiABKAlSBW'
    'J1c0lkEhkKCGNoaWxkX2lkGAMgASgJUgdjaGlsZElkEkoKCGJ1c190eXBlGAQgASgOMi8ud2hl'
    'cmVfY2hpbGRfYnVzLnYxLkNoaWxkQnVzQXNzb2NpYXRpb24uQnVzVHlwZVIHYnVzVHlwZSJPCg'
    'dCdXNUeXBlEhgKFEJVU19UWVBFX1VOU1BFQ0lGSUVEEAASFAoQQlVTX1RZUEVfTU9STklORxAB'
    'EhQKEEJVU19UWVBFX0VWRU5JTkcQAg==');

@$core.Deprecated('Use busStationAssociationDescriptor instead')
const BusStationAssociation$json = {
  '1': 'BusStationAssociation',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'station_id', '3': 2, '4': 1, '5': 9, '10': 'stationId'},
  ],
};

/// Descriptor for `BusStationAssociation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List busStationAssociationDescriptor = $convert.base64Decode(
    'ChVCdXNTdGF0aW9uQXNzb2NpYXRpb24SFQoGYnVzX2lkGAEgASgJUgVidXNJZBIdCgpzdGF0aW'
    '9uX2lkGAIgASgJUglzdGF0aW9uSWQ=');

@$core.Deprecated('Use childPhotoDescriptor instead')
const ChildPhoto$json = {
  '1': 'ChildPhoto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'child_id', '3': 2, '4': 1, '5': 9, '10': 'childId'},
    {'1': 's3_bucket', '3': 3, '4': 1, '5': 9, '10': 's3Bucket'},
    {'1': 's3_key', '3': 4, '4': 1, '5': 9, '10': 's3Key'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `ChildPhoto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List childPhotoDescriptor = $convert.base64Decode(
    'CgpDaGlsZFBob3RvEg4KAmlkGAEgASgJUgJpZBIZCghjaGlsZF9pZBgCIAEoCVIHY2hpbGRJZB'
    'IbCglzM19idWNrZXQYAyABKAlSCHMzQnVja2V0EhUKBnMzX2tleRgEIAEoCVIFczNLZXkSOQoK'
    'Y3JlYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdB'
    'I5Cgp1cGRhdGVkX2F0GAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRl'
    'ZEF0');

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
