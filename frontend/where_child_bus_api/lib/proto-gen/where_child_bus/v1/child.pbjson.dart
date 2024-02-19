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

@$core.Deprecated('Use createChildRequestDescriptor instead')
const CreateChildRequest$json = {
  '1': 'CreateChildRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'guardian_id', '3': 2, '4': 1, '5': 9, '10': 'guardianId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'age', '3': 4, '4': 1, '5': 5, '10': 'age'},
    {'1': 'sex', '3': 5, '4': 1, '5': 14, '6': '.where_child_bus.v1.Sex', '10': 'sex'},
    {'1': 'photos', '3': 6, '4': 3, '5': 12, '10': 'photos'},
  ],
};

/// Descriptor for `CreateChildRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChildRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVDaGlsZFJlcXVlc3QSHQoKbnVyc2VyeV9pZBgBIAEoCVIJbnVyc2VyeUlkEh8KC2'
    'd1YXJkaWFuX2lkGAIgASgJUgpndWFyZGlhbklkEhIKBG5hbWUYAyABKAlSBG5hbWUSEAoDYWdl'
    'GAQgASgFUgNhZ2USKQoDc2V4GAUgASgOMhcud2hlcmVfY2hpbGRfYnVzLnYxLlNleFIDc2V4Eh'
    'YKBnBob3RvcxgGIAMoDFIGcGhvdG9z');

@$core.Deprecated('Use createChildResponseDescriptor instead')
const CreateChildResponse$json = {
  '1': 'CreateChildResponse',
  '2': [
    {'1': 'child', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Child', '10': 'child'},
  ],
};

/// Descriptor for `CreateChildResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChildResponseDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVDaGlsZFJlc3BvbnNlEi8KBWNoaWxkGAEgASgLMhkud2hlcmVfY2hpbGRfYnVzLn'
    'YxLkNoaWxkUgVjaGlsZA==');

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
    {'1': 'photos', '3': 2, '4': 3, '5': 11, '6': '.where_child_bus.v1.ChildPhoto', '10': 'photos'},
  ],
};

/// Descriptor for `GetChildListByNurseryIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByNurseryIDResponseDescriptor = $convert.base64Decode(
    'Ch9HZXRDaGlsZExpc3RCeU51cnNlcnlJRFJlc3BvbnNlEjUKCGNoaWxkcmVuGAEgAygLMhkud2'
    'hlcmVfY2hpbGRfYnVzLnYxLkNoaWxkUghjaGlsZHJlbhI2CgZwaG90b3MYAiADKAsyHi53aGVy'
    'ZV9jaGlsZF9idXMudjEuQ2hpbGRQaG90b1IGcGhvdG9z');

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
    {'1': 'photos', '3': 2, '4': 3, '5': 11, '6': '.where_child_bus.v1.ChildPhoto', '10': 'photos'},
  ],
};

/// Descriptor for `GetChildListByGuardianIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByGuardianIDResponseDescriptor = $convert.base64Decode(
    'CiBHZXRDaGlsZExpc3RCeUd1YXJkaWFuSURSZXNwb25zZRI1CghjaGlsZHJlbhgBIAMoCzIZLn'
    'doZXJlX2NoaWxkX2J1cy52MS5DaGlsZFIIY2hpbGRyZW4SNgoGcGhvdG9zGAIgAygLMh4ud2hl'
    'cmVfY2hpbGRfYnVzLnYxLkNoaWxkUGhvdG9SBnBob3Rvcw==');

@$core.Deprecated('Use getChildListByBusIDRequestDescriptor instead')
const GetChildListByBusIDRequest$json = {
  '1': 'GetChildListByBusIDRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
  ],
};

/// Descriptor for `GetChildListByBusIDRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByBusIDRequestDescriptor = $convert.base64Decode(
    'ChpHZXRDaGlsZExpc3RCeUJ1c0lEUmVxdWVzdBIVCgZidXNfaWQYASABKAlSBWJ1c0lk');

@$core.Deprecated('Use getChildListByBusIDResponseDescriptor instead')
const GetChildListByBusIDResponse$json = {
  '1': 'GetChildListByBusIDResponse',
  '2': [
    {'1': 'children', '3': 1, '4': 3, '5': 11, '6': '.where_child_bus.v1.Child', '10': 'children'},
    {'1': 'photos', '3': 2, '4': 3, '5': 11, '6': '.where_child_bus.v1.ChildPhoto', '10': 'photos'},
  ],
};

/// Descriptor for `GetChildListByBusIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildListByBusIDResponseDescriptor = $convert.base64Decode(
    'ChtHZXRDaGlsZExpc3RCeUJ1c0lEUmVzcG9uc2USNQoIY2hpbGRyZW4YASADKAsyGS53aGVyZV'
    '9jaGlsZF9idXMudjEuQ2hpbGRSCGNoaWxkcmVuEjYKBnBob3RvcxgCIAMoCzIeLndoZXJlX2No'
    'aWxkX2J1cy52MS5DaGlsZFBob3RvUgZwaG90b3M=');

