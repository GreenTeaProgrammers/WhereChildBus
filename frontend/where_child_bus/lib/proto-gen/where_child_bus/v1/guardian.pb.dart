//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/guardian.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'resources.pb.dart' as $8;

class CreateGuardianRequest extends $pb.GeneratedMessage {
  factory CreateGuardianRequest({
    $core.String? nurseryCode,
    $core.String? email,
    $core.String? password,
    $core.String? name,
    $core.String? phoneNumber,
  }) {
    final $result = create();
    if (nurseryCode != null) {
      $result.nurseryCode = nurseryCode;
    }
    if (email != null) {
      $result.email = email;
    }
    if (password != null) {
      $result.password = password;
    }
    if (name != null) {
      $result.name = name;
    }
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    return $result;
  }
  CreateGuardianRequest._() : super();
  factory CreateGuardianRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateGuardianRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateGuardianRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nurseryCode')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'phoneNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateGuardianRequest clone() => CreateGuardianRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateGuardianRequest copyWith(void Function(CreateGuardianRequest) updates) => super.copyWith((message) => updates(message as CreateGuardianRequest)) as CreateGuardianRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGuardianRequest create() => CreateGuardianRequest._();
  CreateGuardianRequest createEmptyInstance() => create();
  static $pb.PbList<CreateGuardianRequest> createRepeated() => $pb.PbList<CreateGuardianRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateGuardianRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGuardianRequest>(create);
  static CreateGuardianRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nurseryCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set nurseryCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNurseryCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearNurseryCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phoneNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set phoneNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhoneNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoneNumber() => clearField(5);
}

class CreateGuardianResponse extends $pb.GeneratedMessage {
  factory CreateGuardianResponse({
    $8.GuardianResponse? guardian,
  }) {
    final $result = create();
    if (guardian != null) {
      $result.guardian = guardian;
    }
    return $result;
  }
  CreateGuardianResponse._() : super();
  factory CreateGuardianResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateGuardianResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateGuardianResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$8.GuardianResponse>(1, _omitFieldNames ? '' : 'guardian', subBuilder: $8.GuardianResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateGuardianResponse clone() => CreateGuardianResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateGuardianResponse copyWith(void Function(CreateGuardianResponse) updates) => super.copyWith((message) => updates(message as CreateGuardianResponse)) as CreateGuardianResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGuardianResponse create() => CreateGuardianResponse._();
  CreateGuardianResponse createEmptyInstance() => create();
  static $pb.PbList<CreateGuardianResponse> createRepeated() => $pb.PbList<CreateGuardianResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateGuardianResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGuardianResponse>(create);
  static CreateGuardianResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $8.GuardianResponse get guardian => $_getN(0);
  @$pb.TagNumber(1)
  set guardian($8.GuardianResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuardian() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuardian() => clearField(1);
  @$pb.TagNumber(1)
  $8.GuardianResponse ensureGuardian() => $_ensure(0);
}

class GuardianLoginRequest extends $pb.GeneratedMessage {
  factory GuardianLoginRequest({
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
  GuardianLoginRequest._() : super();
  factory GuardianLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GuardianLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GuardianLoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GuardianLoginRequest clone() => GuardianLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GuardianLoginRequest copyWith(void Function(GuardianLoginRequest) updates) => super.copyWith((message) => updates(message as GuardianLoginRequest)) as GuardianLoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuardianLoginRequest create() => GuardianLoginRequest._();
  GuardianLoginRequest createEmptyInstance() => create();
  static $pb.PbList<GuardianLoginRequest> createRepeated() => $pb.PbList<GuardianLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static GuardianLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GuardianLoginRequest>(create);
  static GuardianLoginRequest? _defaultInstance;

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

class GuardianLoginResponse extends $pb.GeneratedMessage {
  factory GuardianLoginResponse({
    $core.bool? success,
    $8.GuardianResponse? guardian,
    $8.NurseryResponse? nursery,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (guardian != null) {
      $result.guardian = guardian;
    }
    if (nursery != null) {
      $result.nursery = nursery;
    }
    return $result;
  }
  GuardianLoginResponse._() : super();
  factory GuardianLoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GuardianLoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GuardianLoginResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<$8.GuardianResponse>(2, _omitFieldNames ? '' : 'guardian', subBuilder: $8.GuardianResponse.create)
    ..aOM<$8.NurseryResponse>(3, _omitFieldNames ? '' : 'nursery', subBuilder: $8.NurseryResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GuardianLoginResponse clone() => GuardianLoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GuardianLoginResponse copyWith(void Function(GuardianLoginResponse) updates) => super.copyWith((message) => updates(message as GuardianLoginResponse)) as GuardianLoginResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuardianLoginResponse create() => GuardianLoginResponse._();
  GuardianLoginResponse createEmptyInstance() => create();
  static $pb.PbList<GuardianLoginResponse> createRepeated() => $pb.PbList<GuardianLoginResponse>();
  @$core.pragma('dart2js:noInline')
  static GuardianLoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GuardianLoginResponse>(create);
  static GuardianLoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $8.GuardianResponse get guardian => $_getN(1);
  @$pb.TagNumber(2)
  set guardian($8.GuardianResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGuardian() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuardian() => clearField(2);
  @$pb.TagNumber(2)
  $8.GuardianResponse ensureGuardian() => $_ensure(1);

  @$pb.TagNumber(3)
  $8.NurseryResponse get nursery => $_getN(2);
  @$pb.TagNumber(3)
  set nursery($8.NurseryResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasNursery() => $_has(2);
  @$pb.TagNumber(3)
  void clearNursery() => clearField(3);
  @$pb.TagNumber(3)
  $8.NurseryResponse ensureNursery() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
