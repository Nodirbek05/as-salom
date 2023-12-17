part of 'get_zone_bloc.dart';

sealed class GetZoneEvent extends Equatable {
  const GetZoneEvent();

  @override
  List<Object> get props => [];
}
class GetZoneData extends GetZoneEvent {}
