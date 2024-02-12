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

import 'resources.pb.dart' as $6;

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
    $core.Iterable<$6.Bus>? buses,
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
    ..pc<$6.Bus>(1, _omitFieldNames ? '' : 'buses', $pb.PbFieldType.PM, subBuilder: $6.Bus.create)
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
  $core.List<$6.Bus> get buses => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
