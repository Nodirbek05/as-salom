part of 'get_zone_bloc.dart';

sealed class GetZoneState extends Equatable {
  const GetZoneState();

  @override
  List<Object> get props => [];
}

final class GetZoneInitial extends GetZoneState {}

class GetZoneFailure extends GetZoneState {
  final String message;
  const GetZoneFailure({
    required this.message,
  });
}

class GetZoneSuccess extends GetZoneState {
  final ZoneModels zoneModels;
  const GetZoneSuccess({
    required this.zoneModels,
  });
}
