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

import '../../google/protobuf/field_mask.pb.dart' as $9;
import 'resources.pb.dart' as $8;
import 'resources.pbenum.dart' as $8;

class UpdateStationLocationByGuardianIdRequest extends $pb.GeneratedMessage {
  factory UpdateStationLocationByGuardianIdRequest({
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
  UpdateStationLocationByGuardianIdRequest._() : super();
  factory UpdateStationLocationByGuardianIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateStationLocationByGuardianIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateStationLocationByGuardianIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'guardianId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateStationLocationByGuardianIdRequest clone() => UpdateStationLocationByGuardianIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateStationLocationByGuardianIdRequest copyWith(void Function(UpdateStationLocationByGuardianIdRequest) updates) => super.copyWith((message) => updates(message as UpdateStationLocationByGuardianIdRequest)) as UpdateStationLocationByGuardianIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStationLocationByGuardianIdRequest create() => UpdateStationLocationByGuardianIdRequest._();
  UpdateStationLocationByGuardianIdRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStationLocationByGuardianIdRequest> createRepeated() => $pb.PbList<UpdateStationLocationByGuardianIdRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStationLocationByGuardianIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateStationLocationByGuardianIdRequest>(create);
  static UpdateStationLocationByGuardianIdRequest? _defaultInstance;

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

class UpdateStationLocationByGuardianIdResponse extends $pb.GeneratedMessage {
  factory UpdateStationLocationByGuardianIdResponse({
    $8.Station? station,
  }) {
    final $result = create();
    if (station != null) {
      $result.station = station;
    }
    return $result;
  }
  UpdateStationLocationByGuardianIdResponse._() : super();
  factory UpdateStationLocationByGuardianIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateStationLocationByGuardianIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateStationLocationByGuardianIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$8.Station>(1, _omitFieldNames ? '' : 'station', subBuilder: $8.Station.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateStationLocationByGuardianIdResponse clone() => UpdateStationLocationByGuardianIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateStationLocationByGuardianIdResponse copyWith(void Function(UpdateStationLocationByGuardianIdResponse) updates) => super.copyWith((message) => updates(message as UpdateStationLocationByGuardianIdResponse)) as UpdateStationLocationByGuardianIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStationLocationByGuardianIdResponse create() => UpdateStationLocationByGuardianIdResponse._();
  UpdateStationLocationByGuardianIdResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateStationLocationByGuardianIdResponse> createRepeated() => $pb.PbList<UpdateStationLocationByGuardianIdResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateStationLocationByGuardianIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateStationLocationByGuardianIdResponse>(create);
  static UpdateStationLocationByGuardianIdResponse? _defaultInstance;

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
    $core.Iterable<$8.ChildPhoto>? photos,
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
    if (photos != null) {
      $result.photos.addAll(photos);
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
    ..pc<$8.ChildPhoto>(4, _omitFieldNames ? '' : 'photos', $pb.PbFieldType.PM, subBuilder: $8.ChildPhoto.create)
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

  @$pb.TagNumber(4)
  $core.List<$8.ChildPhoto> get photos => $_getList(3);
}

class GetUnregisteredStationListRequest extends $pb.GeneratedMessage {
  factory GetUnregisteredStationListRequest({
    $core.String? busId,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    return $result;
  }
  GetUnregisteredStationListRequest._() : super();
  factory GetUnregisteredStationListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUnregisteredStationListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUnregisteredStationListRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUnregisteredStationListRequest clone() => GetUnregisteredStationListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUnregisteredStationListRequest copyWith(void Function(GetUnregisteredStationListRequest) updates) => super.copyWith((message) => updates(message as GetUnregisteredStationListRequest)) as GetUnregisteredStationListRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUnregisteredStationListRequest create() => GetUnregisteredStationListRequest._();
  GetUnregisteredStationListRequest createEmptyInstance() => create();
  static $pb.PbList<GetUnregisteredStationListRequest> createRepeated() => $pb.PbList<GetUnregisteredStationListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUnregisteredStationListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUnregisteredStationListRequest>(create);
  static GetUnregisteredStationListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);
}

class GetUnregisteredStationListResponse extends $pb.GeneratedMessage {
  factory GetUnregisteredStationListResponse({
    $core.Iterable<$8.Station>? stations,
    $core.Iterable<$8.GuardianResponse>? guardians,
  }) {
    final $result = create();
    if (stations != null) {
      $result.stations.addAll(stations);
    }
    if (guardians != null) {
      $result.guardians.addAll(guardians);
    }
    return $result;
  }
  GetUnregisteredStationListResponse._() : super();
  factory GetUnregisteredStationListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUnregisteredStationListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUnregisteredStationListResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..pc<$8.Station>(1, _omitFieldNames ? '' : 'stations', $pb.PbFieldType.PM, subBuilder: $8.Station.create)
    ..pc<$8.GuardianResponse>(2, _omitFieldNames ? '' : 'guardians', $pb.PbFieldType.PM, subBuilder: $8.GuardianResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUnregisteredStationListResponse clone() => GetUnregisteredStationListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUnregisteredStationListResponse copyWith(void Function(GetUnregisteredStationListResponse) updates) => super.copyWith((message) => updates(message as GetUnregisteredStationListResponse)) as GetUnregisteredStationListResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUnregisteredStationListResponse create() => GetUnregisteredStationListResponse._();
  GetUnregisteredStationListResponse createEmptyInstance() => create();
  static $pb.PbList<GetUnregisteredStationListResponse> createRepeated() => $pb.PbList<GetUnregisteredStationListResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUnregisteredStationListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUnregisteredStationListResponse>(create);
  static GetUnregisteredStationListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$8.Station> get stations => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$8.GuardianResponse> get guardians => $_getList(1);
}

class GetCorrectOrderStationListByBusIdRequest extends $pb.GeneratedMessage {
  factory GetCorrectOrderStationListByBusIdRequest({
    $core.String? busId,
    $8.BusType? busType,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    if (busType != null) {
      $result.busType = busType;
    }
    return $result;
  }
  GetCorrectOrderStationListByBusIdRequest._() : super();
  factory GetCorrectOrderStationListByBusIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCorrectOrderStationListByBusIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCorrectOrderStationListByBusIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..e<$8.BusType>(2, _omitFieldNames ? '' : 'busType', $pb.PbFieldType.OE, defaultOrMaker: $8.BusType.BUS_TYPE_UNSPECIFIED, valueOf: $8.BusType.valueOf, enumValues: $8.BusType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCorrectOrderStationListByBusIdRequest clone() => GetCorrectOrderStationListByBusIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCorrectOrderStationListByBusIdRequest copyWith(void Function(GetCorrectOrderStationListByBusIdRequest) updates) => super.copyWith((message) => updates(message as GetCorrectOrderStationListByBusIdRequest)) as GetCorrectOrderStationListByBusIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCorrectOrderStationListByBusIdRequest create() => GetCorrectOrderStationListByBusIdRequest._();
  GetCorrectOrderStationListByBusIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetCorrectOrderStationListByBusIdRequest> createRepeated() => $pb.PbList<GetCorrectOrderStationListByBusIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCorrectOrderStationListByBusIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCorrectOrderStationListByBusIdRequest>(create);
  static GetCorrectOrderStationListByBusIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);

  @$pb.TagNumber(2)
  $8.BusType get busType => $_getN(1);
  @$pb.TagNumber(2)
  set busType($8.BusType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusType() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusType() => clearField(2);
}

class GetCorrectOrderStationListByBusIdResponse extends $pb.GeneratedMessage {
  factory GetCorrectOrderStationListByBusIdResponse({
    $8.BusRoute? busRoute,
  }) {
    final $result = create();
    if (busRoute != null) {
      $result.busRoute = busRoute;
    }
    return $result;
  }
  GetCorrectOrderStationListByBusIdResponse._() : super();
  factory GetCorrectOrderStationListByBusIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCorrectOrderStationListByBusIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCorrectOrderStationListByBusIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$8.BusRoute>(1, _omitFieldNames ? '' : 'busRoute', subBuilder: $8.BusRoute.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCorrectOrderStationListByBusIdResponse clone() => GetCorrectOrderStationListByBusIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCorrectOrderStationListByBusIdResponse copyWith(void Function(GetCorrectOrderStationListByBusIdResponse) updates) => super.copyWith((message) => updates(message as GetCorrectOrderStationListByBusIdResponse)) as GetCorrectOrderStationListByBusIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCorrectOrderStationListByBusIdResponse create() => GetCorrectOrderStationListByBusIdResponse._();
  GetCorrectOrderStationListByBusIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetCorrectOrderStationListByBusIdResponse> createRepeated() => $pb.PbList<GetCorrectOrderStationListByBusIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCorrectOrderStationListByBusIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCorrectOrderStationListByBusIdResponse>(create);
  static GetCorrectOrderStationListByBusIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $8.BusRoute get busRoute => $_getN(0);
  @$pb.TagNumber(1)
  set busRoute($8.BusRoute v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusRoute() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusRoute() => clearField(1);
  @$pb.TagNumber(1)
  $8.BusRoute ensureBusRoute() => $_ensure(0);
}

class UpdateStationRequest extends $pb.GeneratedMessage {
  factory UpdateStationRequest({
    $core.String? id,
    $core.String? busId,
    $core.double? latitude,
    $core.double? longitude,
    $9.FieldMask? updateMask,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (busId != null) {
      $result.busId = busId;
    }
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    if (updateMask != null) {
      $result.updateMask = updateMask;
    }
    return $result;
  }
  UpdateStationRequest._() : super();
  factory UpdateStationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateStationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateStationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'busId')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOM<$9.FieldMask>(5, _omitFieldNames ? '' : 'updateMask', subBuilder: $9.FieldMask.create)
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
  $core.double get latitude => $_getN(2);
  @$pb.TagNumber(3)
  set latitude($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLatitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatitude() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get longitude => $_getN(3);
  @$pb.TagNumber(4)
  set longitude($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLongitude() => $_has(3);
  @$pb.TagNumber(4)
  void clearLongitude() => clearField(4);

  @$pb.TagNumber(5)
  $9.FieldMask get updateMask => $_getN(4);
  @$pb.TagNumber(5)
  set updateMask($9.FieldMask v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdateMask() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateMask() => clearField(5);
  @$pb.TagNumber(5)
  $9.FieldMask ensureUpdateMask() => $_ensure(4);
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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