@$core.Deprecated('Use checkIsChildInBusRequestDescriptor instead')
const CheckIsChildInBusRequest$json = {
  '1': 'CheckIsChildInBusRequest',
  '2': [
    {'1': 'child_id', '3': 1, '4': 1, '5': 9, '10': 'childId'},
  ],
};

/// Descriptor for `CheckIsChildInBusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkIsChildInBusRequestDescriptor = $convert.base64Decode(
    'ChhDaGVja0lzQ2hpbGRJbkJ1c1JlcXVlc3QSGQoIY2hpbGRfaWQYASABKAlSB2NoaWxkSWQ=');

@$core.Deprecated('Use checkIsChildInBusResponseDescriptor instead')
const CheckIsChildInBusResponse$json = {
  '1': 'CheckIsChildInBusResponse',
  '2': [
    {'1': 'is_in_bus', '3': 1, '4': 1, '5': 8, '10': 'isInBus'},
  ],
};

/// Descriptor for `CheckIsChildInBusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkIsChildInBusResponseDescriptor = $convert.base64Decode(
    'ChlDaGVja0lzQ2hpbGRJbkJ1c1Jlc3BvbnNlEhoKCWlzX2luX2J1cxgBIAEoCFIHaXNJbkJ1cw'
    '==');

@$core.Deprecated('Use updateChildRequestDescriptor instead')
const UpdateChildRequest$json = {
  '1': 'UpdateChildRequest',
  '2': [
    {'1': 'child_id', '3': 1, '4': 1, '5': 9, '10': 'childId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'age', '3': 3, '4': 1, '5': 5, '10': 'age'},
    {'1': 'sex', '3': 4, '4': 1, '5': 14, '6': '.where_child_bus.v1.Sex', '10': 'sex'},
    {'1': 'check_for_missing_items', '3': 5, '4': 1, '5': 8, '10': 'checkForMissingItems'},
    {'1': 'has_bag', '3': 6, '4': 1, '5': 8, '10': 'hasBag'},
    {'1': 'has_lunch_box', '3': 7, '4': 1, '5': 8, '10': 'hasLunchBox'},
    {'1': 'has_water_bottle', '3': 8, '4': 1, '5': 8, '10': 'hasWaterBottle'},
    {'1': 'has_umbrella', '3': 9, '4': 1, '5': 8, '10': 'hasUmbrella'},
    {'1': 'has_other', '3': 10, '4': 1, '5': 8, '10': 'hasOther'},
    {'1': 'update_mask', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'updateMask'},
  ],
};

/// Descriptor for `UpdateChildRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChildRequestDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVDaGlsZFJlcXVlc3QSGQoIY2hpbGRfaWQYASABKAlSB2NoaWxkSWQSEgoEbmFtZR'
    'gCIAEoCVIEbmFtZRIQCgNhZ2UYAyABKAVSA2FnZRIpCgNzZXgYBCABKA4yFy53aGVyZV9jaGls'
    'ZF9idXMudjEuU2V4UgNzZXgSNQoXY2hlY2tfZm9yX21pc3NpbmdfaXRlbXMYBSABKAhSFGNoZW'
    'NrRm9yTWlzc2luZ0l0ZW1zEhcKB2hhc19iYWcYBiABKAhSBmhhc0JhZxIiCg1oYXNfbHVuY2hf'
    'Ym94GAcgASgIUgtoYXNMdW5jaEJveBIoChBoYXNfd2F0ZXJfYm90dGxlGAggASgIUg5oYXNXYX'
    'RlckJvdHRsZRIhCgxoYXNfdW1icmVsbGEYCSABKAhSC2hhc1VtYnJlbGxhEhsKCWhhc19vdGhl'
    'chgKIAEoCFIIaGFzT3RoZXISOwoLdXBkYXRlX21hc2sYCyABKAsyGi5nb29nbGUucHJvdG9idW'
    'YuRmllbGRNYXNrUgp1cGRhdGVNYXNr');

@$core.Deprecated('Use updateChildResponseDescriptor instead')
const UpdateChildResponse$json = {
  '1': 'UpdateChildResponse',
  '2': [
    {'1': 'child', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Child', '10': 'child'},
  ],
};

/// Descriptor for `UpdateChildResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChildResponseDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVDaGlsZFJlc3BvbnNlEi8KBWNoaWxkGAEgASgLMhkud2hlcmVfY2hpbGRfYnVzLn'
    'YxLkNoaWxkUgVjaGlsZA==');

