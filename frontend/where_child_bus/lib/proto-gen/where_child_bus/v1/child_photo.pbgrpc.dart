//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/child_photo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'child_photo.pb.dart' as $2;

export 'child_photo.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.ChildPhotoService')
class ChildPhotoServiceClient extends $grpc.Client {
  static final _$duplicationCheck = $grpc.ClientMethod<$2.DuplicationCheckRequest, $2.DuplicationCheckResponse>(
      '/where_child_bus.v1.ChildPhotoService/DuplicationCheck',
      ($2.DuplicationCheckRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.DuplicationCheckResponse.fromBuffer(value));
  static final _$deleteChildPhoto = $grpc.ClientMethod<$2.DeleteChildPhotoRequest, $2.DeleteChildPhotoResponse>(
      '/where_child_bus.v1.ChildPhotoService/DeleteChildPhoto',
      ($2.DeleteChildPhotoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.DeleteChildPhotoResponse.fromBuffer(value));

  ChildPhotoServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.DuplicationCheckResponse> duplicationCheck($2.DuplicationCheckRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$duplicationCheck, request, options: options);
  }

  $grpc.ResponseFuture<$2.DeleteChildPhotoResponse> deleteChildPhoto($2.DeleteChildPhotoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteChildPhoto, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.ChildPhotoService')
abstract class ChildPhotoServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.ChildPhotoService';

  ChildPhotoServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.DuplicationCheckRequest, $2.DuplicationCheckResponse>(
        'DuplicationCheck',
        duplicationCheck_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DuplicationCheckRequest.fromBuffer(value),
        ($2.DuplicationCheckResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeleteChildPhotoRequest, $2.DeleteChildPhotoResponse>(
        'DeleteChildPhoto',
        deleteChildPhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DeleteChildPhotoRequest.fromBuffer(value),
        ($2.DeleteChildPhotoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.DuplicationCheckResponse> duplicationCheck_Pre($grpc.ServiceCall call, $async.Future<$2.DuplicationCheckRequest> request) async {
    return duplicationCheck(call, await request);
  }

  $async.Future<$2.DeleteChildPhotoResponse> deleteChildPhoto_Pre($grpc.ServiceCall call, $async.Future<$2.DeleteChildPhotoRequest> request) async {
    return deleteChildPhoto(call, await request);
  }

  $async.Future<$2.DuplicationCheckResponse> duplicationCheck($grpc.ServiceCall call, $2.DuplicationCheckRequest request);
  $async.Future<$2.DeleteChildPhotoResponse> deleteChildPhoto($grpc.ServiceCall call, $2.DeleteChildPhotoRequest request);
}
