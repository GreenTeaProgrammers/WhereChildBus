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

class EvalRequest extends $pb.GeneratedMessage {
  factory EvalRequest({
    $core.String? busId,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    return $result;
  }
  EvalRequest._() : super();
  factory EvalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EvalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EvalRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'machine_learning.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EvalRequest clone() => EvalRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EvalRequest copyWith(void Function(EvalRequest) updates) => super.copyWith((message) => updates(message as EvalRequest)) as EvalRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EvalRequest create() => EvalRequest._();
  EvalRequest createEmptyInstance() => create();
  static $pb.PbList<EvalRequest> createRepeated() => $pb.PbList<EvalRequest>();
  @$core.pragma('dart2js:noInline')
  static EvalRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EvalRequest>(create);
  static EvalRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);
}

class EvalResponse extends $pb.GeneratedMessage {
  factory EvalResponse({
    $core.Iterable<$core.String>? childId,
  }) {
    final $result = create();
    if (childId != null) {
      $result.childId.addAll(childId);
    }
    return $result;
  }
  EvalResponse._() : super();
  factory EvalResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EvalResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EvalResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'machine_learning.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'childId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EvalResponse clone() => EvalResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EvalResponse copyWith(void Function(EvalResponse) updates) => super.copyWith((message) => updates(message as EvalResponse)) as EvalResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EvalResponse create() => EvalResponse._();
  EvalResponse createEmptyInstance() => create();
  static $pb.PbList<EvalResponse> createRepeated() => $pb.PbList<EvalResponse>();
  @$core.pragma('dart2js:noInline')
  static EvalResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EvalResponse>(create);
  static EvalResponse? _defaultInstance;

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

class FaceAndClipRequest extends $pb.GeneratedMessage {
  factory FaceAndClipRequest({
    $core.bool? isStarted,
  }) {
    final $result = create();
    if (isStarted != null) {
      $result.isStarted = isStarted;
    }
    return $result;
  }
  FaceAndClipRequest._() : super();
  factory FaceAndClipRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FaceAndClipRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FaceAndClipRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'machine_learning.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isStarted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FaceAndClipRequest clone() => FaceAndClipRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FaceAndClipRequest copyWith(void Function(FaceAndClipRequest) updates) => super.copyWith((message) => updates(message as FaceAndClipRequest)) as FaceAndClipRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FaceAndClipRequest create() => FaceAndClipRequest._();
  FaceAndClipRequest createEmptyInstance() => create();
  static $pb.PbList<FaceAndClipRequest> createRepeated() => $pb.PbList<FaceAndClipRequest>();
  @$core.pragma('dart2js:noInline')
  static FaceAndClipRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FaceAndClipRequest>(create);
  static FaceAndClipRequest? _defaultInstance;

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
