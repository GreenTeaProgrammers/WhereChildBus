//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/guardian.proto
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

import 'guardian.pb.dart' as $4;
import 'guardian.pbjson.dart';

export 'guardian.pb.dart';

abstract class GuardianServiceBase extends $pb.GeneratedService {
  $async.Future<$4.GuardianLoginResponse> guardianLogin($pb.ServerContext ctx, $4.GuardianLoginRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'GuardianLogin': return $4.GuardianLoginRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'GuardianLogin': return this.guardianLogin(ctx, request as $4.GuardianLoginRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => GuardianServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => GuardianServiceBase$messageJson;
}

