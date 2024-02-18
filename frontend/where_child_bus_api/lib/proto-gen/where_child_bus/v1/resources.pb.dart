//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/resources.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $7;
import 'resources.pbenum.dart';

export 'resources.pbenum.dart';

class Nursery extends $pb.GeneratedMessage {
  factory Nursery({
    $core.String? id,
    $core.String? nurseryCode,
    $core.String? name,
    $core.String? address,
    $core.String? phoneNumber,
    $core.String? email,
    $core.String? hashedPassword,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (nurseryCode != null) {
      $result.nurseryCode = nurseryCode;
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
    if (hashedPassword != null) {
      $result.hashedPassword = hashedPassword;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  Nursery._() : super();
  factory Nursery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Nursery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Nursery', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'nurseryCode')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..aOS(5, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(6, _omitFieldNames ? '' : 'email')
    ..aOS(7, _omitFieldNames ? '' : 'hashedPassword')
    ..aOM<$7.Timestamp>(8, _omitFieldNames ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(9, _omitFieldNames ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Nursery clone() => Nursery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Nursery copyWith(void Function(Nursery) updates) => super.copyWith((message) => updates(message as Nursery)) as Nursery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Nursery create() => Nursery._();
  Nursery createEmptyInstance() => create();
  static $pb.PbList<Nursery> createRepeated() => $pb.PbList<Nursery>();
  @$core.pragma('dart2js:noInline')
  static Nursery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Nursery>(create);
  static Nursery? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nurseryCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set nurseryCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNurseryCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearNurseryCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phoneNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set phoneNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhoneNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoneNumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get email => $_getSZ(5);
  @$pb.TagNumber(6)
  set email($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEmail() => $_has(5);
  @$pb.TagNumber(6)
  void clearEmail() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get hashedPassword => $_getSZ(6);
  @$pb.TagNumber(7)
  set hashedPassword($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasHashedPassword() => $_has(6);
  @$pb.TagNumber(7)
  void clearHashedPassword() => clearField(7);

  @$pb.TagNumber(8)
  $7.Timestamp get createdAt => $_getN(7);
  @$pb.TagNumber(8)
  set createdAt($7.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $7.Timestamp ensureCreatedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $7.Timestamp get updatedAt => $_getN(8);
  @$pb.TagNumber(9)
  set updatedAt($7.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => clearField(9);
  @$pb.TagNumber(9)
  $7.Timestamp ensureUpdatedAt() => $_ensure(8);
}

class NurseryResponse extends $pb.GeneratedMessage {
  factory NurseryResponse({
    $core.String? id,
    $core.String? nurseryCode,
    $core.String? name,
    $core.String? address,
    $core.String? phoneNumber,
    $core.String? email,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (nurseryCode != null) {
      $result.nurseryCode = nurseryCode;
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
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  NurseryResponse._() : super();
  factory NurseryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NurseryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NurseryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'nurseryCode')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..aOS(5, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(6, _omitFieldNames ? '' : 'email')
    ..aOM<$7.Timestamp>(7, _omitFieldNames ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(8, _omitFieldNames ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NurseryResponse clone() => NurseryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NurseryResponse copyWith(void Function(NurseryResponse) updates) => super.copyWith((message) => updates(message as NurseryResponse)) as NurseryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NurseryResponse create() => NurseryResponse._();
  NurseryResponse createEmptyInstance() => create();
  static $pb.PbList<NurseryResponse> createRepeated() => $pb.PbList<NurseryResponse>();
  @$core.pragma('dart2js:noInline')
  static NurseryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NurseryResponse>(create);
  static NurseryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nurseryCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set nurseryCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNurseryCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearNurseryCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phoneNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set phoneNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhoneNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoneNumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get email => $_getSZ(5);
  @$pb.TagNumber(6)
  set email($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEmail() => $_has(5);
  @$pb.TagNumber(6)
  void clearEmail() => clearField(6);

  /// ハッシュ化されたパスワードは除外
  @$pb.TagNumber(7)
  $7.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($7.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $7.Timestamp ensureCreatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $7.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set updatedAt($7.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $7.Timestamp ensureUpdatedAt() => $_ensure(7);
}

class Guardian extends $pb.GeneratedMessage {
  factory Guardian({
    $core.String? id,
    $core.String? nurseryId,
    $core.String? name,
    $core.String? email,
    $core.String? phoneNumber,
    $core.String? hashedPassword,
    $core.bool? isUseMorningBus,
    $core.bool? isUseEveningBus,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (nurseryId != null) {
      $result.nurseryId = nurseryId;
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
    if (hashedPassword != null) {
      $result.hashedPassword = hashedPassword;
    }
    if (isUseMorningBus != null) {
      $result.isUseMorningBus = isUseMorningBus;
    }
    if (isUseEveningBus != null) {
      $result.isUseEveningBus = isUseEveningBus;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  Guardian._() : super();
  factory Guardian.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Guardian.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Guardian', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'nurseryId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..aOS(5, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(6, _omitFieldNames ? '' : 'hashedPassword')
    ..aOB(7, _omitFieldNames ? '' : 'isUseMorningBus')
    ..aOB(8, _omitFieldNames ? '' : 'isUseEveningBus')
    ..aOM<$7.Timestamp>(9, _omitFieldNames ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(10, _omitFieldNames ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Guardian clone() => Guardian()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Guardian copyWith(void Function(Guardian) updates) => super.copyWith((message) => updates(message as Guardian)) as Guardian;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Guardian create() => Guardian._();
  Guardian createEmptyInstance() => create();
  static $pb.PbList<Guardian> createRepeated() => $pb.PbList<Guardian>();
  @$core.pragma('dart2js:noInline')
  static Guardian getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Guardian>(create);
  static Guardian? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nurseryId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nurseryId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNurseryId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNurseryId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phoneNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set phoneNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhoneNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoneNumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get hashedPassword => $_getSZ(5);
  @$pb.TagNumber(6)
  set hashedPassword($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHashedPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearHashedPassword() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isUseMorningBus => $_getBF(6);
  @$pb.TagNumber(7)
  set isUseMorningBus($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsUseMorningBus() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsUseMorningBus() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isUseEveningBus => $_getBF(7);
  @$pb.TagNumber(8)
  set isUseEveningBus($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsUseEveningBus() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsUseEveningBus() => clearField(8);

  @$pb.TagNumber(9)
  $7.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(9)
  set createdAt($7.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => clearField(9);
  @$pb.TagNumber(9)
  $7.Timestamp ensureCreatedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $7.Timestamp get updatedAt => $_getN(9);
  @$pb.TagNumber(10)
  set updatedAt($7.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => clearField(10);
  @$pb.TagNumber(10)
  $7.Timestamp ensureUpdatedAt() => $_ensure(9);
}

class GuardianResponse extends $pb.GeneratedMessage {
  factory GuardianResponse({
    $core.String? id,
    $core.String? nurseryId,
    $core.String? name,
    $core.String? email,
    $core.String? phoneNumber,
    $core.bool? isUseMorningBus,
    $core.bool? isUseEveningBus,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (nurseryId != null) {
      $result.nurseryId = nurseryId;
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
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  GuardianResponse._() : super();
  factory GuardianResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GuardianResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GuardianResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'nurseryId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..aOS(5, _omitFieldNames ? '' : 'phoneNumber')
    ..aOB(6, _omitFieldNames ? '' : 'isUseMorningBus')
    ..aOB(7, _omitFieldNames ? '' : 'isUseEveningBus')
    ..aOM<$7.Timestamp>(8, _omitFieldNames ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(9, _omitFieldNames ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GuardianResponse clone() => GuardianResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GuardianResponse copyWith(void Function(GuardianResponse) updates) => super.copyWith((message) => updates(message as GuardianResponse)) as GuardianResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuardianResponse create() => GuardianResponse._();
  GuardianResponse createEmptyInstance() => create();
  static $pb.PbList<GuardianResponse> createRepeated() => $pb.PbList<GuardianResponse>();
  @$core.pragma('dart2js:noInline')
  static GuardianResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GuardianResponse>(create);
  static GuardianResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nurseryId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nurseryId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNurseryId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNurseryId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phoneNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set phoneNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhoneNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoneNumber() => clearField(5);

  /// ハッシュ化されたパスワードは除外
  @$pb.TagNumber(6)
  $core.bool get isUseMorningBus => $_getBF(5);
  @$pb.TagNumber(6)
  set isUseMorningBus($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsUseMorningBus() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsUseMorningBus() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isUseEveningBus => $_getBF(6);
  @$pb.TagNumber(7)
  set isUseEveningBus($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsUseEveningBus() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsUseEveningBus() => clearField(7);

  @$pb.TagNumber(8)
  $7.Timestamp get createdAt => $_getN(7);
  @$pb.TagNumber(8)
  set createdAt($7.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $7.Timestamp ensureCreatedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $7.Timestamp get updatedAt => $_getN(8);
  @$pb.TagNumber(9)
  set updatedAt($7.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => clearField(9);
  @$pb.TagNumber(9)
  $7.Timestamp ensureUpdatedAt() => $_ensure(8);
}

class Bus extends $pb.GeneratedMessage {
  factory Bus({
    $core.String? id,
    $core.String? nurseryId,
    $core.String? name,
    $core.String? plateNumber,
    Status? status,
    $core.double? latitude,
    $core.double? longitude,
    $core.bool? enableFaceRecognition,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (nurseryId != null) {
      $result.nurseryId = nurseryId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (plateNumber != null) {
      $result.plateNumber = plateNumber;
    }
    if (status != null) {
      $result.status = status;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    if (enableFaceRecognition != null) {
      $result.enableFaceRecognition = enableFaceRecognition;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  Bus._() : super();
  factory Bus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Bus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Bus', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'nurseryId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'plateNumber')
    ..e<Status>(5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Status.STATUS_UNSPECIFIED, valueOf: Status.valueOf, enumValues: Status.values)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOB(8, _omitFieldNames ? '' : 'enableFaceRecognition')
    ..aOM<$7.Timestamp>(9, _omitFieldNames ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(10, _omitFieldNames ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Bus clone() => Bus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Bus copyWith(void Function(Bus) updates) => super.copyWith((message) => updates(message as Bus)) as Bus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Bus create() => Bus._();
  Bus createEmptyInstance() => create();
  static $pb.PbList<Bus> createRepeated() => $pb.PbList<Bus>();
  @$core.pragma('dart2js:noInline')
  static Bus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Bus>(create);
  static Bus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nurseryId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nurseryId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNurseryId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNurseryId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get plateNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set plateNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlateNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlateNumber() => clearField(4);

  @$pb.TagNumber(5)
  Status get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(Status v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  /// 緯度経度
  @$pb.TagNumber(6)
  $core.double get latitude => $_getN(5);
  @$pb.TagNumber(6)
  set latitude($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLatitude() => $_has(5);
  @$pb.TagNumber(6)
  void clearLatitude() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get longitude => $_getN(6);
  @$pb.TagNumber(7)
  set longitude($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLongitude() => $_has(6);
  @$pb.TagNumber(7)
  void clearLongitude() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get enableFaceRecognition => $_getBF(7);
  @$pb.TagNumber(8)
  set enableFaceRecognition($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEnableFaceRecognition() => $_has(7);
  @$pb.TagNumber(8)
  void clearEnableFaceRecognition() => clearField(8);

  @$pb.TagNumber(9)
  $7.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(9)
  set createdAt($7.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => clearField(9);
  @$pb.TagNumber(9)
  $7.Timestamp ensureCreatedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $7.Timestamp get updatedAt => $_getN(9);
  @$pb.TagNumber(10)
  set updatedAt($7.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => clearField(10);
  @$pb.TagNumber(10)
  $7.Timestamp ensureUpdatedAt() => $_ensure(9);
}

class Child extends $pb.GeneratedMessage {
  factory Child({
    $core.String? id,
    $core.String? nurseryId,
    $core.String? guardianId,
    $core.String? name,
    $core.int? age,
    Sex? sex,
    $core.bool? checkForMissingItems,
    $core.bool? hasBag,
    $core.bool? hasLunchBox,
    $core.bool? hasWaterBottle,
    $core.bool? hasUmbrella,
    $core.bool? hasOther,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (nurseryId != null) {
      $result.nurseryId = nurseryId;
    }
    if (guardianId != null) {
      $result.guardianId = guardianId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (age != null) {
      $result.age = age;
    }
    if (sex != null) {
      $result.sex = sex;
    }
    if (checkForMissingItems != null) {
      $result.checkForMissingItems = checkForMissingItems;
    }
    if (hasBag != null) {
      $result.hasBag = hasBag;
    }
    if (hasLunchBox != null) {
      $result.hasLunchBox = hasLunchBox;
    }
    if (hasWaterBottle != null) {
      $result.hasWaterBottle = hasWaterBottle;
    }
    if (hasUmbrella != null) {
      $result.hasUmbrella = hasUmbrella;
    }
    if (hasOther != null) {
      $result.hasOther = hasOther;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  Child._() : super();
  factory Child.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Child.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Child', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'nurseryId')
    ..aOS(3, _omitFieldNames ? '' : 'guardianId')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'age', $pb.PbFieldType.O3)
    ..e<Sex>(6, _omitFieldNames ? '' : 'sex', $pb.PbFieldType.OE, defaultOrMaker: Sex.SEX_UNSPECIFIED, valueOf: Sex.valueOf, enumValues: Sex.values)
    ..aOB(7, _omitFieldNames ? '' : 'checkForMissingItems')
    ..aOB(8, _omitFieldNames ? '' : 'hasBag')
    ..aOB(9, _omitFieldNames ? '' : 'hasLunchBox')
    ..aOB(10, _omitFieldNames ? '' : 'hasWaterBottle')
    ..aOB(11, _omitFieldNames ? '' : 'hasUmbrella')
    ..aOB(12, _omitFieldNames ? '' : 'hasOther')
    ..aOM<$7.Timestamp>(13, _omitFieldNames ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(14, _omitFieldNames ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Child clone() => Child()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Child copyWith(void Function(Child) updates) => super.copyWith((message) => updates(message as Child)) as Child;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Child create() => Child._();
  Child createEmptyInstance() => create();
  static $pb.PbList<Child> createRepeated() => $pb.PbList<Child>();
  @$core.pragma('dart2js:noInline')
  static Child getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Child>(create);
  static Child? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nurseryId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nurseryId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNurseryId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNurseryId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get guardianId => $_getSZ(2);
  @$pb.TagNumber(3)
  set guardianId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGuardianId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGuardianId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => clearField(5);

  @$pb.TagNumber(6)
  Sex get sex => $_getN(5);
  @$pb.TagNumber(6)
  set sex(Sex v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSex() => $_has(5);
  @$pb.TagNumber(6)
  void clearSex() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get checkForMissingItems => $_getBF(6);
  @$pb.TagNumber(7)
  set checkForMissingItems($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCheckForMissingItems() => $_has(6);
  @$pb.TagNumber(7)
  void clearCheckForMissingItems() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get hasBag => $_getBF(7);
  @$pb.TagNumber(8)
  set hasBag($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHasBag() => $_has(7);
  @$pb.TagNumber(8)
  void clearHasBag() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get hasLunchBox => $_getBF(8);
  @$pb.TagNumber(9)
  set hasLunchBox($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHasLunchBox() => $_has(8);
  @$pb.TagNumber(9)
  void clearHasLunchBox() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get hasWaterBottle => $_getBF(9);
  @$pb.TagNumber(10)
  set hasWaterBottle($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasHasWaterBottle() => $_has(9);
  @$pb.TagNumber(10)
  void clearHasWaterBottle() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get hasUmbrella => $_getBF(10);
  @$pb.TagNumber(11)
  set hasUmbrella($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasHasUmbrella() => $_has(10);
  @$pb.TagNumber(11)
  void clearHasUmbrella() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get hasOther => $_getBF(11);
  @$pb.TagNumber(12)
  set hasOther($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasHasOther() => $_has(11);
  @$pb.TagNumber(12)
  void clearHasOther() => clearField(12);

  @$pb.TagNumber(13)
  $7.Timestamp get createdAt => $_getN(12);
  @$pb.TagNumber(13)
  set createdAt($7.Timestamp v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasCreatedAt() => $_has(12);
  @$pb.TagNumber(13)
  void clearCreatedAt() => clearField(13);
  @$pb.TagNumber(13)
  $7.Timestamp ensureCreatedAt() => $_ensure(12);

  @$pb.TagNumber(14)
  $7.Timestamp get updatedAt => $_getN(13);
  @$pb.TagNumber(14)
  set updatedAt($7.Timestamp v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasUpdatedAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearUpdatedAt() => clearField(14);
  @$pb.TagNumber(14)
  $7.Timestamp ensureUpdatedAt() => $_ensure(13);
}

class Station extends $pb.GeneratedMessage {
  factory Station({
    $core.String? id,
    $core.String? guardianId,
    $core.String? morningNextStationId,
    $core.String? eveningNextStationId,
    $core.double? latitude,
    $core.double? longitude,
    $core.int? morningOrder,
    $core.int? eveningOrder,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (guardianId != null) {
      $result.guardianId = guardianId;
    }
    if (morningNextStationId != null) {
      $result.morningNextStationId = morningNextStationId;
    }
    if (eveningNextStationId != null) {
      $result.eveningNextStationId = eveningNextStationId;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    if (morningOrder != null) {
      $result.morningOrder = morningOrder;
    }
    if (eveningOrder != null) {
      $result.eveningOrder = eveningOrder;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  Station._() : super();
  factory Station.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Station.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Station', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'guardianId')
    ..aOS(3, _omitFieldNames ? '' : 'morningNextStationId')
    ..aOS(4, _omitFieldNames ? '' : 'eveningNextStationId')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'morningOrder', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'eveningOrder', $pb.PbFieldType.O3)
    ..aOM<$7.Timestamp>(9, _omitFieldNames ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(10, _omitFieldNames ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Station clone() => Station()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Station copyWith(void Function(Station) updates) => super.copyWith((message) => updates(message as Station)) as Station;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Station create() => Station._();
  Station createEmptyInstance() => create();
  static $pb.PbList<Station> createRepeated() => $pb.PbList<Station>();
  @$core.pragma('dart2js:noInline')
  static Station getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Station>(create);
  static Station? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get guardianId => $_getSZ(1);
  @$pb.TagNumber(2)
  set guardianId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGuardianId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuardianId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get morningNextStationId => $_getSZ(2);
  @$pb.TagNumber(3)
  set morningNextStationId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMorningNextStationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMorningNextStationId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get eveningNextStationId => $_getSZ(3);
  @$pb.TagNumber(4)
  set eveningNextStationId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEveningNextStationId() => $_has(3);
  @$pb.TagNumber(4)
  void clearEveningNextStationId() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get latitude => $_getN(4);
  @$pb.TagNumber(5)
  set latitude($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLatitude() => $_has(4);
  @$pb.TagNumber(5)
  void clearLatitude() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get longitude => $_getN(5);
  @$pb.TagNumber(6)
  set longitude($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLongitude() => $_has(5);
  @$pb.TagNumber(6)
  void clearLongitude() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get morningOrder => $_getIZ(6);
  @$pb.TagNumber(7)
  set morningOrder($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMorningOrder() => $_has(6);
  @$pb.TagNumber(7)
  void clearMorningOrder() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get eveningOrder => $_getIZ(7);
  @$pb.TagNumber(8)
  set eveningOrder($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEveningOrder() => $_has(7);
  @$pb.TagNumber(8)
  void clearEveningOrder() => clearField(8);

  @$pb.TagNumber(9)
  $7.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(9)
  set createdAt($7.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => clearField(9);
  @$pb.TagNumber(9)
  $7.Timestamp ensureCreatedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $7.Timestamp get updatedAt => $_getN(9);
  @$pb.TagNumber(10)
  set updatedAt($7.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => clearField(10);
  @$pb.TagNumber(10)
  $7.Timestamp ensureUpdatedAt() => $_ensure(9);
}

class ChildBusAssociation extends $pb.GeneratedMessage {
  factory ChildBusAssociation({
    $core.String? id,
    $core.String? busId,
    $core.String? childId,
    BusType? busType,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (busId != null) {
      $result.busId = busId;
    }
    if (childId != null) {
      $result.childId = childId;
    }
    if (busType != null) {
      $result.busType = busType;
    }
    return $result;
  }
  ChildBusAssociation._() : super();
  factory ChildBusAssociation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChildBusAssociation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChildBusAssociation', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'busId')
    ..aOS(3, _omitFieldNames ? '' : 'childId')
    ..e<BusType>(4, _omitFieldNames ? '' : 'busType', $pb.PbFieldType.OE, defaultOrMaker: BusType.BUS_TYPE_UNSPECIFIED, valueOf: BusType.valueOf, enumValues: BusType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChildBusAssociation clone() => ChildBusAssociation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChildBusAssociation copyWith(void Function(ChildBusAssociation) updates) => super.copyWith((message) => updates(message as ChildBusAssociation)) as ChildBusAssociation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChildBusAssociation create() => ChildBusAssociation._();
  ChildBusAssociation createEmptyInstance() => create();
  static $pb.PbList<ChildBusAssociation> createRepeated() => $pb.PbList<ChildBusAssociation>();
  @$core.pragma('dart2js:noInline')
  static ChildBusAssociation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChildBusAssociation>(create);
  static ChildBusAssociation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get busId => $_getSZ(1);
  @$pb.TagNumber(2)
  set busId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get childId => $_getSZ(2);
  @$pb.TagNumber(3)
  set childId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChildId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChildId() => clearField(3);

  @$pb.TagNumber(4)
  BusType get busType => $_getN(3);
  @$pb.TagNumber(4)
  set busType(BusType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBusType() => $_has(3);
  @$pb.TagNumber(4)
  void clearBusType() => clearField(4);
}

class BusStationAssociation extends $pb.GeneratedMessage {
  factory BusStationAssociation({
    $core.String? busId,
    $core.String? stationId,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    if (stationId != null) {
      $result.stationId = stationId;
    }
    return $result;
  }
  BusStationAssociation._() : super();
  factory BusStationAssociation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BusStationAssociation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BusStationAssociation', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..aOS(2, _omitFieldNames ? '' : 'stationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BusStationAssociation clone() => BusStationAssociation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BusStationAssociation copyWith(void Function(BusStationAssociation) updates) => super.copyWith((message) => updates(message as BusStationAssociation)) as BusStationAssociation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusStationAssociation create() => BusStationAssociation._();
  BusStationAssociation createEmptyInstance() => create();
  static $pb.PbList<BusStationAssociation> createRepeated() => $pb.PbList<BusStationAssociation>();
  @$core.pragma('dart2js:noInline')
  static BusStationAssociation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BusStationAssociation>(create);
  static BusStationAssociation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get stationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set stationId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStationId() => clearField(2);
}

class ChildPhoto extends $pb.GeneratedMessage {
  factory ChildPhoto({
    $core.String? id,
    $core.String? childId,
    $core.List<$core.int>? photoData,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (childId != null) {
      $result.childId = childId;
    }
    if (photoData != null) {
      $result.photoData = photoData;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  ChildPhoto._() : super();
  factory ChildPhoto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChildPhoto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChildPhoto', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'childId')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'photoData', $pb.PbFieldType.OY)
    ..aOM<$7.Timestamp>(4, _omitFieldNames ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(5, _omitFieldNames ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChildPhoto clone() => ChildPhoto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChildPhoto copyWith(void Function(ChildPhoto) updates) => super.copyWith((message) => updates(message as ChildPhoto)) as ChildPhoto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChildPhoto create() => ChildPhoto._();
  ChildPhoto createEmptyInstance() => create();
  static $pb.PbList<ChildPhoto> createRepeated() => $pb.PbList<ChildPhoto>();
  @$core.pragma('dart2js:noInline')
  static ChildPhoto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChildPhoto>(create);
  static ChildPhoto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get childId => $_getSZ(1);
  @$pb.TagNumber(2)
  set childId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChildId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChildId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get photoData => $_getN(2);
  @$pb.TagNumber(3)
  set photoData($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPhotoData() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhotoData() => clearField(3);

  @$pb.TagNumber(4)
  $7.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($7.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $7.Timestamp ensureCreatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $7.Timestamp get updatedAt => $_getN(4);
  @$pb.TagNumber(5)
  set updatedAt($7.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $7.Timestamp ensureUpdatedAt() => $_ensure(4);
}

class BoardingRecord extends $pb.GeneratedMessage {
  factory BoardingRecord({
    $core.String? id,
    $core.String? childId,
    $core.String? busId,
    $core.bool? isBoarding,
    $7.Timestamp? timestamp,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (childId != null) {
      $result.childId = childId;
    }
    if (busId != null) {
      $result.busId = busId;
    }
    if (isBoarding != null) {
      $result.isBoarding = isBoarding;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  BoardingRecord._() : super();
  factory BoardingRecord.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoardingRecord.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoardingRecord', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'childId')
    ..aOS(3, _omitFieldNames ? '' : 'busId')
    ..aOB(4, _omitFieldNames ? '' : 'isBoarding')
    ..aOM<$7.Timestamp>(5, _omitFieldNames ? '' : 'timestamp', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoardingRecord clone() => BoardingRecord()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoardingRecord copyWith(void Function(BoardingRecord) updates) => super.copyWith((message) => updates(message as BoardingRecord)) as BoardingRecord;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoardingRecord create() => BoardingRecord._();
  BoardingRecord createEmptyInstance() => create();
  static $pb.PbList<BoardingRecord> createRepeated() => $pb.PbList<BoardingRecord>();
  @$core.pragma('dart2js:noInline')
  static BoardingRecord getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoardingRecord>(create);
  static BoardingRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get childId => $_getSZ(1);
  @$pb.TagNumber(2)
  set childId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChildId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChildId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get busId => $_getSZ(2);
  @$pb.TagNumber(3)
  set busId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBusId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBusId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isBoarding => $_getBF(3);
  @$pb.TagNumber(4)
  set isBoarding($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsBoarding() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsBoarding() => clearField(4);

  @$pb.TagNumber(5)
  $7.Timestamp get timestamp => $_getN(4);
  @$pb.TagNumber(5)
  set timestamp($7.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestamp() => clearField(5);
  @$pb.TagNumber(5)
  $7.Timestamp ensureTimestamp() => $_ensure(4);
}

class Children extends $pb.GeneratedMessage {
  factory Children({
    $core.Iterable<Child>? children,
  }) {
    final $result = create();
    if (children != null) {
      $result.children.addAll(children);
    }
    return $result;
  }
  Children._() : super();
  factory Children.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Children.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Children', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<Child>(1, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: Child.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Children clone() => Children()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Children copyWith(void Function(Children) updates) => super.copyWith((message) => updates(message as Children)) as Children;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Children create() => Children._();
  Children createEmptyInstance() => create();
  static $pb.PbList<Children> createRepeated() => $pb.PbList<Children>();
  @$core.pragma('dart2js:noInline')
  static Children getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Children>(create);
  static Children? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Child> get children => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
