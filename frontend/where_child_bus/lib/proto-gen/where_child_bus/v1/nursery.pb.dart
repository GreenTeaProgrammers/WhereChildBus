//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/nursery.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'resources.pb.dart' as $6;

class NurseryLoginRequest extends $pb.GeneratedMessage {
  factory NurseryLoginRequest({
    $core.String? email,
    $core.String? password,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  NurseryLoginRequest._() : super();
  factory NurseryLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NurseryLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NurseryLoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NurseryLoginRequest clone() => NurseryLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NurseryLoginRequest copyWith(void Function(NurseryLoginRequest) updates) => super.copyWith((message) => updates(message as NurseryLoginRequest)) as NurseryLoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NurseryLoginRequest create() => NurseryLoginRequest._();
  NurseryLoginRequest createEmptyInstance() => create();
  static $pb.PbList<NurseryLoginRequest> createRepeated() => $pb.PbList<NurseryLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static NurseryLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NurseryLoginRequest>(create);
  static NurseryLoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class NurseryLoginResponse extends $pb.GeneratedMessage {
  factory NurseryLoginResponse({
    $core.bool? success,
    $6.NurseryResponse? nursery,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (nursery != null) {
      $result.nursery = nursery;
    }
    return $result;
  }
  NurseryLoginResponse._() : super();
  factory NurseryLoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NurseryLoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NurseryLoginResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<$6.NurseryResponse>(2, _omitFieldNames ? '' : 'nursery', subBuilder: $6.NurseryResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NurseryLoginResponse clone() => NurseryLoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NurseryLoginResponse copyWith(void Function(NurseryLoginResponse) updates) => super.copyWith((message) => updates(message as NurseryLoginResponse)) as NurseryLoginResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NurseryLoginResponse create() => NurseryLoginResponse._();
  NurseryLoginResponse createEmptyInstance() => create();
  static $pb.PbList<NurseryLoginResponse> createRepeated() => $pb.PbList<NurseryLoginResponse>();
  @$core.pragma('dart2js:noInline')
  static NurseryLoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NurseryLoginResponse>(create);
  static NurseryLoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $6.NurseryResponse get nursery => $_getN(1);
  @$pb.TagNumber(2)
  set nursery($6.NurseryResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNursery() => $_has(1);
  @$pb.TagNumber(2)
  void clearNursery() => clearField(2);
  @$pb.TagNumber(2)
  $6.NurseryResponse ensureNursery() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
