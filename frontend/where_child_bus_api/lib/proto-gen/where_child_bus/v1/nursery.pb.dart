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

import '../../google/protobuf/field_mask.pb.dart' as $9;
import 'resources.pb.dart' as $8;

class GetNurseryByGuardianIdRequest extends $pb.GeneratedMessage {
  factory GetNurseryByGuardianIdRequest({
    $core.String? guardianId,
  }) {
    final $result = create();
    if (guardianId != null) {
      $result.guardianId = guardianId;
    }
    return $result;
  }
  GetNurseryByGuardianIdRequest._() : super();
  factory GetNurseryByGuardianIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNurseryByGuardianIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNurseryByGuardianIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'guardianId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNurseryByGuardianIdRequest clone() => GetNurseryByGuardianIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNurseryByGuardianIdRequest copyWith(void Function(GetNurseryByGuardianIdRequest) updates) => super.copyWith((message) => updates(message as GetNurseryByGuardianIdRequest)) as GetNurseryByGuardianIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNurseryByGuardianIdRequest create() => GetNurseryByGuardianIdRequest._();
  GetNurseryByGuardianIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetNurseryByGuardianIdRequest> createRepeated() => $pb.PbList<GetNurseryByGuardianIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNurseryByGuardianIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNurseryByGuardianIdRequest>(create);
  static GetNurseryByGuardianIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get guardianId => $_getSZ(0);
  @$pb.TagNumber(1)
  set guardianId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuardianId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuardianId() => clearField(1);
}

