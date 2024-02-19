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

@$core.Deprecated('Use createNurseryRequestDescriptor instead')
const CreateNurseryRequest$json = {
  '1': 'CreateNurseryRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone_number', '3': 4, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'address', '3': 5, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `CreateNurseryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createNurseryRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVOdXJzZXJ5UmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSGgoIcGFzc3dvcm'
    'QYAiABKAlSCHBhc3N3b3JkEhIKBG5hbWUYAyABKAlSBG5hbWUSIQoMcGhvbmVfbnVtYmVyGAQg'
    'ASgJUgtwaG9uZU51bWJlchIYCgdhZGRyZXNzGAUgASgJUgdhZGRyZXNz');

@$core.Deprecated('Use createNurseryResponseDescriptor instead')
const CreateNurseryResponse$json = {
  '1': 'CreateNurseryResponse',
  '2': [
    {'1': 'nursery', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.NurseryResponse', '10': 'nursery'},
  ],
};

/// Descriptor for `CreateNurseryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createNurseryResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVOdXJzZXJ5UmVzcG9uc2USPQoHbnVyc2VyeRgBIAEoCzIjLndoZXJlX2NoaWxkX2'
    'J1cy52MS5OdXJzZXJ5UmVzcG9uc2VSB251cnNlcnk=');

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
    {'1': 'nursery', '3': 2, '4': 1, '5': 11, '6': '.where_child_bus.v1.NurseryResponse', '10': 'nursery'},
  ],
};

/// Descriptor for `NurseryLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nurseryLoginResponseDescriptor = $convert.base64Decode(
    'ChROdXJzZXJ5TG9naW5SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEj0KB251cn'
    'NlcnkYAiABKAsyIy53aGVyZV9jaGlsZF9idXMudjEuTnVyc2VyeVJlc3BvbnNlUgdudXJzZXJ5');

@$core.Deprecated('Use updateNurseryRequestDescriptor instead')
const UpdateNurseryRequest$json = {
  '1': 'UpdateNurseryRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'adress', '3': 3, '4': 1, '5': 9, '10': 'adress'},
    {'1': 'phone_number', '3': 4, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 6, '4': 1, '5': 9, '10': 'password'},
    {'1': 'update_mask', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'updateMask'},
  ],
};

/// Descriptor for `UpdateNurseryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNurseryRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVOdXJzZXJ5UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIWCgZhZHJlc3MYAyABKAlSBmFkcmVzcxIhCgxwaG9uZV9udW1iZXIYBCABKAlSC3Bob25l'
    'TnVtYmVyEhQKBWVtYWlsGAUgASgJUgVlbWFpbBIaCghwYXNzd29yZBgGIAEoCVIIcGFzc3dvcm'
    'QSOwoLdXBkYXRlX21hc2sYByABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrUgp1cGRh'
    'dGVNYXNr');

@$core.Deprecated('Use updateNurseryResponseDescriptor instead')
const UpdateNurseryResponse$json = {
  '1': 'UpdateNurseryResponse',
  '2': [
    {'1': 'nursery', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.NurseryResponse', '10': 'nursery'},
  ],
};

/// Descriptor for `UpdateNurseryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNurseryResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVOdXJzZXJ5UmVzcG9uc2USPQoHbnVyc2VyeRgBIAEoCzIjLndoZXJlX2NoaWxkX2'
    'J1cy52MS5OdXJzZXJ5UmVzcG9uc2VSB251cnNlcnk=');

