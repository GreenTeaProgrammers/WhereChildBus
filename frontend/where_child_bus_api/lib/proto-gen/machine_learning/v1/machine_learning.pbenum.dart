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

class Status extends $pb.ProtobufEnum {
  static const Status STATUS_UNSPECIFIED = Status._(0, _omitEnumNames ? '' : 'STATUS_UNSPECIFIED');
  static const Status STATUS_SUCCESS = Status._(1, _omitEnumNames ? '' : 'STATUS_SUCCESS');
  static const Status STATUS_PROCESSING = Status._(2, _omitEnumNames ? '' : 'STATUS_PROCESSING');
  static const Status STATUS_FAILED = Status._(3, _omitEnumNames ? '' : 'STATUS_FAILED');
  static const Status STATUS_WAITING = Status._(4, _omitEnumNames ? '' : 'STATUS_WAITING');

  static const $core.List<Status> values = <Status> [
    STATUS_UNSPECIFIED,
    STATUS_SUCCESS,
    STATUS_PROCESSING,
    STATUS_FAILED,
    STATUS_WAITING,
  ];

  static final $core.Map<$core.int, Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Status? valueOf($core.int value) => _byValue[value];

  const Status._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
