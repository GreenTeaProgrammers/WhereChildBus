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
import 'resources.pbenum.dart' as $8;

class CreateBusRequest extends $pb.GeneratedMessage {
  factory CreateBusRequest({
    $core.String? nurseryId,
    $core.String? name,
    $core.String? plateNumber,
    $core.Iterable<$core.String>? morningGuardianIds,
    $core.Iterable<$core.String>? eveningGuardianIds,
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
    if (morningGuardianIds != null) {
      $result.morningGuardianIds.addAll(morningGuardianIds);
    }
    if (eveningGuardianIds != null) {
      $result.eveningGuardianIds.addAll(eveningGuardianIds);
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
    ..pPS(4, _omitFieldNames ? '' : 'morningGuardianIds')
    ..pPS(5, _omitFieldNames ? '' : 'eveningGuardianIds')
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
  $core.List<$core.String> get morningGuardianIds => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.String> get eveningGuardianIds => $_getList(4);
}

class CreateBusResponse extends $pb.GeneratedMessage {
  factory CreateBusResponse({
    $8.Bus? bus,
  }) {
    final $result = create();
    if (bus != null) {
      $result.bus = bus;
    }
    return $result;
  }
  CreateBusResponse._() : super();
  factory CreateBusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$8.Bus>(1, _omitFieldNames ? '' : 'bus', subBuilder: $8.Bus.create)
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

class ChangeBusStatusRequest extends $pb.GeneratedMessage {
  factory ChangeBusStatusRequest({
    $core.String? busId,
    $8.Status? status,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  ChangeBusStatusRequest._() : super();
  factory ChangeBusStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeBusStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangeBusStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..e<$8.Status>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $8.Status.STATUS_UNSPECIFIED, valueOf: $8.Status.valueOf, enumValues: $8.Status.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeBusStatusRequest clone() => ChangeBusStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeBusStatusRequest copyWith(void Function(ChangeBusStatusRequest) updates) => super.copyWith((message) => updates(message as ChangeBusStatusRequest)) as ChangeBusStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeBusStatusRequest create() => ChangeBusStatusRequest._();
  ChangeBusStatusRequest createEmptyInstance() => create();
  static $pb.PbList<ChangeBusStatusRequest> createRepeated() => $pb.PbList<ChangeBusStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static ChangeBusStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeBusStatusRequest>(create);
  static ChangeBusStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);

  @$pb.TagNumber(2)
  $8.Status get status => $_getN(1);
  @$pb.TagNumber(2)
  set status($8.Status v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class ChangeBusStatusResponse extends $pb.GeneratedMessage {
  factory ChangeBusStatusResponse({
    $8.Bus? bus,
  }) {
    final $result = create();
    if (bus != null) {
      $result.bus = bus;
    }
    return $result;
  }
  ChangeBusStatusResponse._() : super();
  factory ChangeBusStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeBusStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangeBusStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$8.Bus>(1, _omitFieldNames ? '' : 'bus', subBuilder: $8.Bus.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeBusStatusResponse clone() => ChangeBusStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeBusStatusResponse copyWith(void Function(ChangeBusStatusResponse) updates) => super.copyWith((message) => updates(message as ChangeBusStatusResponse)) as ChangeBusStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeBusStatusResponse create() => ChangeBusStatusResponse._();
  ChangeBusStatusResponse createEmptyInstance() => create();
  static $pb.PbList<ChangeBusStatusResponse> createRepeated() => $pb.PbList<ChangeBusStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static ChangeBusStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeBusStatusResponse>(create);
  static ChangeBusStatusResponse? _defaultInstance;

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
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
