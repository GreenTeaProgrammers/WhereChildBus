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

@$core.Deprecated('Use createBusRequestDescriptor instead')
const CreateBusRequest$json = {
  '1': 'CreateBusRequest',
  '2': [
    {'1': 'nursery_id', '3': 1, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'plate_number', '3': 3, '4': 1, '5': 9, '10': 'plateNumber'},
    {'1': 'morning_guardian_ids', '3': 4, '4': 3, '5': 9, '10': 'morningGuardianIds'},
    {'1': 'evening_guardian_ids', '3': 5, '4': 3, '5': 9, '10': 'eveningGuardianIds'},
  ],
};

/// Descriptor for `CreateBusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusRequestDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVCdXNSZXF1ZXN0Eh0KCm51cnNlcnlfaWQYASABKAlSCW51cnNlcnlJZBISCgRuYW'
    '1lGAIgASgJUgRuYW1lEiEKDHBsYXRlX251bWJlchgDIAEoCVILcGxhdGVOdW1iZXISMAoUbW9y'
    'bmluZ19ndWFyZGlhbl9pZHMYBCADKAlSEm1vcm5pbmdHdWFyZGlhbklkcxIwChRldmVuaW5nX2'
    'd1YXJkaWFuX2lkcxgFIAMoCVISZXZlbmluZ0d1YXJkaWFuSWRz');

@$core.Deprecated('Use createBusResponseDescriptor instead')
const CreateBusResponse$json = {
  '1': 'CreateBusResponse',
  '2': [
    {'1': 'bus', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Bus', '10': 'bus'},
  ],
};

/// Descriptor for `CreateBusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusResponseDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVCdXNSZXNwb25zZRIpCgNidXMYASABKAsyFy53aGVyZV9jaGlsZF9idXMudjEuQn'
    'VzUgNidXM=');

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

@$core.Deprecated('Use getRunningBusByGuardianIdRequestDescriptor instead')
const GetRunningBusByGuardianIdRequest$json = {
  '1': 'GetRunningBusByGuardianIdRequest',
  '2': [
    {'1': 'guardian_id', '3': 1, '4': 1, '5': 9, '10': 'guardianId'},
  ],
};

/// Descriptor for `GetRunningBusByGuardianIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRunningBusByGuardianIdRequestDescriptor = $convert.base64Decode(
    'CiBHZXRSdW5uaW5nQnVzQnlHdWFyZGlhbklkUmVxdWVzdBIfCgtndWFyZGlhbl9pZBgBIAEoCV'
    'IKZ3VhcmRpYW5JZA==');

@$core.Deprecated('Use getRunningBusByGuardianIdResponseDescriptor instead')
const GetRunningBusByGuardianIdResponse$json = {
  '1': 'GetRunningBusByGuardianIdResponse',
  '2': [
    {'1': 'bus', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Bus', '10': 'bus'},
  ],
};

/// Descriptor for `GetRunningBusByGuardianIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRunningBusByGuardianIdResponseDescriptor = $convert.base64Decode(
    'CiFHZXRSdW5uaW5nQnVzQnlHdWFyZGlhbklkUmVzcG9uc2USKQoDYnVzGAEgASgLMhcud2hlcm'
    'VfY2hpbGRfYnVzLnYxLkJ1c1IDYnVz');

@$core.Deprecated('Use changeBusStatusRequestDescriptor instead')
const ChangeBusStatusRequest$json = {
  '1': 'ChangeBusStatusRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'bus_status', '3': 2, '4': 1, '5': 14, '6': '.where_child_bus.v1.BusStatus', '10': 'busStatus'},
  ],
};

/// Descriptor for `ChangeBusStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeBusStatusRequestDescriptor = $convert.base64Decode(
    'ChZDaGFuZ2VCdXNTdGF0dXNSZXF1ZXN0EhUKBmJ1c19pZBgBIAEoCVIFYnVzSWQSPAoKYnVzX3'
    'N0YXR1cxgCIAEoDjIdLndoZXJlX2NoaWxkX2J1cy52MS5CdXNTdGF0dXNSCWJ1c1N0YXR1cw==');

