//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/child.proto
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
import 'resources.pbenum.dart' as $9;

class CreateChildRequest extends $pb.GeneratedMessage {
  factory CreateChildRequest({
    $core.String? nurseryId,
    $core.String? guardianId,
    $core.String? name,
    $core.int? age,
    $9.Sex? sex,
    $core.Iterable<$core.List<$core.int>>? photos,
  }) {
    final $result = create();
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
    if (photos != null) {
      $result.photos.addAll(photos);
    }
    return $result;
  }
  CreateChildRequest._() : super();
  factory CreateChildRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChildRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChildRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nurseryId')
    ..aOS(2, _omitFieldNames ? '' : 'guardianId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'age', $pb.PbFieldType.O3)
    ..e<$9.Sex>(5, _omitFieldNames ? '' : 'sex', $pb.PbFieldType.OE, defaultOrMaker: $9.Sex.SEX_UNSPECIFIED, valueOf: $9.Sex.valueOf, enumValues: $9.Sex.values)
    ..p<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'photos', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChildRequest clone() => CreateChildRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChildRequest copyWith(void Function(CreateChildRequest) updates) => super.copyWith((message) => updates(message as CreateChildRequest)) as CreateChildRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChildRequest create() => CreateChildRequest._();
  CreateChildRequest createEmptyInstance() => create();
  static $pb.PbList<CreateChildRequest> createRepeated() => $pb.PbList<CreateChildRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateChildRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChildRequest>(create);
  static CreateChildRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nurseryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nurseryId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNurseryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNurseryId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get guardianId => $_getSZ(1);
  @$pb.TagNumber(2)
  set guardianId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGuardianId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuardianId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get age => $_getIZ(3);
  @$pb.TagNumber(4)
  set age($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearAge() => clearField(4);

  @$pb.TagNumber(5)
  $9.Sex get sex => $_getN(4);
  @$pb.TagNumber(5)
  set sex($9.Sex v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSex() => $_has(4);
  @$pb.TagNumber(5)
  void clearSex() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.List<$core.int>> get photos => $_getList(5);
}

class CreateChildResponse extends $pb.GeneratedMessage {
  factory CreateChildResponse({
    $9.Child? child,
  }) {
    final $result = create();
    if (child != null) {
      $result.child = child;
    }
    return $result;
  }
  CreateChildResponse._() : super();
  factory CreateChildResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChildResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChildResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$9.Child>(1, _omitFieldNames ? '' : 'child', subBuilder: $9.Child.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChildResponse clone() => CreateChildResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChildResponse copyWith(void Function(CreateChildResponse) updates) => super.copyWith((message) => updates(message as CreateChildResponse)) as CreateChildResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChildResponse create() => CreateChildResponse._();
  CreateChildResponse createEmptyInstance() => create();
  static $pb.PbList<CreateChildResponse> createRepeated() => $pb.PbList<CreateChildResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateChildResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChildResponse>(create);
  static CreateChildResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $9.Child get child => $_getN(0);
  @$pb.TagNumber(1)
  set child($9.Child v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChild() => $_has(0);
  @$pb.TagNumber(1)
  void clearChild() => clearField(1);
  @$pb.TagNumber(1)
  $9.Child ensureChild() => $_ensure(0);
}

class GetChildListByNurseryIDRequest extends $pb.GeneratedMessage {
  factory GetChildListByNurseryIDRequest({
    $core.String? nurseryId,
  }) {
    final $result = create();
    if (nurseryId != null) {
      $result.nurseryId = nurseryId;
    }
    return $result;
  }
  GetChildListByNurseryIDRequest._() : super();
  factory GetChildListByNurseryIDRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChildListByNurseryIDRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChildListByNurseryIDRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nurseryId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChildListByNurseryIDRequest clone() => GetChildListByNurseryIDRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChildListByNurseryIDRequest copyWith(void Function(GetChildListByNurseryIDRequest) updates) => super.copyWith((message) => updates(message as GetChildListByNurseryIDRequest)) as GetChildListByNurseryIDRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChildListByNurseryIDRequest create() => GetChildListByNurseryIDRequest._();
  GetChildListByNurseryIDRequest createEmptyInstance() => create();
  static $pb.PbList<GetChildListByNurseryIDRequest> createRepeated() => $pb.PbList<GetChildListByNurseryIDRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChildListByNurseryIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChildListByNurseryIDRequest>(create);
  static GetChildListByNurseryIDRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nurseryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nurseryId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNurseryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNurseryId() => clearField(1);
}

class GetChildListByNurseryIDResponse extends $pb.GeneratedMessage {
  factory GetChildListByNurseryIDResponse({
    $core.Iterable<$9.Child>? children,
    $core.Iterable<$9.ChildPhoto>? photos,
  }) {
    final $result = create();
    if (children != null) {
      $result.children.addAll(children);
    }
    if (photos != null) {
      $result.photos.addAll(photos);
    }
    return $result;
  }
  GetChildListByNurseryIDResponse._() : super();
  factory GetChildListByNurseryIDResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChildListByNurseryIDResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChildListByNurseryIDResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<$9.Child>(1, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: $9.Child.create)
    ..pc<$9.ChildPhoto>(2, _omitFieldNames ? '' : 'photos', $pb.PbFieldType.PM, subBuilder: $9.ChildPhoto.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChildListByNurseryIDResponse clone() => GetChildListByNurseryIDResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChildListByNurseryIDResponse copyWith(void Function(GetChildListByNurseryIDResponse) updates) => super.copyWith((message) => updates(message as GetChildListByNurseryIDResponse)) as GetChildListByNurseryIDResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChildListByNurseryIDResponse create() => GetChildListByNurseryIDResponse._();
  GetChildListByNurseryIDResponse createEmptyInstance() => create();
  static $pb.PbList<GetChildListByNurseryIDResponse> createRepeated() => $pb.PbList<GetChildListByNurseryIDResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChildListByNurseryIDResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChildListByNurseryIDResponse>(create);
  static GetChildListByNurseryIDResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$9.Child> get children => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$9.ChildPhoto> get photos => $_getList(1);
}

class GetChildListByGuardianIDRequest extends $pb.GeneratedMessage {
  factory GetChildListByGuardianIDRequest({
    $core.String? guardianId,
  }) {
    final $result = create();
    if (guardianId != null) {
      $result.guardianId = guardianId;
    }
    return $result;
  }
  GetChildListByGuardianIDRequest._() : super();
  factory GetChildListByGuardianIDRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChildListByGuardianIDRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChildListByGuardianIDRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'guardianId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChildListByGuardianIDRequest clone() => GetChildListByGuardianIDRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChildListByGuardianIDRequest copyWith(void Function(GetChildListByGuardianIDRequest) updates) => super.copyWith((message) => updates(message as GetChildListByGuardianIDRequest)) as GetChildListByGuardianIDRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChildListByGuardianIDRequest create() => GetChildListByGuardianIDRequest._();
  GetChildListByGuardianIDRequest createEmptyInstance() => create();
  static $pb.PbList<GetChildListByGuardianIDRequest> createRepeated() => $pb.PbList<GetChildListByGuardianIDRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChildListByGuardianIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChildListByGuardianIDRequest>(create);
  static GetChildListByGuardianIDRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get guardianId => $_getSZ(0);
  @$pb.TagNumber(1)
  set guardianId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuardianId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuardianId() => clearField(1);
}

class GetChildListByGuardianIDResponse extends $pb.GeneratedMessage {
  factory GetChildListByGuardianIDResponse({
    $core.Iterable<$9.Child>? children,
    $core.Iterable<$9.ChildPhoto>? photos,
  }) {
    final $result = create();
    if (children != null) {
      $result.children.addAll(children);
    }
    if (photos != null) {
      $result.photos.addAll(photos);
    }
    return $result;
  }
  GetChildListByGuardianIDResponse._() : super();
  factory GetChildListByGuardianIDResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChildListByGuardianIDResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChildListByGuardianIDResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<$9.Child>(1, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: $9.Child.create)
    ..pc<$9.ChildPhoto>(2, _omitFieldNames ? '' : 'photos', $pb.PbFieldType.PM, subBuilder: $9.ChildPhoto.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChildListByGuardianIDResponse clone() => GetChildListByGuardianIDResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChildListByGuardianIDResponse copyWith(void Function(GetChildListByGuardianIDResponse) updates) => super.copyWith((message) => updates(message as GetChildListByGuardianIDResponse)) as GetChildListByGuardianIDResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChildListByGuardianIDResponse create() => GetChildListByGuardianIDResponse._();
  GetChildListByGuardianIDResponse createEmptyInstance() => create();
  static $pb.PbList<GetChildListByGuardianIDResponse> createRepeated() => $pb.PbList<GetChildListByGuardianIDResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChildListByGuardianIDResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChildListByGuardianIDResponse>(create);
  static GetChildListByGuardianIDResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$9.Child> get children => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$9.ChildPhoto> get photos => $_getList(1);
}

class GetChildListByBusIDRequest extends $pb.GeneratedMessage {
  factory GetChildListByBusIDRequest({
    $core.String? busId,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    return $result;
  }
  GetChildListByBusIDRequest._() : super();
  factory GetChildListByBusIDRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChildListByBusIDRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChildListByBusIDRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChildListByBusIDRequest clone() => GetChildListByBusIDRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChildListByBusIDRequest copyWith(void Function(GetChildListByBusIDRequest) updates) => super.copyWith((message) => updates(message as GetChildListByBusIDRequest)) as GetChildListByBusIDRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChildListByBusIDRequest create() => GetChildListByBusIDRequest._();
  GetChildListByBusIDRequest createEmptyInstance() => create();
  static $pb.PbList<GetChildListByBusIDRequest> createRepeated() => $pb.PbList<GetChildListByBusIDRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChildListByBusIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChildListByBusIDRequest>(create);
  static GetChildListByBusIDRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);
}

class GetChildListByBusIDResponse extends $pb.GeneratedMessage {
  factory GetChildListByBusIDResponse({
    $core.Iterable<$9.Child>? children,
    $core.Iterable<$9.ChildPhoto>? photos,
  }) {
    final $result = create();
    if (children != null) {
      $result.children.addAll(children);
    }
    if (photos != null) {
      $result.photos.addAll(photos);
    }
    return $result;
  }
  GetChildListByBusIDResponse._() : super();
  factory GetChildListByBusIDResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChildListByBusIDResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChildListByBusIDResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<$9.Child>(1, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: $9.Child.create)
    ..pc<$9.ChildPhoto>(2, _omitFieldNames ? '' : 'photos', $pb.PbFieldType.PM, subBuilder: $9.ChildPhoto.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChildListByBusIDResponse clone() => GetChildListByBusIDResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChildListByBusIDResponse copyWith(void Function(GetChildListByBusIDResponse) updates) => super.copyWith((message) => updates(message as GetChildListByBusIDResponse)) as GetChildListByBusIDResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChildListByBusIDResponse create() => GetChildListByBusIDResponse._();
  GetChildListByBusIDResponse createEmptyInstance() => create();
  static $pb.PbList<GetChildListByBusIDResponse> createRepeated() => $pb.PbList<GetChildListByBusIDResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChildListByBusIDResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChildListByBusIDResponse>(create);
  static GetChildListByBusIDResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$9.Child> get children => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$9.ChildPhoto> get photos => $_getList(1);
}

class CheckIsChildInBusRequest extends $pb.GeneratedMessage {
  factory CheckIsChildInBusRequest({
    $core.String? childId,
  }) {
    final $result = create();
    if (childId != null) {
      $result.childId = childId;
    }
    return $result;
  }
  CheckIsChildInBusRequest._() : super();
  factory CheckIsChildInBusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckIsChildInBusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckIsChildInBusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'childId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckIsChildInBusRequest clone() => CheckIsChildInBusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckIsChildInBusRequest copyWith(void Function(CheckIsChildInBusRequest) updates) => super.copyWith((message) => updates(message as CheckIsChildInBusRequest)) as CheckIsChildInBusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckIsChildInBusRequest create() => CheckIsChildInBusRequest._();
  CheckIsChildInBusRequest createEmptyInstance() => create();
  static $pb.PbList<CheckIsChildInBusRequest> createRepeated() => $pb.PbList<CheckIsChildInBusRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckIsChildInBusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckIsChildInBusRequest>(create);
  static CheckIsChildInBusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get childId => $_getSZ(0);
  @$pb.TagNumber(1)
  set childId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChildId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChildId() => clearField(1);
}

class CheckIsChildInBusResponse extends $pb.GeneratedMessage {
  factory CheckIsChildInBusResponse({
    $core.bool? isInBus,
  }) {
    final $result = create();
    if (isInBus != null) {
      $result.isInBus = isInBus;
    }
    return $result;
  }
  CheckIsChildInBusResponse._() : super();
  factory CheckIsChildInBusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckIsChildInBusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckIsChildInBusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isInBus')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckIsChildInBusResponse clone() => CheckIsChildInBusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckIsChildInBusResponse copyWith(void Function(CheckIsChildInBusResponse) updates) => super.copyWith((message) => updates(message as CheckIsChildInBusResponse)) as CheckIsChildInBusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckIsChildInBusResponse create() => CheckIsChildInBusResponse._();
  CheckIsChildInBusResponse createEmptyInstance() => create();
  static $pb.PbList<CheckIsChildInBusResponse> createRepeated() => $pb.PbList<CheckIsChildInBusResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckIsChildInBusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckIsChildInBusResponse>(create);
  static CheckIsChildInBusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isInBus => $_getBF(0);
  @$pb.TagNumber(1)
  set isInBus($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsInBus() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsInBus() => clearField(1);
}

class UpdateChildRequest extends $pb.GeneratedMessage {
  factory UpdateChildRequest({
    $core.String? childId,
    $core.String? name,
    $core.int? age,
    $9.Sex? sex,
    $core.bool? checkForMissingItems,
    $core.bool? hasBag,
    $core.bool? hasLunchBox,
    $core.bool? hasWaterBottle,
    $core.bool? hasUmbrella,
    $core.bool? hasOther,
    $10.FieldMask? updateMask,
  }) {
    final $result = create();
    if (childId != null) {
      $result.childId = childId;
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
    if (updateMask != null) {
      $result.updateMask = updateMask;
    }
    return $result;
  }
  UpdateChildRequest._() : super();
  factory UpdateChildRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChildRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateChildRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'childId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'age', $pb.PbFieldType.O3)
    ..e<$9.Sex>(4, _omitFieldNames ? '' : 'sex', $pb.PbFieldType.OE, defaultOrMaker: $9.Sex.SEX_UNSPECIFIED, valueOf: $9.Sex.valueOf, enumValues: $9.Sex.values)
    ..aOB(5, _omitFieldNames ? '' : 'checkForMissingItems')
    ..aOB(6, _omitFieldNames ? '' : 'hasBag')
    ..aOB(7, _omitFieldNames ? '' : 'hasLunchBox')
    ..aOB(8, _omitFieldNames ? '' : 'hasWaterBottle')
    ..aOB(9, _omitFieldNames ? '' : 'hasUmbrella')
    ..aOB(10, _omitFieldNames ? '' : 'hasOther')
    ..aOM<$10.FieldMask>(11, _omitFieldNames ? '' : 'updateMask', subBuilder: $10.FieldMask.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChildRequest clone() => UpdateChildRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChildRequest copyWith(void Function(UpdateChildRequest) updates) => super.copyWith((message) => updates(message as UpdateChildRequest)) as UpdateChildRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChildRequest create() => UpdateChildRequest._();
  UpdateChildRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateChildRequest> createRepeated() => $pb.PbList<UpdateChildRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateChildRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChildRequest>(create);
  static UpdateChildRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get childId => $_getSZ(0);
  @$pb.TagNumber(1)
  set childId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChildId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChildId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get age => $_getIZ(2);
  @$pb.TagNumber(3)
  set age($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => clearField(3);

  @$pb.TagNumber(4)
  $9.Sex get sex => $_getN(3);
  @$pb.TagNumber(4)
  set sex($9.Sex v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get checkForMissingItems => $_getBF(4);
  @$pb.TagNumber(5)
  set checkForMissingItems($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCheckForMissingItems() => $_has(4);
  @$pb.TagNumber(5)
  void clearCheckForMissingItems() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get hasBag => $_getBF(5);
  @$pb.TagNumber(6)
  set hasBag($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHasBag() => $_has(5);
  @$pb.TagNumber(6)
  void clearHasBag() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get hasLunchBox => $_getBF(6);
  @$pb.TagNumber(7)
  set hasLunchBox($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasHasLunchBox() => $_has(6);
  @$pb.TagNumber(7)
  void clearHasLunchBox() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get hasWaterBottle => $_getBF(7);
  @$pb.TagNumber(8)
  set hasWaterBottle($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHasWaterBottle() => $_has(7);
  @$pb.TagNumber(8)
  void clearHasWaterBottle() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get hasUmbrella => $_getBF(8);
  @$pb.TagNumber(9)
  set hasUmbrella($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHasUmbrella() => $_has(8);
  @$pb.TagNumber(9)
  void clearHasUmbrella() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get hasOther => $_getBF(9);
  @$pb.TagNumber(10)
  set hasOther($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasHasOther() => $_has(9);
  @$pb.TagNumber(10)
  void clearHasOther() => clearField(10);

  @$pb.TagNumber(11)
  $10.FieldMask get updateMask => $_getN(10);
  @$pb.TagNumber(11)
  set updateMask($10.FieldMask v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasUpdateMask() => $_has(10);
  @$pb.TagNumber(11)
  void clearUpdateMask() => clearField(11);
  @$pb.TagNumber(11)
  $10.FieldMask ensureUpdateMask() => $_ensure(10);
}

class UpdateChildResponse extends $pb.GeneratedMessage {
  factory UpdateChildResponse({
    $9.Child? child,
  }) {
    final $result = create();
    if (child != null) {
      $result.child = child;
    }
    return $result;
  }
  UpdateChildResponse._() : super();
  factory UpdateChildResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChildResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateChildResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$9.Child>(1, _omitFieldNames ? '' : 'child', subBuilder: $9.Child.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChildResponse clone() => UpdateChildResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChildResponse copyWith(void Function(UpdateChildResponse) updates) => super.copyWith((message) => updates(message as UpdateChildResponse)) as UpdateChildResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChildResponse create() => UpdateChildResponse._();
  UpdateChildResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateChildResponse> createRepeated() => $pb.PbList<UpdateChildResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateChildResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChildResponse>(create);
  static UpdateChildResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $9.Child get child => $_getN(0);
  @$pb.TagNumber(1)
  set child($9.Child v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChild() => $_has(0);
  @$pb.TagNumber(1)
  void clearChild() => clearField(1);
  @$pb.TagNumber(1)
  $9.Child ensureChild() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
