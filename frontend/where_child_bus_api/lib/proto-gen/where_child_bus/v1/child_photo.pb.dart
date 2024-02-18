//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/child_photo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DuplicationCheckRequest extends $pb.GeneratedMessage {
  factory DuplicationCheckRequest({
    $core.Iterable<$core.String>? childIds,
  }) {
    final $result = create();
    if (childIds != null) {
      $result.childIds.addAll(childIds);
    }
    return $result;
  }
  DuplicationCheckRequest._() : super();
  factory DuplicationCheckRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DuplicationCheckRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DuplicationCheckRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'childIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DuplicationCheckRequest clone() => DuplicationCheckRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DuplicationCheckRequest copyWith(void Function(DuplicationCheckRequest) updates) => super.copyWith((message) => updates(message as DuplicationCheckRequest)) as DuplicationCheckRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DuplicationCheckRequest create() => DuplicationCheckRequest._();
  DuplicationCheckRequest createEmptyInstance() => create();
  static $pb.PbList<DuplicationCheckRequest> createRepeated() => $pb.PbList<DuplicationCheckRequest>();
  @$core.pragma('dart2js:noInline')
  static DuplicationCheckRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DuplicationCheckRequest>(create);
  static DuplicationCheckRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get childIds => $_getList(0);
}