@$core.Deprecated('Use changeBusStatusResponseDescriptor instead')
const ChangeBusStatusResponse$json = {
  '1': 'ChangeBusStatusResponse',
  '2': [
    {'1': 'bus', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Bus', '10': 'bus'},
  ],
};

/// Descriptor for `ChangeBusStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeBusStatusResponseDescriptor = $convert.base64Decode(
    'ChdDaGFuZ2VCdXNTdGF0dXNSZXNwb25zZRIpCgNidXMYASABKAsyFy53aGVyZV9jaGlsZF9idX'
    'MudjEuQnVzUgNidXM=');

@$core.Deprecated('Use sendLocationContinuousRequestDescriptor instead')
const SendLocationContinuousRequest$json = {
  '1': 'SendLocationContinuousRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'latitude', '3': 2, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 3, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `SendLocationContinuousRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendLocationContinuousRequestDescriptor = $convert.base64Decode(
    'Ch1TZW5kTG9jYXRpb25Db250aW51b3VzUmVxdWVzdBIVCgZidXNfaWQYASABKAlSBWJ1c0lkEh'
    'oKCGxhdGl0dWRlGAIgASgBUghsYXRpdHVkZRIcCglsb25naXR1ZGUYAyABKAFSCWxvbmdpdHVk'
    'ZQ==');

@$core.Deprecated('Use sendLocationContinuousResponseDescriptor instead')
const SendLocationContinuousResponse$json = {
  '1': 'SendLocationContinuousResponse',
};

/// Descriptor for `SendLocationContinuousResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendLocationContinuousResponseDescriptor = $convert.base64Decode(
    'Ch5TZW5kTG9jYXRpb25Db250aW51b3VzUmVzcG9uc2U=');

@$core.Deprecated('Use trackBusContinuousRequestDescriptor instead')
const TrackBusContinuousRequest$json = {
  '1': 'TrackBusContinuousRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
  ],
};

/// Descriptor for `TrackBusContinuousRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackBusContinuousRequestDescriptor = $convert.base64Decode(
    'ChlUcmFja0J1c0NvbnRpbnVvdXNSZXF1ZXN0EhUKBmJ1c19pZBgBIAEoCVIFYnVzSWQ=');

@$core.Deprecated('Use trackBusContinuousResponseDescriptor instead')
const TrackBusContinuousResponse$json = {
  '1': 'TrackBusContinuousResponse',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'latitude', '3': 2, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 3, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `TrackBusContinuousResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackBusContinuousResponseDescriptor = $convert.base64Decode(
    'ChpUcmFja0J1c0NvbnRpbnVvdXNSZXNwb25zZRIVCgZidXNfaWQYASABKAlSBWJ1c0lkEhoKCG'
    'xhdGl0dWRlGAIgASgBUghsYXRpdHVkZRIcCglsb25naXR1ZGUYAyABKAFSCWxvbmdpdHVkZQ==');

@$core.Deprecated('Use streamBusVideoRequestDescriptor instead')
const StreamBusVideoRequest$json = {
  '1': 'StreamBusVideoRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'nursery_id', '3': 2, '4': 1, '5': 9, '10': 'nurseryId'},
    {'1': 'bus_type', '3': 3, '4': 1, '5': 14, '6': '.where_child_bus.v1.BusType', '10': 'busType'},
    {'1': 'vehicle_event', '3': 4, '4': 1, '5': 14, '6': '.where_child_bus.v1.VehicleEvent', '10': 'vehicleEvent'},
    {'1': 'video_chunk', '3': 5, '4': 3, '5': 12, '10': 'videoChunk'},
  ],
};

/// Descriptor for `StreamBusVideoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamBusVideoRequestDescriptor = $convert.base64Decode(
    'ChVTdHJlYW1CdXNWaWRlb1JlcXVlc3QSFQoGYnVzX2lkGAEgASgJUgVidXNJZBIdCgpudXJzZX'
    'J5X2lkGAIgASgJUgludXJzZXJ5SWQSNgoIYnVzX3R5cGUYAyABKA4yGy53aGVyZV9jaGlsZF9i'
    'dXMudjEuQnVzVHlwZVIHYnVzVHlwZRJFCg12ZWhpY2xlX2V2ZW50GAQgASgOMiAud2hlcmVfY2'
    'hpbGRfYnVzLnYxLlZlaGljbGVFdmVudFIMdmVoaWNsZUV2ZW50Eh8KC3ZpZGVvX2NodW5rGAUg'
    'AygMUgp2aWRlb0NodW5r');

@$core.Deprecated('Use streamBusVideoResponseDescriptor instead')
const StreamBusVideoResponse$json = {
  '1': 'StreamBusVideoResponse',
  '2': [
    {'1': 'is_detected', '3': 1, '4': 1, '5': 8, '10': 'isDetected'},
    {'1': 'children', '3': 2, '4': 3, '5': 11, '6': '.where_child_bus.v1.Child', '10': 'children'},
  ],
};

/// Descriptor for `StreamBusVideoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamBusVideoResponseDescriptor = $convert.base64Decode(
    'ChZTdHJlYW1CdXNWaWRlb1Jlc3BvbnNlEh8KC2lzX2RldGVjdGVkGAEgASgIUgppc0RldGVjdG'
    'VkEjUKCGNoaWxkcmVuGAIgAygLMhkud2hlcmVfY2hpbGRfYnVzLnYxLkNoaWxkUghjaGlsZHJl'
    'bg==');

