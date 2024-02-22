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

class status extends $pb.ProtobufEnum {
  static const status SUCCESS = status._(0, _omitEnumNames ? '' : 'SUCCESS');
  static const status PROCESSING = status._(1, _omitEnumNames ? '' : 'PROCESSING');
  static const status FAILED = status._(2, _omitEnumNames ? '' : 'FAILED');
  static const status WAITING = status._(3, _omitEnumNames ? '' : 'WAITING');

  static const $core.List<status> values = <status> [
    SUCCESS,
    PROCESSING,
    FAILED,
    WAITING,
  ];

  static final $core.Map<$core.int, status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static status? valueOf($core.int value) => _byValue[value];

  const status._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