class DuplicationCheckResponse extends $pb.GeneratedMessage {
  factory DuplicationCheckResponse({
    $core.bool? isDuplicated,
    $core.Iterable<$core.String>? photoIds,
    $core.Iterable<$core.List<$core.int>>? duplicatedPhotos,
  }) {
    final $result = create();
    if (isDuplicated != null) {
      $result.isDuplicated = isDuplicated;
    }
    if (photoIds != null) {
      $result.photoIds.addAll(photoIds);
    }
    if (duplicatedPhotos != null) {
      $result.duplicatedPhotos.addAll(duplicatedPhotos);
    }
    return $result;
  }
  DuplicationCheckResponse._() : super();
  factory DuplicationCheckResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DuplicationCheckResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DuplicationCheckResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isDuplicated')
    ..pPS(2, _omitFieldNames ? '' : 'photoIds')
    ..p<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'duplicatedPhotos', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DuplicationCheckResponse clone() => DuplicationCheckResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DuplicationCheckResponse copyWith(void Function(DuplicationCheckResponse) updates) => super.copyWith((message) => updates(message as DuplicationCheckResponse)) as DuplicationCheckResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DuplicationCheckResponse create() => DuplicationCheckResponse._();
  DuplicationCheckResponse createEmptyInstance() => create();
  static $pb.PbList<DuplicationCheckResponse> createRepeated() => $pb.PbList<DuplicationCheckResponse>();
  @$core.pragma('dart2js:noInline')
  static DuplicationCheckResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DuplicationCheckResponse>(create);
  static DuplicationCheckResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isDuplicated => $_getBF(0);
  @$pb.TagNumber(1)
  set isDuplicated($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsDuplicated() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsDuplicated() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get photoIds => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get duplicatedPhotos => $_getList(2);
}

class DeleteChildPhotoRequest extends $pb.GeneratedMessage {
  factory DeleteChildPhotoRequest({
    $core.Iterable<$core.String>? ids,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  DeleteChildPhotoRequest._() : super();
  factory DeleteChildPhotoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteChildPhotoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteChildPhotoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteChildPhotoRequest clone() => DeleteChildPhotoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteChildPhotoRequest copyWith(void Function(DeleteChildPhotoRequest) updates) => super.copyWith((message) => updates(message as DeleteChildPhotoRequest)) as DeleteChildPhotoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteChildPhotoRequest create() => DeleteChildPhotoRequest._();
  DeleteChildPhotoRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteChildPhotoRequest> createRepeated() => $pb.PbList<DeleteChildPhotoRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteChildPhotoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteChildPhotoRequest>(create);
  static DeleteChildPhotoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);
}

class DeleteChildPhotoResponse extends $pb.GeneratedMessage {
  factory DeleteChildPhotoResponse({
    $core.Iterable<$core.bool>? isSuccessList,
    $core.Iterable<$core.String>? ids,
  }) {
    final $result = create();
    if (isSuccessList != null) {
      $result.isSuccessList.addAll(isSuccessList);
    }
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  DeleteChildPhotoResponse._() : super();
  factory DeleteChildPhotoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteChildPhotoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteChildPhotoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..p<$core.bool>(1, _omitFieldNames ? '' : 'isSuccessList', $pb.PbFieldType.KB)
    ..pPS(2, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteChildPhotoResponse clone() => DeleteChildPhotoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteChildPhotoResponse copyWith(void Function(DeleteChildPhotoResponse) updates) => super.copyWith((message) => updates(message as DeleteChildPhotoResponse)) as DeleteChildPhotoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteChildPhotoResponse create() => DeleteChildPhotoResponse._();
  DeleteChildPhotoResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteChildPhotoResponse> createRepeated() => $pb.PbList<DeleteChildPhotoResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteChildPhotoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteChildPhotoResponse>(create);
  static DeleteChildPhotoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.bool> get isSuccessList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get ids => $_getList(1);
}

class GetChildPhotoRequest extends $pb.GeneratedMessage {
  factory GetChildPhotoRequest({
    $core.String? childId,
  }) {
    final $result = create();
    if (childId != null) {
      $result.childId = childId;
    }
    return $result;
  }
  GetChildPhotoRequest._() : super();
  factory GetChildPhotoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChildPhotoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChildPhotoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'childId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChildPhotoRequest clone() => GetChildPhotoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChildPhotoRequest copyWith(void Function(GetChildPhotoRequest) updates) => super.copyWith((message) => updates(message as GetChildPhotoRequest)) as GetChildPhotoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChildPhotoRequest create() => GetChildPhotoRequest._();
  GetChildPhotoRequest createEmptyInstance() => create();
  static $pb.PbList<GetChildPhotoRequest> createRepeated() => $pb.PbList<GetChildPhotoRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChildPhotoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChildPhotoRequest>(create);
  static GetChildPhotoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get childId => $_getSZ(0);
  @$pb.TagNumber(1)
  set childId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChildId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChildId() => clearField(1);
}

class ChildPhotoResponse extends $pb.GeneratedMessage {
  factory ChildPhotoResponse({
    $core.String? childPhotoId,
    $core.List<$core.int>? photo,
  }) {
    final $result = create();
    if (childPhotoId != null) {
      $result.childPhotoId = childPhotoId;
    }
    if (photo != null) {
      $result.photo = photo;
    }
    return $result;
  }
  ChildPhotoResponse._() : super();
  factory ChildPhotoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChildPhotoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChildPhotoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'childPhotoId')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'photo', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChildPhotoResponse clone() => ChildPhotoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChildPhotoResponse copyWith(void Function(ChildPhotoResponse) updates) => super.copyWith((message) => updates(message as ChildPhotoResponse)) as ChildPhotoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChildPhotoResponse create() => ChildPhotoResponse._();
  ChildPhotoResponse createEmptyInstance() => create();
  static $pb.PbList<ChildPhotoResponse> createRepeated() => $pb.PbList<ChildPhotoResponse>();
  @$core.pragma('dart2js:noInline')
  static ChildPhotoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChildPhotoResponse>(create);
  static ChildPhotoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get childPhotoId => $_getSZ(0);
  @$pb.TagNumber(1)
  set childPhotoId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChildPhotoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChildPhotoId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get photo => $_getN(1);
  @$pb.TagNumber(2)
  set photo($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhoto() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhoto() => clearField(2);
}

class GetChildPhotoResponse extends $pb.GeneratedMessage {
  factory GetChildPhotoResponse({
    $core.Iterable<ChildPhotoResponse>? childPhotos,
  }) {
    final $result = create();
    if (childPhotos != null) {
      $result.childPhotos.addAll(childPhotos);
    }
    return $result;
  }
  GetChildPhotoResponse._() : super();
  factory GetChildPhotoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChildPhotoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChildPhotoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<ChildPhotoResponse>(1, _omitFieldNames ? '' : 'childPhotos', $pb.PbFieldType.PM, subBuilder: ChildPhotoResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChildPhotoResponse clone() => GetChildPhotoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChildPhotoResponse copyWith(void Function(GetChildPhotoResponse) updates) => super.copyWith((message) => updates(message as GetChildPhotoResponse)) as GetChildPhotoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChildPhotoResponse create() => GetChildPhotoResponse._();
  GetChildPhotoResponse createEmptyInstance() => create();
  static $pb.PbList<GetChildPhotoResponse> createRepeated() => $pb.PbList<GetChildPhotoResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChildPhotoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChildPhotoResponse>(create);
  static GetChildPhotoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ChildPhotoResponse> get childPhotos => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