class GetNurseryByGuardianIdResponse extends $pb.GeneratedMessage {
  factory GetNurseryByGuardianIdResponse({
    $8.NurseryResponse? nurseries,
  }) {
    final $result = create();
    if (nurseries != null) {
      $result.nurseries = nurseries;
    }
    return $result;
  }
  GetNurseryByGuardianIdResponse._() : super();
  factory GetNurseryByGuardianIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNurseryByGuardianIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNurseryByGuardianIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$8.NurseryResponse>(1, _omitFieldNames ? '' : 'nurseries', subBuilder: $8.NurseryResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNurseryByGuardianIdResponse clone() => GetNurseryByGuardianIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNurseryByGuardianIdResponse copyWith(void Function(GetNurseryByGuardianIdResponse) updates) => super.copyWith((message) => updates(message as GetNurseryByGuardianIdResponse)) as GetNurseryByGuardianIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNurseryByGuardianIdResponse create() => GetNurseryByGuardianIdResponse._();
  GetNurseryByGuardianIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetNurseryByGuardianIdResponse> createRepeated() => $pb.PbList<GetNurseryByGuardianIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetNurseryByGuardianIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNurseryByGuardianIdResponse>(create);
  static GetNurseryByGuardianIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $8.NurseryResponse get nurseries => $_getN(0);
  @$pb.TagNumber(1)
  set nurseries($8.NurseryResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNurseries() => $_has(0);
  @$pb.TagNumber(1)
  void clearNurseries() => clearField(1);
  @$pb.TagNumber(1)
  $8.NurseryResponse ensureNurseries() => $_ensure(0);
}

class CreateNurseryRequest extends $pb.GeneratedMessage {
  factory CreateNurseryRequest({
    $core.String? email,
    $core.String? password,
    $core.String? name,
    $core.String? phoneNumber,
    $core.String? address,
  }) {
    final $result = create();
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
    if (address != null) {
      $result.address = address;
    }
    return $result;
  }
  CreateNurseryRequest._() : super();
  factory CreateNurseryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateNurseryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateNurseryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(5, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateNurseryRequest clone() => CreateNurseryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateNurseryRequest copyWith(void Function(CreateNurseryRequest) updates) => super.copyWith((message) => updates(message as CreateNurseryRequest)) as CreateNurseryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateNurseryRequest create() => CreateNurseryRequest._();
  CreateNurseryRequest createEmptyInstance() => create();
  static $pb.PbList<CreateNurseryRequest> createRepeated() => $pb.PbList<CreateNurseryRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateNurseryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateNurseryRequest>(create);
  static CreateNurseryRequest? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get phoneNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set phoneNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhoneNumber() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get address => $_getSZ(4);
  @$pb.TagNumber(5)
  set address($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearAddress() => clearField(5);
}

class CreateNurseryResponse extends $pb.GeneratedMessage {
  factory CreateNurseryResponse({
    $8.NurseryResponse? nursery,
  }) {
    final $result = create();
    if (nursery != null) {
      $result.nursery = nursery;
    }
    return $result;
  }
  CreateNurseryResponse._() : super();
  factory CreateNurseryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateNurseryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateNurseryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$8.NurseryResponse>(1, _omitFieldNames ? '' : 'nursery', subBuilder: $8.NurseryResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateNurseryResponse clone() => CreateNurseryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateNurseryResponse copyWith(void Function(CreateNurseryResponse) updates) => super.copyWith((message) => updates(message as CreateNurseryResponse)) as CreateNurseryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateNurseryResponse create() => CreateNurseryResponse._();
  CreateNurseryResponse createEmptyInstance() => create();
  static $pb.PbList<CreateNurseryResponse> createRepeated() => $pb.PbList<CreateNurseryResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateNurseryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateNurseryResponse>(create);
  static CreateNurseryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $8.NurseryResponse get nursery => $_getN(0);
  @$pb.TagNumber(1)
  set nursery($8.NurseryResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNursery() => $_has(0);
  @$pb.TagNumber(1)
  void clearNursery() => clearField(1);
  @$pb.TagNumber(1)
  $8.NurseryResponse ensureNursery() => $_ensure(0);
}

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
    $8.NurseryResponse? nursery,
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
    ..aOM<$8.NurseryResponse>(2, _omitFieldNames ? '' : 'nursery', subBuilder: $8.NurseryResponse.create)
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
  $8.NurseryResponse get nursery => $_getN(1);
  @$pb.TagNumber(2)
  set nursery($8.NurseryResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNursery() => $_has(1);
  @$pb.TagNumber(2)
  void clearNursery() => clearField(2);
  @$pb.TagNumber(2)
  $8.NurseryResponse ensureNursery() => $_ensure(1);
}

class UpdateNurseryRequest extends $pb.GeneratedMessage {
  factory UpdateNurseryRequest({
    $core.String? id,
    $core.String? name,
    $core.String? address,
    $core.String? phoneNumber,
    $core.String? email,
    $core.String? password,
    $9.FieldMask? updateMask,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (address != null) {
      $result.address = address;
    }
    if (phoneNumber != null) {
      $result.phoneNumber = phoneNumber;
    }
    if (email != null) {
      $result.email = email;
    }
    if (password != null) {
      $result.password = password;
    }
    if (updateMask != null) {
      $result.updateMask = updateMask;
    }
    return $result;
  }
  UpdateNurseryRequest._() : super();
  factory UpdateNurseryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNurseryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNurseryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..aOS(4, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(5, _omitFieldNames ? '' : 'email')
    ..aOS(6, _omitFieldNames ? '' : 'password')
    ..aOM<$9.FieldMask>(7, _omitFieldNames ? '' : 'updateMask', subBuilder: $9.FieldMask.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNurseryRequest clone() => UpdateNurseryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNurseryRequest copyWith(void Function(UpdateNurseryRequest) updates) => super.copyWith((message) => updates(message as UpdateNurseryRequest)) as UpdateNurseryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNurseryRequest create() => UpdateNurseryRequest._();
  UpdateNurseryRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateNurseryRequest> createRepeated() => $pb.PbList<UpdateNurseryRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateNurseryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNurseryRequest>(create);
  static UpdateNurseryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get phoneNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set phoneNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhoneNumber() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get password => $_getSZ(5);
  @$pb.TagNumber(6)
  set password($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassword() => clearField(6);

  @$pb.TagNumber(7)
  $9.FieldMask get updateMask => $_getN(6);
  @$pb.TagNumber(7)
  set updateMask($9.FieldMask v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdateMask() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateMask() => clearField(7);
  @$pb.TagNumber(7)
  $9.FieldMask ensureUpdateMask() => $_ensure(6);
}

class UpdateNurseryResponse extends $pb.GeneratedMessage {
  factory UpdateNurseryResponse({
    $8.NurseryResponse? nursery,
  }) {
    final $result = create();
    if (nursery != null) {
      $result.nursery = nursery;
    }
    return $result;
  }
  UpdateNurseryResponse._() : super();
  factory UpdateNurseryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNurseryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNurseryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$8.NurseryResponse>(1, _omitFieldNames ? '' : 'nursery', subBuilder: $8.NurseryResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNurseryResponse clone() => UpdateNurseryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNurseryResponse copyWith(void Function(UpdateNurseryResponse) updates) => super.copyWith((message) => updates(message as UpdateNurseryResponse)) as UpdateNurseryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNurseryResponse create() => UpdateNurseryResponse._();
  UpdateNurseryResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateNurseryResponse> createRepeated() => $pb.PbList<UpdateNurseryResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateNurseryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNurseryResponse>(create);
  static UpdateNurseryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $8.NurseryResponse get nursery => $_getN(0);
  @$pb.TagNumber(1)
  set nursery($8.NurseryResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNursery() => $_has(0);
  @$pb.TagNumber(1)
  void clearNursery() => clearField(1);
  @$pb.TagNumber(1)
  $8.NurseryResponse ensureNursery() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
