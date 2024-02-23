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

import '../../google/protobuf/field_mask.pb.dart' as $10;
import 'resources.pb.dart' as $9;

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
    $9.GuardianResponse? guardian,
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
    ..aOM<$9.GuardianResponse>(1, _omitFieldNames ? '' : 'guardian', subBuilder: $9.GuardianResponse.create)
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
  $9.GuardianResponse get guardian => $_getN(0);
  @$pb.TagNumber(1)
  set guardian($9.GuardianResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuardian() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuardian() => clearField(1);
  @$pb.TagNumber(1)
  $9.GuardianResponse ensureGuardian() => $_ensure(0);
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
    $9.GuardianResponse? guardian,
    $9.NurseryResponse? nursery,
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
    ..aOM<$9.GuardianResponse>(2, _omitFieldNames ? '' : 'guardian', subBuilder: $9.GuardianResponse.create)
    ..aOM<$9.NurseryResponse>(3, _omitFieldNames ? '' : 'nursery', subBuilder: $9.NurseryResponse.create)
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
  $9.GuardianResponse get guardian => $_getN(1);
  @$pb.TagNumber(2)
  set guardian($9.GuardianResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGuardian() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuardian() => clearField(2);
  @$pb.TagNumber(2)
  $9.GuardianResponse ensureGuardian() => $_ensure(1);

  @$pb.TagNumber(3)
  $9.NurseryResponse get nursery => $_getN(2);
  @$pb.TagNumber(3)
  set nursery($9.NurseryResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasNursery() => $_has(2);
  @$pb.TagNumber(3)
  void clearNursery() => clearField(3);
  @$pb.TagNumber(3)
  $9.NurseryResponse ensureNursery() => $_ensure(2);
}

class GetGuardianListByBusIdRequest extends $pb.GeneratedMessage {
  factory GetGuardianListByBusIdRequest({
    $core.String? busId,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    return $result;
  }
  GetGuardianListByBusIdRequest._() : super();
  factory GetGuardianListByBusIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGuardianListByBusIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGuardianListByBusIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGuardianListByBusIdRequest clone() => GetGuardianListByBusIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGuardianListByBusIdRequest copyWith(void Function(GetGuardianListByBusIdRequest) updates) => super.copyWith((message) => updates(message as GetGuardianListByBusIdRequest)) as GetGuardianListByBusIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGuardianListByBusIdRequest create() => GetGuardianListByBusIdRequest._();
  GetGuardianListByBusIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetGuardianListByBusIdRequest> createRepeated() => $pb.PbList<GetGuardianListByBusIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGuardianListByBusIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGuardianListByBusIdRequest>(create);
  static GetGuardianListByBusIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);
}

class GetGuardianListByBusIdResponse extends $pb.GeneratedMessage {
  factory GetGuardianListByBusIdResponse({
    $core.Iterable<$9.GuardianResponse>? guardians,
  }) {
    final $result = create();
    if (guardians != null) {
      $result.guardians.addAll(guardians);
    }
    return $result;
  }
  GetGuardianListByBusIdResponse._() : super();
  factory GetGuardianListByBusIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGuardianListByBusIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGuardianListByBusIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<$9.GuardianResponse>(1, _omitFieldNames ? '' : 'guardians', $pb.PbFieldType.PM, subBuilder: $9.GuardianResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGuardianListByBusIdResponse clone() => GetGuardianListByBusIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGuardianListByBusIdResponse copyWith(void Function(GetGuardianListByBusIdResponse) updates) => super.copyWith((message) => updates(message as GetGuardianListByBusIdResponse)) as GetGuardianListByBusIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGuardianListByBusIdResponse create() => GetGuardianListByBusIdResponse._();
  GetGuardianListByBusIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetGuardianListByBusIdResponse> createRepeated() => $pb.PbList<GetGuardianListByBusIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetGuardianListByBusIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGuardianListByBusIdResponse>(create);
  static GetGuardianListByBusIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$9.GuardianResponse> get guardians => $_getList(0);
}

class GetGuardianByChildIdRequest extends $pb.GeneratedMessage {
  factory GetGuardianByChildIdRequest({
    $core.String? childId,
  }) {
    final $result = create();
    if (childId != null) {
      $result.childId = childId;
    }
    return $result;
  }
  GetGuardianByChildIdRequest._() : super();
  factory GetGuardianByChildIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGuardianByChildIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGuardianByChildIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'childId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGuardianByChildIdRequest clone() => GetGuardianByChildIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGuardianByChildIdRequest copyWith(void Function(GetGuardianByChildIdRequest) updates) => super.copyWith((message) => updates(message as GetGuardianByChildIdRequest)) as GetGuardianByChildIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGuardianByChildIdRequest create() => GetGuardianByChildIdRequest._();
  GetGuardianByChildIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetGuardianByChildIdRequest> createRepeated() => $pb.PbList<GetGuardianByChildIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGuardianByChildIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGuardianByChildIdRequest>(create);
  static GetGuardianByChildIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get childId => $_getSZ(0);
  @$pb.TagNumber(1)
  set childId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChildId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChildId() => clearField(1);
}

class GetGuardianByChildIdResponse extends $pb.GeneratedMessage {
  factory GetGuardianByChildIdResponse({
    $9.GuardianResponse? guardian,
  }) {
    final $result = create();
    if (guardian != null) {
      $result.guardian = guardian;
    }
    return $result;
  }
  GetGuardianByChildIdResponse._() : super();
  factory GetGuardianByChildIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGuardianByChildIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGuardianByChildIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$9.GuardianResponse>(1, _omitFieldNames ? '' : 'guardian', subBuilder: $9.GuardianResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGuardianByChildIdResponse clone() => GetGuardianByChildIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGuardianByChildIdResponse copyWith(void Function(GetGuardianByChildIdResponse) updates) => super.copyWith((message) => updates(message as GetGuardianByChildIdResponse)) as GetGuardianByChildIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGuardianByChildIdResponse create() => GetGuardianByChildIdResponse._();
  GetGuardianByChildIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetGuardianByChildIdResponse> createRepeated() => $pb.PbList<GetGuardianByChildIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetGuardianByChildIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGuardianByChildIdResponse>(create);
  static GetGuardianByChildIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $9.GuardianResponse get guardian => $_getN(0);
  @$pb.TagNumber(1)
  set guardian($9.GuardianResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuardian() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuardian() => clearField(1);
  @$pb.TagNumber(1)
  $9.GuardianResponse ensureGuardian() => $_ensure(0);
}

class GetGuardianListByNurseryIdRequest extends $pb.GeneratedMessage {
  factory GetGuardianListByNurseryIdRequest({
    $core.String? nurseryId,
  }) {
    final $result = create();
    if (nurseryId != null) {
      $result.nurseryId = nurseryId;
    }
    return $result;
  }
  GetGuardianListByNurseryIdRequest._() : super();
  factory GetGuardianListByNurseryIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGuardianListByNurseryIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGuardianListByNurseryIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nurseryId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGuardianListByNurseryIdRequest clone() => GetGuardianListByNurseryIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGuardianListByNurseryIdRequest copyWith(void Function(GetGuardianListByNurseryIdRequest) updates) => super.copyWith((message) => updates(message as GetGuardianListByNurseryIdRequest)) as GetGuardianListByNurseryIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGuardianListByNurseryIdRequest create() => GetGuardianListByNurseryIdRequest._();
  GetGuardianListByNurseryIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetGuardianListByNurseryIdRequest> createRepeated() => $pb.PbList<GetGuardianListByNurseryIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGuardianListByNurseryIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGuardianListByNurseryIdRequest>(create);
  static GetGuardianListByNurseryIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nurseryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nurseryId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNurseryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNurseryId() => clearField(1);
}

class GetGuardianListByNurseryIdResponse extends $pb.GeneratedMessage {
  factory GetGuardianListByNurseryIdResponse({
    $core.Iterable<$9.GuardianResponse>? guardians,
  }) {
    final $result = create();
    if (guardians != null) {
      $result.guardians.addAll(guardians);
    }
    return $result;
  }
  GetGuardianListByNurseryIdResponse._() : super();
  factory GetGuardianListByNurseryIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGuardianListByNurseryIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGuardianListByNurseryIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<$9.GuardianResponse>(1, _omitFieldNames ? '' : 'guardians', $pb.PbFieldType.PM, subBuilder: $9.GuardianResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGuardianListByNurseryIdResponse clone() => GetGuardianListByNurseryIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGuardianListByNurseryIdResponse copyWith(void Function(GetGuardianListByNurseryIdResponse) updates) => super.copyWith((message) => updates(message as GetGuardianListByNurseryIdResponse)) as GetGuardianListByNurseryIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGuardianListByNurseryIdResponse create() => GetGuardianListByNurseryIdResponse._();
  GetGuardianListByNurseryIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetGuardianListByNurseryIdResponse> createRepeated() => $pb.PbList<GetGuardianListByNurseryIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetGuardianListByNurseryIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGuardianListByNurseryIdResponse>(create);
  static GetGuardianListByNurseryIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$9.GuardianResponse> get guardians => $_getList(0);
}

class UpdateGuardianRequest extends $pb.GeneratedMessage {
  factory UpdateGuardianRequest({
    $core.String? guardianId,
    $core.String? name,
    $core.String? email,
    $core.String? phoneNumber,
    $core.bool? isUseMorningBus,
    $core.bool? isUseEveningBus,
    $10.FieldMask? updateMask,
  }) {
    final $result = create();
    if (guardianId != null) {
      $result.guardianId = guardianId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (email != null) {
      $result.email = email;
    }
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    if (isUseMorningBus != null) {
      $result.isUseMorningBus = isUseMorningBus;
    }
    if (isUseEveningBus != null) {
      $result.isUseEveningBus = isUseEveningBus;
    }
    if (updateMask != null) {
      $result.updateMask = updateMask;
    }
    return $result;
  }
  UpdateGuardianRequest._() : super();
  factory UpdateGuardianRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateGuardianRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateGuardianRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'guardianId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'phoneNumber')
    ..aOB(5, _omitFieldNames ? '' : 'isUseMorningBus')
    ..aOB(6, _omitFieldNames ? '' : 'isUseEveningBus')
    ..aOM<$10.FieldMask>(11, _omitFieldNames ? '' : 'updateMask', subBuilder: $10.FieldMask.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateGuardianRequest clone() => UpdateGuardianRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateGuardianRequest copyWith(void Function(UpdateGuardianRequest) updates) => super.copyWith((message) => updates(message as UpdateGuardianRequest)) as UpdateGuardianRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGuardianRequest create() => UpdateGuardianRequest._();
  UpdateGuardianRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateGuardianRequest> createRepeated() => $pb.PbList<UpdateGuardianRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateGuardianRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateGuardianRequest>(create);
  static UpdateGuardianRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get guardianId => $_getSZ(0);
  @$pb.TagNumber(1)
  set guardianId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuardianId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuardianId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get phoneNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set phoneNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhoneNumber() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isUseMorningBus => $_getBF(4);
  @$pb.TagNumber(5)
  set isUseMorningBus($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsUseMorningBus() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsUseMorningBus() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isUseEveningBus => $_getBF(5);
  @$pb.TagNumber(6)
  set isUseEveningBus($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsUseEveningBus() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsUseEveningBus() => clearField(6);

  @$pb.TagNumber(11)
  $10.FieldMask get updateMask => $_getN(6);
  @$pb.TagNumber(11)
  set updateMask($10.FieldMask v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasUpdateMask() => $_has(6);
  @$pb.TagNumber(11)
  void clearUpdateMask() => clearField(11);
  @$pb.TagNumber(11)
  $10.FieldMask ensureUpdateMask() => $_ensure(6);
}

class UpdateGuardianResponse extends $pb.GeneratedMessage {
  factory UpdateGuardianResponse({
    $9.GuardianResponse? guardian,
  }) {
    final $result = create();
    if (guardian != null) {
      $result.guardian = guardian;
    }
    return $result;
  }
  UpdateGuardianResponse._() : super();
  factory UpdateGuardianResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateGuardianResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateGuardianResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$9.GuardianResponse>(1, _omitFieldNames ? '' : 'guardian', subBuilder: $9.GuardianResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateGuardianResponse clone() => UpdateGuardianResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateGuardianResponse copyWith(void Function(UpdateGuardianResponse) updates) => super.copyWith((message) => updates(message as UpdateGuardianResponse)) as UpdateGuardianResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGuardianResponse create() => UpdateGuardianResponse._();
  UpdateGuardianResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateGuardianResponse> createRepeated() => $pb.PbList<UpdateGuardianResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateGuardianResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateGuardianResponse>(create);
  static UpdateGuardianResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $9.GuardianResponse get guardian => $_getN(0);
  @$pb.TagNumber(1)
  set guardian($9.GuardianResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuardian() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuardian() => clearField(1);
  @$pb.TagNumber(1)
  $9.GuardianResponse ensureGuardian() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