@$core.Deprecated('Use updateBusRequestDescriptor instead')
const UpdateBusRequest$json = {
  '1': 'UpdateBusRequest',
  '2': [
    {'1': 'bus_id', '3': 1, '4': 1, '5': 9, '10': 'busId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'plate_number', '3': 3, '4': 1, '5': 9, '10': 'plateNumber'},
    {'1': 'bus_status', '3': 4, '4': 1, '5': 14, '6': '.where_child_bus.v1.BusStatus', '10': 'busStatus'},
    {'1': 'latitude', '3': 5, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 6, '4': 1, '5': 1, '10': 'longitude'},
    {'1': 'enable_face_recognition', '3': 7, '4': 1, '5': 8, '10': 'enableFaceRecognition'},
    {'1': 'update_mask', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'updateMask'},
  ],
};

/// Descriptor for `UpdateBusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusRequestDescriptor = $convert.base64Decode(
    'ChBVcGRhdGVCdXNSZXF1ZXN0EhUKBmJ1c19pZBgBIAEoCVIFYnVzSWQSEgoEbmFtZRgCIAEoCV'
    'IEbmFtZRIhCgxwbGF0ZV9udW1iZXIYAyABKAlSC3BsYXRlTnVtYmVyEjwKCmJ1c19zdGF0dXMY'
    'BCABKA4yHS53aGVyZV9jaGlsZF9idXMudjEuQnVzU3RhdHVzUglidXNTdGF0dXMSGgoIbGF0aX'
    'R1ZGUYBSABKAFSCGxhdGl0dWRlEhwKCWxvbmdpdHVkZRgGIAEoAVIJbG9uZ2l0dWRlEjYKF2Vu'
    'YWJsZV9mYWNlX3JlY29nbml0aW9uGAcgASgIUhVlbmFibGVGYWNlUmVjb2duaXRpb24SOwoLdX'
    'BkYXRlX21hc2sYCCABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrUgp1cGRhdGVNYXNr');

@$core.Deprecated('Use updateBusResponseDescriptor instead')
const UpdateBusResponse$json = {
  '1': 'UpdateBusResponse',
  '2': [
    {'1': 'bus', '3': 1, '4': 1, '5': 11, '6': '.where_child_bus.v1.Bus', '10': 'bus'},
  ],
};

/// Descriptor for `UpdateBusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusResponseDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVCdXNSZXNwb25zZRIpCgNidXMYASABKAsyFy53aGVyZV9jaGlsZF9idXMudjEuQn'
    'VzUgNidXM=');

