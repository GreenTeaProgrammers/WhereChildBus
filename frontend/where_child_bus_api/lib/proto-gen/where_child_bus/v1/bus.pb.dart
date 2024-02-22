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

import '../../google/protobuf/field_mask.pb.dart' as $10;
import 'resources.pb.dart' as $9;
import 'resources.pbenum.dart' as $9;

class CreateBusRequest extends $pb.GeneratedMessage {
  factory CreateBusRequest({
    $core.String? nurseryId,
    $core.String? name,
    $core.String? plateNumber,
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
    return $result;
  }
  CreateBusRequest._() : super();
  factory CreateBusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nurseryId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'plateNumber')
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
}

class CreateBusResponse extends $pb.GeneratedMessage {
  factory CreateBusResponse({
    $9.Bus? bus,
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
    ..aOM<$9.Bus>(1, _omitFieldNames ? '' : 'bus', subBuilder: $9.Bus.create)
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
  $9.Bus get bus => $_getN(0);
  @$pb.TagNumber(1)
  set bus($9.Bus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBus() => $_has(0);
  @$pb.TagNumber(1)
  void clearBus() => clearField(1);
  @$pb.TagNumber(1)
  $9.Bus ensureBus() => $_ensure(0);
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
    $core.Iterable<$9.Bus>? buses,
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
    ..pc<$9.Bus>(1, _omitFieldNames ? '' : 'buses', $pb.PbFieldType.PM, subBuilder: $9.Bus.create)
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
  $core.List<$9.Bus> get buses => $_getList(0);
}

class GetRunningBusByGuardianIdRequest extends $pb.GeneratedMessage {
  factory GetRunningBusByGuardianIdRequest({
    $core.String? guardianId,
  }) {
    final $result = create();
    if (guardianId != null) {
      $result.guardianId = guardianId;
    }
    return $result;
  }
  GetRunningBusByGuardianIdRequest._() : super();
  factory GetRunningBusByGuardianIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRunningBusByGuardianIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRunningBusByGuardianIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'guardianId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRunningBusByGuardianIdRequest clone() => GetRunningBusByGuardianIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRunningBusByGuardianIdRequest copyWith(void Function(GetRunningBusByGuardianIdRequest) updates) => super.copyWith((message) => updates(message as GetRunningBusByGuardianIdRequest)) as GetRunningBusByGuardianIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRunningBusByGuardianIdRequest create() => GetRunningBusByGuardianIdRequest._();
  GetRunningBusByGuardianIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetRunningBusByGuardianIdRequest> createRepeated() => $pb.PbList<GetRunningBusByGuardianIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRunningBusByGuardianIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRunningBusByGuardianIdRequest>(create);
  static GetRunningBusByGuardianIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get guardianId => $_getSZ(0);
  @$pb.TagNumber(1)
  set guardianId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuardianId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuardianId() => clearField(1);
}

class GetRunningBusByGuardianIdResponse extends $pb.GeneratedMessage {
  factory GetRunningBusByGuardianIdResponse({
    $9.Bus? bus,
  }) {
    final $result = create();
    if (bus != null) {
      $result.bus = bus;
    }
    return $result;
  }
  GetRunningBusByGuardianIdResponse._() : super();
  factory GetRunningBusByGuardianIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRunningBusByGuardianIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRunningBusByGuardianIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$9.Bus>(1, _omitFieldNames ? '' : 'bus', subBuilder: $9.Bus.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRunningBusByGuardianIdResponse clone() => GetRunningBusByGuardianIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRunningBusByGuardianIdResponse copyWith(void Function(GetRunningBusByGuardianIdResponse) updates) => super.copyWith((message) => updates(message as GetRunningBusByGuardianIdResponse)) as GetRunningBusByGuardianIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRunningBusByGuardianIdResponse create() => GetRunningBusByGuardianIdResponse._();
  GetRunningBusByGuardianIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetRunningBusByGuardianIdResponse> createRepeated() => $pb.PbList<GetRunningBusByGuardianIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRunningBusByGuardianIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRunningBusByGuardianIdResponse>(create);
  static GetRunningBusByGuardianIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $9.Bus get bus => $_getN(0);
  @$pb.TagNumber(1)
  set bus($9.Bus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBus() => $_has(0);
  @$pb.TagNumber(1)
  void clearBus() => clearField(1);
  @$pb.TagNumber(1)
  $9.Bus ensureBus() => $_ensure(0);
}

class ChangeBusStatusRequest extends $pb.GeneratedMessage {
  factory ChangeBusStatusRequest({
    $core.String? busId,
    $9.BusStatus? busStatus,
    $9.BusType? busType,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    if (busStatus != null) {
      $result.busStatus = busStatus;
    }
    if (busType != null) {
      $result.busType = busType;
    }
    return $result;
  }
  ChangeBusStatusRequest._() : super();
  factory ChangeBusStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeBusStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangeBusStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..e<$9.BusStatus>(2, _omitFieldNames ? '' : 'busStatus', $pb.PbFieldType.OE, defaultOrMaker: $9.BusStatus.BUS_STATUS_UNSPECIFIED, valueOf: $9.BusStatus.valueOf, enumValues: $9.BusStatus.values)
    ..e<$9.BusType>(3, _omitFieldNames ? '' : 'busType', $pb.PbFieldType.OE, defaultOrMaker: $9.BusType.BUS_TYPE_UNSPECIFIED, valueOf: $9.BusType.valueOf, enumValues: $9.BusType.values)
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
  $9.BusStatus get busStatus => $_getN(1);
  @$pb.TagNumber(2)
  set busStatus($9.BusStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusStatus() => clearField(2);

  @$pb.TagNumber(3)
  $9.BusType get busType => $_getN(2);
  @$pb.TagNumber(3)
  set busType($9.BusType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBusType() => $_has(2);
  @$pb.TagNumber(3)
  void clearBusType() => clearField(3);
}

class ChangeBusStatusResponse extends $pb.GeneratedMessage {
  factory ChangeBusStatusResponse({
    $9.Bus? bus,
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
    ..aOM<$9.Bus>(1, _omitFieldNames ? '' : 'bus', subBuilder: $9.Bus.create)
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
  $9.Bus get bus => $_getN(0);
  @$pb.TagNumber(1)
  set bus($9.Bus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBus() => $_has(0);
  @$pb.TagNumber(1)
  void clearBus() => clearField(1);
  @$pb.TagNumber(1)
  $9.Bus ensureBus() => $_ensure(0);
}

/// Updated and newly defined messages for the adjusted RPCs
class SendLocationContinuousRequest extends $pb.GeneratedMessage {
  factory SendLocationContinuousRequest({
    $core.String? busId,
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    return $result;
  }
  SendLocationContinuousRequest._() : super();
  factory SendLocationContinuousRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendLocationContinuousRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendLocationContinuousRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendLocationContinuousRequest clone() => SendLocationContinuousRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendLocationContinuousRequest copyWith(void Function(SendLocationContinuousRequest) updates) => super.copyWith((message) => updates(message as SendLocationContinuousRequest)) as SendLocationContinuousRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendLocationContinuousRequest create() => SendLocationContinuousRequest._();
  SendLocationContinuousRequest createEmptyInstance() => create();
  static $pb.PbList<SendLocationContinuousRequest> createRepeated() => $pb.PbList<SendLocationContinuousRequest>();
  @$core.pragma('dart2js:noInline')
  static SendLocationContinuousRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendLocationContinuousRequest>(create);
  static SendLocationContinuousRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get latitude => $_getN(1);
  @$pb.TagNumber(2)
  set latitude($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get longitude => $_getN(2);
  @$pb.TagNumber(3)
  set longitude($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLongitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLongitude() => clearField(3);
}

class SendLocationContinuousResponse extends $pb.GeneratedMessage {
  factory SendLocationContinuousResponse() => create();
  SendLocationContinuousResponse._() : super();
  factory SendLocationContinuousResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendLocationContinuousResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendLocationContinuousResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendLocationContinuousResponse clone() => SendLocationContinuousResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendLocationContinuousResponse copyWith(void Function(SendLocationContinuousResponse) updates) => super.copyWith((message) => updates(message as SendLocationContinuousResponse)) as SendLocationContinuousResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendLocationContinuousResponse create() => SendLocationContinuousResponse._();
  SendLocationContinuousResponse createEmptyInstance() => create();
  static $pb.PbList<SendLocationContinuousResponse> createRepeated() => $pb.PbList<SendLocationContinuousResponse>();
  @$core.pragma('dart2js:noInline')
  static SendLocationContinuousResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendLocationContinuousResponse>(create);
  static SendLocationContinuousResponse? _defaultInstance;
}

class TrackBusContinuousRequest extends $pb.GeneratedMessage {
  factory TrackBusContinuousRequest({
    $core.String? busId,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    return $result;
  }
  TrackBusContinuousRequest._() : super();
  factory TrackBusContinuousRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrackBusContinuousRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrackBusContinuousRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrackBusContinuousRequest clone() => TrackBusContinuousRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrackBusContinuousRequest copyWith(void Function(TrackBusContinuousRequest) updates) => super.copyWith((message) => updates(message as TrackBusContinuousRequest)) as TrackBusContinuousRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrackBusContinuousRequest create() => TrackBusContinuousRequest._();
  TrackBusContinuousRequest createEmptyInstance() => create();
  static $pb.PbList<TrackBusContinuousRequest> createRepeated() => $pb.PbList<TrackBusContinuousRequest>();
  @$core.pragma('dart2js:noInline')
  static TrackBusContinuousRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrackBusContinuousRequest>(create);
  static TrackBusContinuousRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);
}

class TrackBusContinuousResponse extends $pb.GeneratedMessage {
  factory TrackBusContinuousResponse({
    $core.String? busId,
    $core.double? latitude,
    $core.double? longitude,
    $core.String? nextStationId,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    if (nextStationId != null) {
      $result.nextStationId = nextStationId;
    }
    return $result;
  }
  TrackBusContinuousResponse._() : super();
  factory TrackBusContinuousResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrackBusContinuousResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TrackBusContinuousResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOS(4, _omitFieldNames ? '' : 'nextStationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrackBusContinuousResponse clone() => TrackBusContinuousResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrackBusContinuousResponse copyWith(void Function(TrackBusContinuousResponse) updates) => super.copyWith((message) => updates(message as TrackBusContinuousResponse)) as TrackBusContinuousResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrackBusContinuousResponse create() => TrackBusContinuousResponse._();
  TrackBusContinuousResponse createEmptyInstance() => create();
  static $pb.PbList<TrackBusContinuousResponse> createRepeated() => $pb.PbList<TrackBusContinuousResponse>();
  @$core.pragma('dart2js:noInline')
  static TrackBusContinuousResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrackBusContinuousResponse>(create);
  static TrackBusContinuousResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get latitude => $_getN(1);
  @$pb.TagNumber(2)
  set latitude($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get longitude => $_getN(2);
  @$pb.TagNumber(3)
  set longitude($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLongitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLongitude() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nextStationId => $_getSZ(3);
  @$pb.TagNumber(4)
  set nextStationId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNextStationId() => $_has(3);
  @$pb.TagNumber(4)
  void clearNextStationId() => clearField(4);
}

class StreamBusVideoRequest extends $pb.GeneratedMessage {
  factory StreamBusVideoRequest({
    $core.String? busId,
    $9.BusType? busType,
    $9.VehicleEvent? vehicleEvent,
    $core.Iterable<$core.List<$core.int>>? videoChunk,
    $core.int? photoHeight,
    $core.int? photoWidth,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    if (busType != null) {
      $result.busType = busType;
    }
    if (vehicleEvent != null) {
      $result.vehicleEvent = vehicleEvent;
    }
    if (videoChunk != null) {
      $result.videoChunk.addAll(videoChunk);
    }
    if (photoHeight != null) {
      $result.photoHeight = photoHeight;
    }
    if (photoWidth != null) {
      $result.photoWidth = photoWidth;
    }
    return $result;
  }
  StreamBusVideoRequest._() : super();
  factory StreamBusVideoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamBusVideoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamBusVideoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..e<$9.BusType>(3, _omitFieldNames ? '' : 'busType', $pb.PbFieldType.OE, defaultOrMaker: $9.BusType.BUS_TYPE_UNSPECIFIED, valueOf: $9.BusType.valueOf, enumValues: $9.BusType.values)
    ..e<$9.VehicleEvent>(4, _omitFieldNames ? '' : 'vehicleEvent', $pb.PbFieldType.OE, defaultOrMaker: $9.VehicleEvent.VEHICLE_EVENT_UNSPECIFIED, valueOf: $9.VehicleEvent.valueOf, enumValues: $9.VehicleEvent.values)
    ..p<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'videoChunk', $pb.PbFieldType.PY)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'photoHeight', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'photoWidth', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamBusVideoRequest clone() => StreamBusVideoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamBusVideoRequest copyWith(void Function(StreamBusVideoRequest) updates) => super.copyWith((message) => updates(message as StreamBusVideoRequest)) as StreamBusVideoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamBusVideoRequest create() => StreamBusVideoRequest._();
  StreamBusVideoRequest createEmptyInstance() => create();
  static $pb.PbList<StreamBusVideoRequest> createRepeated() => $pb.PbList<StreamBusVideoRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamBusVideoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamBusVideoRequest>(create);
  static StreamBusVideoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);

  @$pb.TagNumber(3)
  $9.BusType get busType => $_getN(1);
  @$pb.TagNumber(3)
  set busType($9.BusType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBusType() => $_has(1);
  @$pb.TagNumber(3)
  void clearBusType() => clearField(3);

  @$pb.TagNumber(4)
  $9.VehicleEvent get vehicleEvent => $_getN(2);
  @$pb.TagNumber(4)
  set vehicleEvent($9.VehicleEvent v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasVehicleEvent() => $_has(2);
  @$pb.TagNumber(4)
  void clearVehicleEvent() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.List<$core.int>> get videoChunk => $_getList(3);

  @$pb.TagNumber(6)
  $core.int get photoHeight => $_getIZ(4);
  @$pb.TagNumber(6)
  set photoHeight($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasPhotoHeight() => $_has(4);
  @$pb.TagNumber(6)
  void clearPhotoHeight() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get photoWidth => $_getIZ(5);
  @$pb.TagNumber(7)
  set photoWidth($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasPhotoWidth() => $_has(5);
  @$pb.TagNumber(7)
  void clearPhotoWidth() => clearField(7);
}

class StreamBusVideoResponse extends $pb.GeneratedMessage {
  factory StreamBusVideoResponse({
    $core.bool? isDetected,
    $core.Iterable<$9.Child>? children,
  }) {
    final $result = create();
    if (isDetected != null) {
      $result.isDetected = isDetected;
    }
    if (children != null) {
      $result.children.addAll(children);
    }
    return $result;
  }
  StreamBusVideoResponse._() : super();
  factory StreamBusVideoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamBusVideoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamBusVideoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isDetected')
    ..pc<$9.Child>(2, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: $9.Child.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamBusVideoResponse clone() => StreamBusVideoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamBusVideoResponse copyWith(void Function(StreamBusVideoResponse) updates) => super.copyWith((message) => updates(message as StreamBusVideoResponse)) as StreamBusVideoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamBusVideoResponse create() => StreamBusVideoResponse._();
  StreamBusVideoResponse createEmptyInstance() => create();
  static $pb.PbList<StreamBusVideoResponse> createRepeated() => $pb.PbList<StreamBusVideoResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamBusVideoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamBusVideoResponse>(create);
  static StreamBusVideoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isDetected => $_getBF(0);
  @$pb.TagNumber(1)
  set isDetected($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsDetected() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsDetected() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$9.Child> get children => $_getList(1);
}

class UpdateBusRequest extends $pb.GeneratedMessage {
  factory UpdateBusRequest({
    $core.String? busId,
    $core.String? name,
    $core.String? plateNumber,
    $core.double? latitude,
    $core.double? longitude,
    $core.bool? enableFaceRecognition,
    $core.String? nextStationId,
    $10.FieldMask? updateMask,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (plateNumber != null) {
      $result.plateNumber = plateNumber;
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
    if (nextStationId != null) {
      $result.nextStationId = nextStationId;
    }
    if (updateMask != null) {
      $result.updateMask = updateMask;
    }
    return $result;
  }
  UpdateBusRequest._() : super();
  factory UpdateBusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateBusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'plateNumber')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOB(6, _omitFieldNames ? '' : 'enableFaceRecognition')
    ..aOS(9, _omitFieldNames ? '' : 'nextStationId')
    ..aOM<$10.FieldMask>(10, _omitFieldNames ? '' : 'updateMask', subBuilder: $10.FieldMask.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBusRequest clone() => UpdateBusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBusRequest copyWith(void Function(UpdateBusRequest) updates) => super.copyWith((message) => updates(message as UpdateBusRequest)) as UpdateBusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusRequest create() => UpdateBusRequest._();
  UpdateBusRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateBusRequest> createRepeated() => $pb.PbList<UpdateBusRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBusRequest>(create);
  static UpdateBusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);

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
  $core.double get latitude => $_getN(3);
  @$pb.TagNumber(4)
  set latitude($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLatitude() => $_has(3);
  @$pb.TagNumber(4)
  void clearLatitude() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get longitude => $_getN(4);
  @$pb.TagNumber(5)
  set longitude($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLongitude() => $_has(4);
  @$pb.TagNumber(5)
  void clearLongitude() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get enableFaceRecognition => $_getBF(5);
  @$pb.TagNumber(6)
  set enableFaceRecognition($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEnableFaceRecognition() => $_has(5);
  @$pb.TagNumber(6)
  void clearEnableFaceRecognition() => clearField(6);

  @$pb.TagNumber(9)
  $core.String get nextStationId => $_getSZ(6);
  @$pb.TagNumber(9)
  set nextStationId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(9)
  $core.bool hasNextStationId() => $_has(6);
  @$pb.TagNumber(9)
  void clearNextStationId() => clearField(9);

  @$pb.TagNumber(10)
  $10.FieldMask get updateMask => $_getN(7);
  @$pb.TagNumber(10)
  set updateMask($10.FieldMask v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasUpdateMask() => $_has(7);
  @$pb.TagNumber(10)
  void clearUpdateMask() => clearField(10);
  @$pb.TagNumber(10)
  $10.FieldMask ensureUpdateMask() => $_ensure(7);
}

class UpdateBusResponse extends $pb.GeneratedMessage {
  factory UpdateBusResponse({
    $9.Bus? bus,
  }) {
    final $result = create();
    if (bus != null) {
      $result.bus = bus;
    }
    return $result;
  }
  UpdateBusResponse._() : super();
  factory UpdateBusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateBusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$9.Bus>(1, _omitFieldNames ? '' : 'bus', subBuilder: $9.Bus.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBusResponse clone() => UpdateBusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBusResponse copyWith(void Function(UpdateBusResponse) updates) => super.copyWith((message) => updates(message as UpdateBusResponse)) as UpdateBusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusResponse create() => UpdateBusResponse._();
  UpdateBusResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateBusResponse> createRepeated() => $pb.PbList<UpdateBusResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBusResponse>(create);
  static UpdateBusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $9.Bus get bus => $_getN(0);
  @$pb.TagNumber(1)
  set bus($9.Bus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBus() => $_has(0);
  @$pb.TagNumber(1)
  void clearBus() => clearField(1);
  @$pb.TagNumber(1)
  $9.Bus ensureBus() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
