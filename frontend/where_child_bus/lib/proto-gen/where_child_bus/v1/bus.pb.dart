//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/bus.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'resources.pb.dart' as $8;

class CreateBusRequest extends $pb.GeneratedMessage {
  factory CreateBusRequest({
    $core.String? nurseryId,
    $core.String? name,
    $core.String? plateNumber,
    $core.Iterable<$core.String>? childIds,
  }) {
    final $result = create();
    if (nurseryId != null) {
      $result.nurseryId = nurseryId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (plateNumber != null) {
      $result.plateNumber = plateNumber;
    }
    if (childIds != null) {
      $result.childIds.addAll(childIds);
    }
    return $result;
  }
  CreateBusRequest._() : super();
  factory CreateBusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nurseryId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'plateNumber')
    ..pPS(4, _omitFieldNames ? '' : 'childIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusRequest clone() => CreateBusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusRequest copyWith(void Function(CreateBusRequest) updates) => super.copyWith((message) => updates(message as CreateBusRequest)) as CreateBusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusRequest create() => CreateBusRequest._();
  CreateBusRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBusRequest> createRepeated() => $pb.PbList<CreateBusRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusRequest>(create);
  static CreateBusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nurseryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nurseryId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNurseryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNurseryId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get plateNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set plateNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlateNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlateNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get childIds => $_getList(3);
}

class CreateBusResponse extends $pb.GeneratedMessage {
  factory CreateBusResponse({
    $8.Bus? bus,
    $core.Iterable<$8.Child>? children,
  }) {
    final $result = create();
    if (bus != null) {
      $result.bus = bus;
    }
    if (children != null) {
      $result.children.addAll(children);
    }
    return $result;
  }
  CreateBusResponse._() : super();
  factory CreateBusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$8.Bus>(1, _omitFieldNames ? '' : 'bus', subBuilder: $8.Bus.create)
    ..pc<$8.Child>(2, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: $8.Child.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusResponse clone() => CreateBusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusResponse copyWith(void Function(CreateBusResponse) updates) => super.copyWith((message) => updates(message as CreateBusResponse)) as CreateBusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusResponse create() => CreateBusResponse._();
  CreateBusResponse createEmptyInstance() => create();
  static $pb.PbList<CreateBusResponse> createRepeated() => $pb.PbList<CreateBusResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateBusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusResponse>(create);
  static CreateBusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $8.Bus get bus => $_getN(0);
  @$pb.TagNumber(1)
  set bus($8.Bus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBus() => $_has(0);
  @$pb.TagNumber(1)
  void clearBus() => clearField(1);
  @$pb.TagNumber(1)
  $8.Bus ensureBus() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$8.Child> get children => $_getList(1);
}

class GetBusListByNurseryIdRequest extends $pb.GeneratedMessage {
  factory GetBusListByNurseryIdRequest({
    $core.String? nurseryId,
  }) {
    final $result = create();
    if (nurseryId != null) {
      $result.nurseryId = nurseryId;
    }
    return $result;
  }
  GetBusListByNurseryIdRequest._() : super();
  factory GetBusListByNurseryIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusListByNurseryIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusListByNurseryIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nurseryId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusListByNurseryIdRequest clone() => GetBusListByNurseryIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusListByNurseryIdRequest copyWith(void Function(GetBusListByNurseryIdRequest) updates) => super.copyWith((message) => updates(message as GetBusListByNurseryIdRequest)) as GetBusListByNurseryIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusListByNurseryIdRequest create() => GetBusListByNurseryIdRequest._();
  GetBusListByNurseryIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusListByNurseryIdRequest> createRepeated() => $pb.PbList<GetBusListByNurseryIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusListByNurseryIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusListByNurseryIdRequest>(create);
  static GetBusListByNurseryIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nurseryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nurseryId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNurseryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNurseryId() => clearField(1);
}

class GetBusListByNurseryIdResponse extends $pb.GeneratedMessage {
  factory GetBusListByNurseryIdResponse({
    $core.Iterable<$8.Bus>? buses,
  }) {
    final $result = create();
    if (buses != null) {
      $result.buses.addAll(buses);
    }
    return $result;
  }
  GetBusListByNurseryIdResponse._() : super();
  factory GetBusListByNurseryIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusListByNurseryIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusListByNurseryIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<$8.Bus>(1, _omitFieldNames ? '' : 'buses', $pb.PbFieldType.PM, subBuilder: $8.Bus.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusListByNurseryIdResponse clone() => GetBusListByNurseryIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusListByNurseryIdResponse copyWith(void Function(GetBusListByNurseryIdResponse) updates) => super.copyWith((message) => updates(message as GetBusListByNurseryIdResponse)) as GetBusListByNurseryIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusListByNurseryIdResponse create() => GetBusListByNurseryIdResponse._();
  GetBusListByNurseryIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusListByNurseryIdResponse> createRepeated() => $pb.PbList<GetBusListByNurseryIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusListByNurseryIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusListByNurseryIdResponse>(create);
  static GetBusListByNurseryIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$8.Bus> get buses => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
