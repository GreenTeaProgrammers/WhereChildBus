//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/child_photo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'child_photo.pb.dart' as $4;
import 'child_photo.pbjson.dart';

export 'child_photo.pb.dart';

abstract class ChildPhotoServiceBase extends $pb.GeneratedService {
  $async.Future<$4.DeleteChildPhotoResponse> deleteChildPhoto($pb.ServerContext ctx, $4.DeleteChildPhotoRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'DeleteChildPhoto': return $4.DeleteChildPhotoRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'DeleteChildPhoto': return this.deleteChildPhoto(ctx, request as $4.DeleteChildPhotoRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ChildPhotoServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => ChildPhotoServiceBase$messageJson;
}

