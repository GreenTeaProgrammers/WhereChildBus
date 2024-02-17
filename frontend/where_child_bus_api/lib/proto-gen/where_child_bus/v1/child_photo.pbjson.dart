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

@$core.Deprecated('Use duplicationCheckRequestDescriptor instead')
const DuplicationCheckRequest$json = {
  '1': 'DuplicationCheckRequest',
  '2': [
    {'1': 'child_ids', '3': 1, '4': 3, '5': 9, '10': 'childIds'},
  ],
};

/// Descriptor for `DuplicationCheckRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List duplicationCheckRequestDescriptor = $convert.base64Decode(
    'ChdEdXBsaWNhdGlvbkNoZWNrUmVxdWVzdBIbCgljaGlsZF9pZHMYASADKAlSCGNoaWxkSWRz');

@$core.Deprecated('Use duplicationCheckResponseDescriptor instead')
const DuplicationCheckResponse$json = {
  '1': 'DuplicationCheckResponse',
  '2': [
    {'1': 'is_duplicated', '3': 1, '4': 1, '5': 8, '10': 'isDuplicated'},
    {'1': 'photo_ids', '3': 2, '4': 3, '5': 9, '10': 'photoIds'},
    {'1': 'duplicated_photos', '3': 3, '4': 3, '5': 12, '10': 'duplicatedPhotos'},
  ],
};

/// Descriptor for `DuplicationCheckResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List duplicationCheckResponseDescriptor = $convert.base64Decode(
    'ChhEdXBsaWNhdGlvbkNoZWNrUmVzcG9uc2USIwoNaXNfZHVwbGljYXRlZBgBIAEoCFIMaXNEdX'
    'BsaWNhdGVkEhsKCXBob3RvX2lkcxgCIAMoCVIIcGhvdG9JZHMSKwoRZHVwbGljYXRlZF9waG90'
    'b3MYAyADKAxSEGR1cGxpY2F0ZWRQaG90b3M=');

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

@$core.Deprecated('Use getChildPhotoRequestDescriptor instead')
const GetChildPhotoRequest$json = {
  '1': 'GetChildPhotoRequest',
  '2': [
    {'1': 'child_id', '3': 1, '4': 1, '5': 9, '10': 'childId'},
  ],
};

/// Descriptor for `GetChildPhotoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildPhotoRequestDescriptor = $convert.base64Decode(
    'ChRHZXRDaGlsZFBob3RvUmVxdWVzdBIZCghjaGlsZF9pZBgBIAEoCVIHY2hpbGRJZA==');

@$core.Deprecated('Use childPhotoResponseDescriptor instead')
const ChildPhotoResponse$json = {
  '1': 'ChildPhotoResponse',
  '2': [
    {'1': 'child_photo_id', '3': 1, '4': 1, '5': 9, '10': 'childPhotoId'},
    {'1': 'photo', '3': 2, '4': 1, '5': 12, '10': 'photo'},
  ],
};

/// Descriptor for `ChildPhotoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List childPhotoResponseDescriptor = $convert.base64Decode(
    'ChJDaGlsZFBob3RvUmVzcG9uc2USJAoOY2hpbGRfcGhvdG9faWQYASABKAlSDGNoaWxkUGhvdG'
    '9JZBIUCgVwaG90bxgCIAEoDFIFcGhvdG8=');

@$core.Deprecated('Use getChildPhotoResponseDescriptor instead')
const GetChildPhotoResponse$json = {
  '1': 'GetChildPhotoResponse',
  '2': [
    {'1': 'child_photos', '3': 1, '4': 3, '5': 11, '6': '.where_child_bus.v1.ChildPhotoResponse', '10': 'childPhotos'},
  ],
};

/// Descriptor for `GetChildPhotoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChildPhotoResponseDescriptor = $convert.base64Decode(
    'ChVHZXRDaGlsZFBob3RvUmVzcG9uc2USSQoMY2hpbGRfcGhvdG9zGAEgAygLMiYud2hlcmVfY2'
    'hpbGRfYnVzLnYxLkNoaWxkUGhvdG9SZXNwb25zZVILY2hpbGRQaG90b3M=');

