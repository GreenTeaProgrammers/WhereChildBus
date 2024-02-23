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

import 'child_photo.pb.dart' as $3;

export 'child_photo.pb.dart';

@$pb.GrpcServiceName('where_child_bus.v1.ChildPhotoService')
class ChildPhotoServiceClient extends $grpc.Client {
  static final _$duplicationCheck = $grpc.ClientMethod<$3.DuplicationCheckRequest, $3.DuplicationCheckResponse>(
      '/where_child_bus.v1.ChildPhotoService/DuplicationCheck',
      ($3.DuplicationCheckRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.DuplicationCheckResponse.fromBuffer(value));
  static final _$deleteChildPhoto = $grpc.ClientMethod<$3.DeleteChildPhotoRequest, $3.DeleteChildPhotoResponse>(
      '/where_child_bus.v1.ChildPhotoService/DeleteChildPhoto',
      ($3.DeleteChildPhotoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.DeleteChildPhotoResponse.fromBuffer(value));
  static final _$getChildPhoto = $grpc.ClientMethod<$3.GetChildPhotoRequest, $3.GetChildPhotoResponse>(
      '/where_child_bus.v1.ChildPhotoService/GetChildPhoto',
      ($3.GetChildPhotoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.GetChildPhotoResponse.fromBuffer(value));

  ChildPhotoServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$3.DuplicationCheckResponse> duplicationCheck($3.DuplicationCheckRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$duplicationCheck, request, options: options);
  }

  $grpc.ResponseFuture<$3.DeleteChildPhotoResponse> deleteChildPhoto($3.DeleteChildPhotoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteChildPhoto, request, options: options);
  }

  $grpc.ResponseFuture<$3.GetChildPhotoResponse> getChildPhoto($3.GetChildPhotoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChildPhoto, request, options: options);
  }
}

@$pb.GrpcServiceName('where_child_bus.v1.ChildPhotoService')
abstract class ChildPhotoServiceBase extends $grpc.Service {
  $core.String get $name => 'where_child_bus.v1.ChildPhotoService';

  ChildPhotoServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.DuplicationCheckRequest, $3.DuplicationCheckResponse>(
        'DuplicationCheck',
        duplicationCheck_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.DuplicationCheckRequest.fromBuffer(value),
        ($3.DuplicationCheckResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.DeleteChildPhotoRequest, $3.DeleteChildPhotoResponse>(
        'DeleteChildPhoto',
        deleteChildPhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.DeleteChildPhotoRequest.fromBuffer(value),
        ($3.DeleteChildPhotoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetChildPhotoRequest, $3.GetChildPhotoResponse>(
        'GetChildPhoto',
        getChildPhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetChildPhotoRequest.fromBuffer(value),
        ($3.GetChildPhotoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.DuplicationCheckResponse> duplicationCheck_Pre($grpc.ServiceCall call, $async.Future<$3.DuplicationCheckRequest> request) async {
    return duplicationCheck(call, await request);
  }

  $async.Future<$3.DeleteChildPhotoResponse> deleteChildPhoto_Pre($grpc.ServiceCall call, $async.Future<$3.DeleteChildPhotoRequest> request) async {
    return deleteChildPhoto(call, await request);
  }

  $async.Future<$3.GetChildPhotoResponse> getChildPhoto_Pre($grpc.ServiceCall call, $async.Future<$3.GetChildPhotoRequest> request) async {
    return getChildPhoto(call, await request);
  }

  $async.Future<$3.DuplicationCheckResponse> duplicationCheck($grpc.ServiceCall call, $3.DuplicationCheckRequest request);
  $async.Future<$3.DeleteChildPhotoResponse> deleteChildPhoto($grpc.ServiceCall call, $3.DeleteChildPhotoRequest request);
  $async.Future<$3.GetChildPhotoResponse> getChildPhoto($grpc.ServiceCall call, $3.GetChildPhotoRequest request);
}
