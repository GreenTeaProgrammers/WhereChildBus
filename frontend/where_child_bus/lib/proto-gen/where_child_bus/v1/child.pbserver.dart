//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/child.proto
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

import 'child.pb.dart' as $3;
import 'child.pbjson.dart';

export 'child.pb.dart';

abstract class ChildServiceBase extends $pb.GeneratedService {
  $async.Future<$3.GetChildListByNurseryIDResponse> getChildListByNurseryID($pb.ServerContext ctx, $3.GetChildListByNurseryIDRequest request);
  $async.Future<$3.GetChildListByGuardianIDResponse> getChildListByGuardianID($pb.ServerContext ctx, $3.GetChildListByGuardianIDRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'GetChildListByNurseryID': return $3.GetChildListByNurseryIDRequest();
      case 'GetChildListByGuardianID': return $3.GetChildListByGuardianIDRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'GetChildListByNurseryID': return this.getChildListByNurseryID(ctx, request as $3.GetChildListByNurseryIDRequest);
      case 'GetChildListByGuardianID': return this.getChildListByGuardianID(ctx, request as $3.GetChildListByGuardianIDRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ChildServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => ChildServiceBase$messageJson;
}

