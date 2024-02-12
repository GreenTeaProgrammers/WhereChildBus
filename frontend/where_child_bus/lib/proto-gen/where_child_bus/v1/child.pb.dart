//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/child.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'resources.pb.dart' as $1;
import 'resources.pbenum.dart' as $1;

class CreateChildRequest extends $pb.GeneratedMessage {
  factory CreateChildRequest({
    $core.String? nurseryId,
    $core.String? guardianId,
    $core.String? name,
    $1.Sex? sex,
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
    ..e<$1.Sex>(4, _omitFieldNames ? '' : 'sex', $pb.PbFieldType.OE, defaultOrMaker: $1.Sex.SEX_UNSPECIFIED, valueOf: $1.Sex.valueOf, enumValues: $1.Sex.values)
    ..p<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'photos', $pb.PbFieldType.PY)
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
  $1.Sex get sex => $_getN(3);
  @$pb.TagNumber(4)
  set sex($1.Sex v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.List<$core.int>> get photos => $_getList(4);
}

class CreateChildResponse extends $pb.GeneratedMessage {
  factory CreateChildResponse({
    $1.Child? child,
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
    ..aOM<$1.Child>(1, _omitFieldNames ? '' : 'child', subBuilder: $1.Child.create)
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
  $1.Child get child => $_getN(0);
  @$pb.TagNumber(1)
  set child($1.Child v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChild() => $_has(0);
  @$pb.TagNumber(1)
  void clearChild() => clearField(1);
  @$pb.TagNumber(1)
  $1.Child ensureChild() => $_ensure(0);
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
    $core.Iterable<$1.Child>? children,
  }) {
    final $result = create();
    if (children != null) {
      $result.children.addAll(children);
    }
    return $result;
  }
  GetChildListByNurseryIDResponse._() : super();
  factory GetChildListByNurseryIDResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChildListByNurseryIDResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChildListByNurseryIDResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<$1.Child>(1, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: $1.Child.create)
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
  $core.List<$1.Child> get children => $_getList(0);
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
    $core.Iterable<$1.Child>? children,
  }) {
    final $result = create();
    if (children != null) {
      $result.children.addAll(children);
    }
    return $result;
  }
  GetChildListByGuardianIDResponse._() : super();
  factory GetChildListByGuardianIDResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChildListByGuardianIDResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChildListByGuardianIDResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<$1.Child>(1, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: $1.Child.create)
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
  $core.List<$1.Child> get children => $_getList(0);
}

class ChildServiceApi {
  $pb.RpcClient _client;
  ChildServiceApi(this._client);

  $async.Future<CreateChildResponse> createChild($pb.ClientContext? ctx, CreateChildRequest request) =>
    _client.invoke<CreateChildResponse>(ctx, 'ChildService', 'CreateChild', request, CreateChildResponse())
  ;
  $async.Future<GetChildListByNurseryIDResponse> getChildListByNurseryID($pb.ClientContext? ctx, GetChildListByNurseryIDRequest request) =>
    _client.invoke<GetChildListByNurseryIDResponse>(ctx, 'ChildService', 'GetChildListByNurseryID', request, GetChildListByNurseryIDResponse())
  ;
  $async.Future<GetChildListByGuardianIDResponse> getChildListByGuardianID($pb.ClientContext? ctx, GetChildListByGuardianIDRequest request) =>
    _client.invoke<GetChildListByGuardianIDResponse>(ctx, 'ChildService', 'GetChildListByGuardianID', request, GetChildListByGuardianIDResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
