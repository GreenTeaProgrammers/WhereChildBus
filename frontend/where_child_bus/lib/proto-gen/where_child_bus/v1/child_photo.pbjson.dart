//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/child_photo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deleteChildPhotoRequestDescriptor instead')
const DeleteChildPhotoRequest$json = {
  '1': 'DeleteChildPhotoRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `DeleteChildPhotoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteChildPhotoRequestDescriptor = $convert.base64Decode(
    'ChdEZWxldGVDaGlsZFBob3RvUmVxdWVzdBIQCgNpZHMYASADKAlSA2lkcw==');

@$core.Deprecated('Use deleteChildPhotoResponseDescriptor instead')
const DeleteChildPhotoResponse$json = {
  '1': 'DeleteChildPhotoResponse',
  '2': [
    {'1': 'is_success_list', '3': 1, '4': 3, '5': 8, '10': 'isSuccessList'},
    {'1': 'ids', '3': 2, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `DeleteChildPhotoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteChildPhotoResponseDescriptor = $convert.base64Decode(
    'ChhEZWxldGVDaGlsZFBob3RvUmVzcG9uc2USJgoPaXNfc3VjY2Vzc19saXN0GAEgAygIUg1pc1'
    'N1Y2Nlc3NMaXN0EhAKA2lkcxgCIAMoCVIDaWRz');

const $core.Map<$core.String, $core.dynamic> ChildPhotoServiceBase$json = {
  '1': 'ChildPhotoService',
  '2': [
    {'1': 'DeleteChildPhoto', '2': '.where_child_bus.v1.DeleteChildPhotoRequest', '3': '.where_child_bus.v1.DeleteChildPhotoResponse'},
  ],
};

@$core.Deprecated('Use childPhotoServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> ChildPhotoServiceBase$messageJson = {
  '.where_child_bus.v1.DeleteChildPhotoRequest': DeleteChildPhotoRequest$json,
  '.where_child_bus.v1.DeleteChildPhotoResponse': DeleteChildPhotoResponse$json,
};

/// Descriptor for `ChildPhotoService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List childPhotoServiceDescriptor = $convert.base64Decode(
    'ChFDaGlsZFBob3RvU2VydmljZRJtChBEZWxldGVDaGlsZFBob3RvEisud2hlcmVfY2hpbGRfYn'
    'VzLnYxLkRlbGV0ZUNoaWxkUGhvdG9SZXF1ZXN0Giwud2hlcmVfY2hpbGRfYnVzLnYxLkRlbGV0'
    'ZUNoaWxkUGhvdG9SZXNwb25zZQ==');

