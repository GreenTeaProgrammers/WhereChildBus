//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/child_photo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

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

class ChildPhotoServiceApi {
  $pb.RpcClient _client;
  ChildPhotoServiceApi(this._client);

  $async.Future<DeleteChildPhotoResponse> deleteChildPhoto($pb.ClientContext? ctx, DeleteChildPhotoRequest request) =>
    _client.invoke<DeleteChildPhotoResponse>(ctx, 'ChildPhotoService', 'DeleteChildPhoto', request, DeleteChildPhotoResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
