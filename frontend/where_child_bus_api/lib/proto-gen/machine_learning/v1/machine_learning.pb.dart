//
//  Generated code. Do not modify.
//  source: machine_learning/v1/machine_learning.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TrainRequest extends $pb.GeneratedMessage {
  factory TrainRequest({
    $core.String? nurseryId,
    $core.Iterable<$core.String>? childId,
    $core.String? busId,
  }) {
    final $result = create();
    if (nurseryId != null) {
      $result.nurseryId = nurseryId;
    }
    if (childId != null) {
      $result.childId.addAll(childId);
    }
    if (busId != null) {
      $result.busId = busId;
    }
    return $result;
  }
  TrainRequest._() : super();
  factory TrainRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrainRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrainRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'machine_learning.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nurseryId')
    ..pPS(2, _omitFieldNames ? '' : 'childId')
    ..aOS(3, _omitFieldNames ? '' : 'busId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrainRequest clone() => TrainRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrainRequest copyWith(void Function(TrainRequest) updates) => super.copyWith((message) => updates(message as TrainRequest)) as TrainRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainRequest create() => TrainRequest._();
  TrainRequest createEmptyInstance() => create();
  static $pb.PbList<TrainRequest> createRepeated() => $pb.PbList<TrainRequest>();
  @$core.pragma('dart2js:noInline')
  static TrainRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrainRequest>(create);
  static TrainRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nurseryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nurseryId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNurseryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNurseryId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get childId => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get busId => $_getSZ(2);
  @$pb.TagNumber(3)
  set busId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBusId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBusId() => clearField(3);
}

class TrainResponse extends $pb.GeneratedMessage {
  factory TrainResponse({
    $core.bool? isStarted,
  }) {
    final $result = create();
    if (isStarted != null) {
      $result.isStarted = isStarted;
    }
    return $result;
  }
  TrainResponse._() : super();
  factory TrainResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrainResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrainResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'machine_learning.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isStarted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrainResponse clone() => TrainResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrainResponse copyWith(void Function(TrainResponse) updates) => super.copyWith((message) => updates(message as TrainResponse)) as TrainResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrainResponse create() => TrainResponse._();
  TrainResponse createEmptyInstance() => create();
  static $pb.PbList<TrainResponse> createRepeated() => $pb.PbList<TrainResponse>();
  @$core.pragma('dart2js:noInline')
  static TrainResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrainResponse>(create);
  static TrainResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isStarted => $_getBF(0);
  @$pb.TagNumber(1)
  set isStarted($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsStarted() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsStarted() => clearField(1);
}

class PredRequest extends $pb.GeneratedMessage {
  factory PredRequest({
    $core.String? busId,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    return $result;
  }
  PredRequest._() : super();
  factory PredRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PredRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PredRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'machine_learning.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PredRequest clone() => PredRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PredRequest copyWith(void Function(PredRequest) updates) => super.copyWith((message) => updates(message as PredRequest)) as PredRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PredRequest create() => PredRequest._();
  PredRequest createEmptyInstance() => create();
  static $pb.PbList<PredRequest> createRepeated() => $pb.PbList<PredRequest>();
  @$core.pragma('dart2js:noInline')
  static PredRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PredRequest>(create);
  static PredRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);
}

class PredResponse extends $pb.GeneratedMessage {
  factory PredResponse({
    $core.Iterable<$core.String>? childId,
  }) {
    final $result = create();
    if (childId != null) {
      $result.childId.addAll(childId);
    }
    return $result;
  }
  PredResponse._() : super();
  factory PredResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PredResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PredResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'machine_learning.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'childId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PredResponse clone() => PredResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PredResponse copyWith(void Function(PredResponse) updates) => super.copyWith((message) => updates(message as PredResponse)) as PredResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PredResponse create() => PredResponse._();
  PredResponse createEmptyInstance() => create();
  static $pb.PbList<PredResponse> createRepeated() => $pb.PbList<PredResponse>();
  @$core.pragma('dart2js:noInline')
  static PredResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PredResponse>(create);
  static PredResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get childId => $_getList(0);
}

class FaceDetectAndClipResponse extends $pb.GeneratedMessage {
  factory FaceDetectAndClipResponse({
    $core.String? nurseryId,
    $core.String? childId,
  }) {
    final $result = create();
    if (nurseryId != null) {
      $result.nurseryId = nurseryId;
    }
    if (childId != null) {
      $result.childId = childId;
    }
    return $result;
  }
  FaceDetectAndClipResponse._() : super();
  factory FaceDetectAndClipResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FaceDetectAndClipResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FaceDetectAndClipResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'machine_learning.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nurseryId')
    ..aOS(2, _omitFieldNames ? '' : 'childId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FaceDetectAndClipResponse clone() => FaceDetectAndClipResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FaceDetectAndClipResponse copyWith(void Function(FaceDetectAndClipResponse) updates) => super.copyWith((message) => updates(message as FaceDetectAndClipResponse)) as FaceDetectAndClipResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FaceDetectAndClipResponse create() => FaceDetectAndClipResponse._();
  FaceDetectAndClipResponse createEmptyInstance() => create();
  static $pb.PbList<FaceDetectAndClipResponse> createRepeated() => $pb.PbList<FaceDetectAndClipResponse>();
  @$core.pragma('dart2js:noInline')
  static FaceDetectAndClipResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FaceDetectAndClipResponse>(create);
  static FaceDetectAndClipResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nurseryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nurseryId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNurseryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNurseryId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get childId => $_getSZ(1);
  @$pb.TagNumber(2)
  set childId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChildId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChildId() => clearField(2);
}

class FaceDetectAndClipRequest extends $pb.GeneratedMessage {
  factory FaceDetectAndClipRequest({
    $core.bool? isStarted,
  }) {
    final $result = create();
    if (isStarted != null) {
      $result.isStarted = isStarted;
    }
    return $result;
  }
  FaceDetectAndClipRequest._() : super();
  factory FaceDetectAndClipRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FaceDetectAndClipRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FaceDetectAndClipRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'machine_learning.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isStarted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FaceDetectAndClipRequest clone() => FaceDetectAndClipRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FaceDetectAndClipRequest copyWith(void Function(FaceDetectAndClipRequest) updates) => super.copyWith((message) => updates(message as FaceDetectAndClipRequest)) as FaceDetectAndClipRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FaceDetectAndClipRequest create() => FaceDetectAndClipRequest._();
  FaceDetectAndClipRequest createEmptyInstance() => create();
  static $pb.PbList<FaceDetectAndClipRequest> createRepeated() => $pb.PbList<FaceDetectAndClipRequest>();
  @$core.pragma('dart2js:noInline')
  static FaceDetectAndClipRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FaceDetectAndClipRequest>(create);
  static FaceDetectAndClipRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isStarted => $_getBF(0);
  @$pb.TagNumber(1)
  set isStarted($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsStarted() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsStarted() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');