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

class BusStatus extends $pb.ProtobufEnum {
  static const BusStatus BUS_STATUS_UNSPECIFIED = BusStatus._(0, _omitEnumNames ? '' : 'BUS_STATUS_UNSPECIFIED');
  static const BusStatus BUS_STATUS_STOPPED = BusStatus._(1, _omitEnumNames ? '' : 'BUS_STATUS_STOPPED');
  static const BusStatus BUS_STATUS_RUNNING = BusStatus._(2, _omitEnumNames ? '' : 'BUS_STATUS_RUNNING');
  static const BusStatus BUS_STATUS_MAINTENANCE = BusStatus._(3, _omitEnumNames ? '' : 'BUS_STATUS_MAINTENANCE');

  static const $core.List<BusStatus> values = <BusStatus> [
    BUS_STATUS_UNSPECIFIED,
    BUS_STATUS_STOPPED,
    BUS_STATUS_RUNNING,
    BUS_STATUS_MAINTENANCE,
  ];

  static final $core.Map<$core.int, BusStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BusStatus? valueOf($core.int value) => _byValue[value];

  const BusStatus._($core.int v, $core.String n) : super(v, n);
}

class VehicleEvent extends $pb.ProtobufEnum {
  static const VehicleEvent VEHICLE_EVENT_UNSPECIFIED = VehicleEvent._(0, _omitEnumNames ? '' : 'VEHICLE_EVENT_UNSPECIFIED');
  static const VehicleEvent VEHICLE_EVENT_GET_ON = VehicleEvent._(1, _omitEnumNames ? '' : 'VEHICLE_EVENT_GET_ON');
  static const VehicleEvent VEHICLE_EVENT_GET_OFF = VehicleEvent._(2, _omitEnumNames ? '' : 'VEHICLE_EVENT_GET_OFF');

  static const $core.List<VehicleEvent> values = <VehicleEvent> [
    VEHICLE_EVENT_UNSPECIFIED,
    VEHICLE_EVENT_GET_ON,
    VEHICLE_EVENT_GET_OFF,
  ];

  static final $core.Map<$core.int, VehicleEvent> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VehicleEvent? valueOf($core.int value) => _byValue[value];

  const VehicleEvent._($core.int v, $core.String n) : super(v, n);
}

class Sex extends $pb.ProtobufEnum {
  static const Sex SEX_UNSPECIFIED = Sex._(0, _omitEnumNames ? '' : 'SEX_UNSPECIFIED');
  static const Sex SEX_MAN = Sex._(1, _omitEnumNames ? '' : 'SEX_MAN');
  static const Sex SEX_WOMAN = Sex._(2, _omitEnumNames ? '' : 'SEX_WOMAN');
  static const Sex SEX_OTHER = Sex._(3, _omitEnumNames ? '' : 'SEX_OTHER');

  static const $core.List<Sex> values = <Sex> [
    SEX_UNSPECIFIED,
    SEX_MAN,
    SEX_WOMAN,
    SEX_OTHER,
  ];

  static final $core.Map<$core.int, Sex> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Sex? valueOf($core.int value) => _byValue[value];

  const Sex._($core.int v, $core.String n) : super(v, n);
}

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


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
