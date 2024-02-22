//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/bus_route.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'resources.pb.dart' as $9;
import 'resources.pbenum.dart' as $9;

class CreateBusRouteRequest extends $pb.GeneratedMessage {
  factory CreateBusRouteRequest({
    $core.String? busId,
    $9.BusType? busType,
    $core.Iterable<$core.String>? guardianIds,
  }) {
    final $result = create();
    if (busId != null) {
      $result.busId = busId;
    }
    if (busType != null) {
      $result.busType = busType;
    }
    if (guardianIds != null) {
      $result.guardianIds.addAll(guardianIds);
    }
    return $result;
  }
  CreateBusRouteRequest._() : super();
  factory CreateBusRouteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusRouteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusRouteRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..e<$9.BusType>(2, _omitFieldNames ? '' : 'busType', $pb.PbFieldType.OE, defaultOrMaker: $9.BusType.BUS_TYPE_UNSPECIFIED, valueOf: $9.BusType.valueOf, enumValues: $9.BusType.values)
    ..pPS(3, _omitFieldNames ? '' : 'guardianIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusRouteRequest clone() => CreateBusRouteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusRouteRequest copyWith(void Function(CreateBusRouteRequest) updates) => super.copyWith((message) => updates(message as CreateBusRouteRequest)) as CreateBusRouteRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusRouteRequest create() => CreateBusRouteRequest._();
  CreateBusRouteRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBusRouteRequest> createRepeated() => $pb.PbList<CreateBusRouteRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBusRouteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusRouteRequest>(create);
  static CreateBusRouteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);

  @$pb.TagNumber(2)
  $9.BusType get busType => $_getN(1);
  @$pb.TagNumber(2)
  set busType($9.BusType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusType() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get guardianIds => $_getList(2);
}

class CreateBusRouteResponse extends $pb.GeneratedMessage {
  factory CreateBusRouteResponse({
    $9.BusRoute? busRoute,
  }) {
    final $result = create();
    if (busRoute != null) {
      $result.busRoute = busRoute;
    }
    return $result;
  }
  CreateBusRouteResponse._() : super();
  factory CreateBusRouteResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusRouteResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateBusRouteResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$9.BusRoute>(1, _omitFieldNames ? '' : 'busRoute', subBuilder: $9.BusRoute.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusRouteResponse clone() => CreateBusRouteResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusRouteResponse copyWith(void Function(CreateBusRouteResponse) updates) => super.copyWith((message) => updates(message as CreateBusRouteResponse)) as CreateBusRouteResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusRouteResponse create() => CreateBusRouteResponse._();
  CreateBusRouteResponse createEmptyInstance() => create();
  static $pb.PbList<CreateBusRouteResponse> createRepeated() => $pb.PbList<CreateBusRouteResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateBusRouteResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusRouteResponse>(create);
  static CreateBusRouteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $9.BusRoute get busRoute => $_getN(0);
  @$pb.TagNumber(1)
  set busRoute($9.BusRoute v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusRoute() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusRoute() => clearField(1);
  @$pb.TagNumber(1)
  $9.BusRoute ensureBusRoute() => $_ensure(0);
}

class GetBusRouteRequest extends $pb.GeneratedMessage {
  factory GetBusRouteRequest({
    $core.String? busId,
    $9.BusType? busType,
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
  GetBusRouteRequest._() : super();
  factory GetBusRouteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusRouteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusRouteRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'busId')
    ..e<$9.BusType>(2, _omitFieldNames ? '' : 'busType', $pb.PbFieldType.OE, defaultOrMaker: $9.BusType.BUS_TYPE_UNSPECIFIED, valueOf: $9.BusType.valueOf, enumValues: $9.BusType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusRouteRequest clone() => GetBusRouteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusRouteRequest copyWith(void Function(GetBusRouteRequest) updates) => super.copyWith((message) => updates(message as GetBusRouteRequest)) as GetBusRouteRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusRouteRequest create() => GetBusRouteRequest._();
  GetBusRouteRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusRouteRequest> createRepeated() => $pb.PbList<GetBusRouteRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusRouteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusRouteRequest>(create);
  static GetBusRouteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get busId => $_getSZ(0);
  @$pb.TagNumber(1)
  set busId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => clearField(1);

  @$pb.TagNumber(2)
  $9.BusType get busType => $_getN(1);
  @$pb.TagNumber(2)
  set busType($9.BusType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusType() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusType() => clearField(2);
}

class GetBusRouteResponse extends $pb.GeneratedMessage {
  factory GetBusRouteResponse({
    $9.BusRoute? busRoute,
  }) {
    final $result = create();
    if (busRoute != null) {
      $result.busRoute = busRoute;
    }
    return $result;
  }
  GetBusRouteResponse._() : super();
  factory GetBusRouteResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusRouteResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusRouteResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'where_child_bus.v1'), createEmptyInstance: create)
    ..aOM<$9.BusRoute>(1, _omitFieldNames ? '' : 'busRoute', subBuilder: $9.BusRoute.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusRouteResponse clone() => GetBusRouteResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusRouteResponse copyWith(void Function(GetBusRouteResponse) updates) => super.copyWith((message) => updates(message as GetBusRouteResponse)) as GetBusRouteResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusRouteResponse create() => GetBusRouteResponse._();
  GetBusRouteResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusRouteResponse> createRepeated() => $pb.PbList<GetBusRouteResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusRouteResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusRouteResponse>(create);
  static GetBusRouteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $9.BusRoute get busRoute => $_getN(0);
  @$pb.TagNumber(1)
  set busRoute($9.BusRoute v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusRoute() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusRoute() => clearField(1);
  @$pb.TagNumber(1)
  $9.BusRoute ensureBusRoute() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
