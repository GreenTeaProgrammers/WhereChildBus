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

class BusType extends $pb.ProtobufEnum {
  static const BusType BUS_TYPE_UNSPECIFIED = BusType._(0, _omitEnumNames ? '' : 'BUS_TYPE_UNSPECIFIED');
  static const BusType BUS_TYPE_MORNING = BusType._(1, _omitEnumNames ? '' : 'BUS_TYPE_MORNING');
  static const BusType BUS_TYPE_EVENING = BusType._(2, _omitEnumNames ? '' : 'BUS_TYPE_EVENING');

  static const $core.List<BusType> values = <BusType> [
    BUS_TYPE_UNSPECIFIED,
    BUS_TYPE_MORNING,
    BUS_TYPE_EVENING,
  ];

  static final $core.Map<$core.int, BusType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BusType? valueOf($core.int value) => _byValue[value];

  const BusType._($core.int v, $core.String n) : super(v, n);
}

class VideoType extends $pb.ProtobufEnum {
  static const VideoType VIDEO_TYPE_UNSPECIFIED = VideoType._(0, _omitEnumNames ? '' : 'VIDEO_TYPE_UNSPECIFIED');
  static const VideoType VIDEO_TYPE_GET_ON = VideoType._(1, _omitEnumNames ? '' : 'VIDEO_TYPE_GET_ON');
  static const VideoType VIDEO_TYPE_GET_OFF = VideoType._(2, _omitEnumNames ? '' : 'VIDEO_TYPE_GET_OFF');

  static const $core.List<VideoType> values = <VideoType> [
    VIDEO_TYPE_UNSPECIFIED,
    VIDEO_TYPE_GET_ON,
    VIDEO_TYPE_GET_OFF,
  ];

  static final $core.Map<$core.int, VideoType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VideoType? valueOf($core.int value) => _byValue[value];

  const VideoType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
