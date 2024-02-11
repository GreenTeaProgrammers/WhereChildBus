//
//  Generated code. Do not modify.
//  source: where_child_bus/resources.proto
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

@$core.Deprecated('Use busDescriptor instead')
const bus$json = {
  '1': 'bus',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'plate_number', '3': 4, '4': 1, '5': 9, '10': 'plateNumber'},
    {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.where_child_bus.bus.Status', '10': 'status'},
    {'1': 'latitude', '3': 6, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 7, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
  '4': [bus_Status$json],
};

@$core.Deprecated('Use busDescriptor instead')
const bus_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'STOPPED', '2': 0},
    {'1': 'RUNNING', '2': 1},
    {'1': 'MAINTEINANCE', '2': 2},
  ],
};

/// Descriptor for `bus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List busDescriptor = $convert.base64Decode(
    'CgNidXMSDgoCaWQYASABKAlSAmlkEh0KCm51cnNlcnlfaWQYAiABKAlSCW51cnNlcnlJZBISCg'
    'RuYW1lGAMgASgJUgRuYW1lEiEKDHBsYXRlX251bWJlchgEIAEoCVILcGxhdGVOdW1iZXISMwoG'
    'c3RhdHVzGAUgASgOMhsud2hlcmVfY2hpbGRfYnVzLmJ1cy5TdGF0dXNSBnN0YXR1cxIaCghsYX'
    'RpdHVkZRgGIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAcgASgBUglsb25naXR1ZGUSOQoK'
    'Y3JlYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdB'
    'I5Cgp1cGRhdGVkX2F0GAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRl'
    'ZEF0IjQKBlN0YXR1cxILCgdTVE9QUEVEEAASCwoHUlVOTklORxABEhAKDE1BSU5URUlOQU5DRR'
    'AC');

@$core.Deprecated('Use childDescriptor instead')
const Child$json = {
  '1': 'Child',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'guardian_id', '3': 3, '4': 1, '5': 9, '10': 'guardianId'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'age', '3': 5, '4': 1, '5': 5, '10': 'age'},
    {'1': 'sex', '3': 6, '4': 1, '5': 14, '6': '.where_child_bus.Child.Sex', '10': 'sex'},
    {'1': 'is_ride_morning_bus', '3': 7, '4': 1, '5': 8, '10': 'isRideMorningBus'},
    {'1': 'is_ride_afternoon_bus', '3': 8, '4': 1, '5': 8, '10': 'isRideAfternoonBus'},
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
    {'1': 'MAN', '2': 0},
    {'1': 'WOMEN', '2': 1},
    {'1': 'OTHER', '2': 2},
  ],
};

/// Descriptor for `Child`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List childDescriptor = $convert.base64Decode(
    'CgVDaGlsZBIOCgJpZBgBIAEoCVICaWQSHQoKbnVyc2VyeV9pZBgCIAEoCVIJbnVyc2VyeUlkEh'
    '8KC2d1YXJkaWFuX2lkGAMgASgJUgpndWFyZGlhbklkEhIKBG5hbWUYBCABKAlSBG5hbWUSEAoD'
    'YWdlGAUgASgFUgNhZ2USLAoDc2V4GAYgASgOMhoud2hlcmVfY2hpbGRfYnVzLkNoaWxkLlNleF'
    'IDc2V4Ei0KE2lzX3JpZGVfbW9ybmluZ19idXMYByABKAhSEGlzUmlkZU1vcm5pbmdCdXMSMQoV'
    'aXNfcmlkZV9hZnRlcm5vb25fYnVzGAggASgIUhJpc1JpZGVBZnRlcm5vb25CdXMSNQoXY2hlY2'
    'tfZm9yX21pc3NpbmdfaXRlbXMYCSABKAhSFGNoZWNrRm9yTWlzc2luZ0l0ZW1zEhcKB2hhc19i'
    'YWcYCiABKAhSBmhhc0JhZxIiCg1oYXNfbHVuY2hfYm94GAsgASgIUgtoYXNMdW5jaEJveBIoCh'
    'BoYXNfd2F0ZXJfYm90dGxlGAwgASgIUg5oYXNXYXRlckJvdHRsZRIfCgtoYXNfdW1icmVyYRgN'
    'IAEoCFIKaGFzVW1icmVyYRIbCgloYXNfb3RoZXIYDiABKAhSCGhhc090aGVyEjkKCmNyZWF0ZW'
    'RfYXQYDyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBk'
    'YXRlZF9hdBgQIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdCIkCg'
    'NTZXgSBwoDTUFOEAASCQoFV09NRU4QARIJCgVPVEhFUhAC');

@$core.Deprecated('Use stationDescriptor instead')
const Station$json = {
  '1': 'Station',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'guardian_id', '3': 2, '4': 1, '5': 9, '10': 'guardianId'},
    {'1': 'latitude', '3': 3, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 4, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'morning_order', '3': 5, '4': 1, '5': 5, '10': 'morningOrder'},
    {'1': 'afternoon_order', '3': 6, '4': 1, '5': 5, '10': 'afternoonOrder'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Station`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stationDescriptor = $convert.base64Decode(
    'CgdTdGF0aW9uEg4KAmlkGAEgASgJUgJpZBIfCgtndWFyZGlhbl9pZBgCIAEoCVIKZ3VhcmRpYW'
    '5JZBIaCghsYXRpdHVkZRgDIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAQgASgBUglsb25n'
    'aXR1ZGUSIwoNbW9ybmluZ19vcmRlchgFIAEoBVIMbW9ybmluZ09yZGVyEicKD2FmdGVybm9vbl'
    '9vcmRlchgGIAEoBVIOYWZ0ZXJub29uT3JkZXISOQoKY3JlYXRlZF9hdBgHIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAggASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0');

@$core.Deprecated('Use childBusAssociationDescriptor instead')
const ChildBusAssociation$json = {
  '1': 'ChildBusAssociation',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'bus_id', '3': 2, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'child_id', '3': 3, '4': 1, '5': 9, '10': 'childId'},
    {'1': 'bus_type', '3': 4, '4': 1, '5': 14, '6': '.where_child_bus.ChildBusAssociation.BusType', '10': 'busType'},
  ],
  '4': [ChildBusAssociation_BusType$json],
};

@$core.Deprecated('Use childBusAssociationDescriptor instead')
const ChildBusAssociation_BusType$json = {
  '1': 'BusType',
  '2': [
    {'1': 'MORNING', '2': 0},
    {'1': 'AFTERNOON', '2': 1},
  ],
};

/// Descriptor for `ChildBusAssociation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List childBusAssociationDescriptor = $convert.base64Decode(
    'ChNDaGlsZEJ1c0Fzc29jaWF0aW9uEg4KAmlkGAEgASgJUgJpZBIVCgZidXNfaWQYAiABKAlSBW'
    'J1c0lkEhkKCGNoaWxkX2lkGAMgASgJUgdjaGlsZElkEkcKCGJ1c190eXBlGAQgASgOMiwud2hl'
    'cmVfY2hpbGRfYnVzLkNoaWxkQnVzQXNzb2NpYXRpb24uQnVzVHlwZVIHYnVzVHlwZSIlCgdCdX'
    'NUeXBlEgsKB01PUk5JTkcQABINCglBRlRFUk5PT04QAQ==');

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

