//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/station.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'resources.pb.dart' as $8;

class UpdateStationRequest extends $pb.GeneratedMessage {
  factory UpdateStationRequest({
    $core.String? guardianId,
    $core.double? longitude,
    $core.double? latitude,
  }) {
    final $result = create();
    if (guardianId != null) {
      $result.guardianId = guardianId;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    return $result;
  }
  UpdateStationRequest._() : super();
  factory UpdateStationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateStationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateStationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'guardianId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateStationRequest clone() => UpdateStationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateStationRequest copyWith(void Function(UpdateStationRequest) updates) => super.copyWith((message) => updates(message as UpdateStationRequest)) as UpdateStationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStationRequest create() => UpdateStationRequest._();
  UpdateStationRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStationRequest> createRepeated() => $pb.PbList<UpdateStationRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateStationRequest>(create);
  static UpdateStationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get guardianId => $_getSZ(0);
  @$pb.TagNumber(1)
  set guardianId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuardianId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuardianId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get longitude => $_getN(1);
  @$pb.TagNumber(2)
  set longitude($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get latitude => $_getN(2);
  @$pb.TagNumber(3)
  set latitude($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLatitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatitude() => clearField(3);
}

class UpdateStationResponse extends $pb.GeneratedMessage {
  factory UpdateStationResponse({
    $8.Station? station,
  }) {
    final $result = create();
    if (station != null) {
      $result.station = station;
    }
    return $result;
  }
  UpdateStationResponse._() : super();
  factory UpdateStationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateStationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateStationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$8.Station>(1, _omitFieldNames ? '' : 'station', subBuilder: $8.Station.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateStationResponse clone() => UpdateStationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateStationResponse copyWith(void Function(UpdateStationResponse) updates) => super.copyWith((message) => updates(message as UpdateStationResponse)) as UpdateStationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStationResponse create() => UpdateStationResponse._();
  UpdateStationResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateStationResponse> createRepeated() => $pb.PbList<UpdateStationResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateStationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateStationResponse>(create);
  static UpdateStationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $8.Station get station => $_getN(0);
  @$pb.TagNumber(1)
  set station($8.Station v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStation() => $_has(0);
  @$pb.TagNumber(1)
  void clearStation() => clearField(1);
  @$pb.TagNumber(1)
  $8.Station ensureStation() => $_ensure(0);
}

class GetStationListByBusIdRequest extends $pb.GeneratedMessage {
  factory GetStationListByBusIdRequest({
    $core.String? busId,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    return $result;
  }
  GetStationListByBusIdRequest._() : super();
  factory GetStationListByBusIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStationListByBusIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStationListByBusIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStationListByBusIdRequest clone() => GetStationListByBusIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStationListByBusIdRequest copyWith(void Function(GetStationListByBusIdRequest) updates) => super.copyWith((message) => updates(message as GetStationListByBusIdRequest)) as GetStationListByBusIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStationListByBusIdRequest create() => GetStationListByBusIdRequest._();
  GetStationListByBusIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetStationListByBusIdRequest> createRepeated() => $pb.PbList<GetStationListByBusIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStationListByBusIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStationListByBusIdRequest>(create);
  static GetStationListByBusIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);
}

class GetStationListByBusIdResponse extends $pb.GeneratedMessage {
  factory GetStationListByBusIdResponse({
    $core.Iterable<$8.Station>? stations,
    $core.Iterable<$8.GuardianResponse>? guardians,
    $core.Iterable<$8.Child>? children,
  }) {
    final $result = create();
    if (stations != null) {
      $result.stations.addAll(stations);
    }
    if (guardians != null) {
      $result.guardians.addAll(guardians);
    }
    if (children != null) {
      $result.children.addAll(children);
    }
    return $result;
  }
  GetStationListByBusIdResponse._() : super();
  factory GetStationListByBusIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStationListByBusIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStationListByBusIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<$8.Station>(1, _omitFieldNames ? '' : 'stations', $pb.PbFieldType.PM, subBuilder: $8.Station.create)
    ..pc<$8.GuardianResponse>(2, _omitFieldNames ? '' : 'guardians', $pb.PbFieldType.PM, subBuilder: $8.GuardianResponse.create)
    ..pc<$8.Child>(3, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: $8.Child.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStationListByBusIdResponse clone() => GetStationListByBusIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStationListByBusIdResponse copyWith(void Function(GetStationListByBusIdResponse) updates) => super.copyWith((message) => updates(message as GetStationListByBusIdResponse)) as GetStationListByBusIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStationListByBusIdResponse create() => GetStationListByBusIdResponse._();
  GetStationListByBusIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetStationListByBusIdResponse> createRepeated() => $pb.PbList<GetStationListByBusIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStationListByBusIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStationListByBusIdResponse>(create);
  static GetStationListByBusIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$8.Station> get stations => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$8.GuardianResponse> get guardians => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$8.Child> get children => $_getList(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
