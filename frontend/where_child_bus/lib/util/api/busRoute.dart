import 'package:grpc/grpc.dart';
import 'package:where_child_bus/config/config.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/bus_route.pbgrpc.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/resources.pb.dart';

Future<CreateBusRouteResponse> createMorningBusRoute(
    Bus bus,
    String nurseryId,
    Iterable<String> morningGuardianIds,
    Iterable<String> eveningGuardianIds) async {
  try {
    final channel = ClientChannel(
      appConfig.grpcEndpoint,
      port: appConfig.grpcPort,
    );

    final grpcClient = BusRouteServiceClient(channel);

    var req = CreateBusRouteRequest(
      busId: bus.id,
      busType: BusType.BUS_TYPE_MORNING,
      nurseryId: nurseryId,
      guardianIds: morningGuardianIds,
    );

    var res = await grpcClient.createBusRoute(req);
    return res;
  } catch (error) {
    return Future.error(error);
  }
}

Future<CreateBusRouteResponse> createEveningBusRoute(
    Bus bus,
    String nurseryId,
    Iterable<String> morningGuardianIds,
    Iterable<String> eveningGuardianIds) async {
  try {
    final channel = ClientChannel(
      appConfig.grpcEndpoint,
      port: appConfig.grpcPort,
    );

    final grpcClient = BusRouteServiceClient(channel);

    var req = CreateBusRouteRequest(
      busId: bus.id,
      busType: BusType.BUS_TYPE_EVENING,
      nurseryId: nurseryId,
      guardianIds: morningGuardianIds,
    );

    var res = await grpcClient.createBusRoute(req);
    return res;
  } catch (error) {
    return Future.error(error);
  }
}

Future<GetBusRouteByBusIDResponse> getBusRouteByBusId(
    String busId, BusType busType) async {
  final channel = ClientChannel(
    appConfig.grpcEndpoint,
    port: appConfig.grpcPort,
  );

  final grpcClient = BusRouteServiceClient(channel);

  var req = GetBusRouteByBusIDRequest(
    busId: busId,
    busType: busType,
  );

  var res = await grpcClient.getBusRouteByBusID(req);
  return res;
}
