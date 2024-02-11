//
//  Generated code. Do not modify.
//  source: where_child_bus/v1/resources.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Bus_Status extends $pb.ProtobufEnum {
  static const Bus_Status STATUS_UNSPECIFIED = Bus_Status._(0, _omitEnumNames ? '' : 'STATUS_UNSPECIFIED');
  static const Bus_Status STATUS_STOPPED = Bus_Status._(1, _omitEnumNames ? '' : 'STATUS_STOPPED');
  static const Bus_Status STATUS_RUNNING = Bus_Status._(2, _omitEnumNames ? '' : 'STATUS_RUNNING');
  static const Bus_Status STATUS_MAINTEINANCE = Bus_Status._(3, _omitEnumNames ? '' : 'STATUS_MAINTEINANCE');

  static const $core.List<Bus_Status> values = <Bus_Status> [
    STATUS_UNSPECIFIED,
    STATUS_STOPPED,
    STATUS_RUNNING,
    STATUS_MAINTEINANCE,
  ];

  static final $core.Map<$core.int, Bus_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Bus_Status? valueOf($core.int value) => _byValue[value];

  const Bus_Status._($core.int v, $core.String n) : super(v, n);
}

class Child_Sex extends $pb.ProtobufEnum {
  static const Child_Sex SEX_UNSPECIFIED = Child_Sex._(0, _omitEnumNames ? '' : 'SEX_UNSPECIFIED');
  static const Child_Sex SEX_MAN = Child_Sex._(1, _omitEnumNames ? '' : 'SEX_MAN');
  static const Child_Sex SEX_WOMEN = Child_Sex._(2, _omitEnumNames ? '' : 'SEX_WOMEN');
  static const Child_Sex SEX_OTHER = Child_Sex._(3, _omitEnumNames ? '' : 'SEX_OTHER');

  static const $core.List<Child_Sex> values = <Child_Sex> [
    SEX_UNSPECIFIED,
    SEX_MAN,
    SEX_WOMEN,
    SEX_OTHER,
  ];

  static final $core.Map<$core.int, Child_Sex> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Child_Sex? valueOf($core.int value) => _byValue[value];

  const Child_Sex._($core.int v, $core.String n) : super(v, n);
}

class ChildBusAssociation_BusType extends $pb.ProtobufEnum {
  static const ChildBusAssociation_BusType BUS_TYPE_UNSPECIFIED = ChildBusAssociation_BusType._(0, _omitEnumNames ? '' : 'BUS_TYPE_UNSPECIFIED');
  static const ChildBusAssociation_BusType BUS_TYPE_MORNING = ChildBusAssociation_BusType._(1, _omitEnumNames ? '' : 'BUS_TYPE_MORNING');
  static const ChildBusAssociation_BusType BUS_TYPE_EVENING = ChildBusAssociation_BusType._(2, _omitEnumNames ? '' : 'BUS_TYPE_EVENING');

  static const $core.List<ChildBusAssociation_BusType> values = <ChildBusAssociation_BusType> [
    BUS_TYPE_UNSPECIFIED,
    BUS_TYPE_MORNING,
    BUS_TYPE_EVENING,
  ];

  static final $core.Map<$core.int, ChildBusAssociation_BusType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChildBusAssociation_BusType? valueOf($core.int value) => _byValue[value];

  const ChildBusAssociation_BusType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
