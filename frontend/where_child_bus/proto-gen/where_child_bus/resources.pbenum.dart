//
//  Generated code. Do not modify.
//  source: where_child_bus/resources.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class bus_Status extends $pb.ProtobufEnum {
  static const bus_Status STOPPED = bus_Status._(0, _omitEnumNames ? '' : 'STOPPED');
  static const bus_Status RUNNING = bus_Status._(1, _omitEnumNames ? '' : 'RUNNING');
  static const bus_Status MAINTEINANCE = bus_Status._(2, _omitEnumNames ? '' : 'MAINTEINANCE');

  static const $core.List<bus_Status> values = <bus_Status> [
    STOPPED,
    RUNNING,
    MAINTEINANCE,
  ];

  static final $core.Map<$core.int, bus_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static bus_Status? valueOf($core.int value) => _byValue[value];

  const bus_Status._($core.int v, $core.String n) : super(v, n);
}

class Child_Sex extends $pb.ProtobufEnum {
  static const Child_Sex MAN = Child_Sex._(0, _omitEnumNames ? '' : 'MAN');
  static const Child_Sex WOMEN = Child_Sex._(1, _omitEnumNames ? '' : 'WOMEN');
  static const Child_Sex OTHER = Child_Sex._(2, _omitEnumNames ? '' : 'OTHER');

  static const $core.List<Child_Sex> values = <Child_Sex> [
    MAN,
    WOMEN,
    OTHER,
  ];

  static final $core.Map<$core.int, Child_Sex> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Child_Sex? valueOf($core.int value) => _byValue[value];

  const Child_Sex._($core.int v, $core.String n) : super(v, n);
}

class ChildBusAssociation_BusType extends $pb.ProtobufEnum {
  static const ChildBusAssociation_BusType MORNING = ChildBusAssociation_BusType._(0, _omitEnumNames ? '' : 'MORNING');
  static const ChildBusAssociation_BusType AFTERNOON = ChildBusAssociation_BusType._(1, _omitEnumNames ? '' : 'AFTERNOON');

  static const $core.List<ChildBusAssociation_BusType> values = <ChildBusAssociation_BusType> [
    MORNING,
    AFTERNOON,
  ];

  static final $core.Map<$core.int, ChildBusAssociation_BusType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChildBusAssociation_BusType? valueOf($core.int value) => _byValue[value];

  const ChildBusAssociation_BusType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
