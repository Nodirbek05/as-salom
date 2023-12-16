part of 'get_location_to_map_bloc.dart';

sealed class GetLocationToMapEvent extends Equatable {
  const GetLocationToMapEvent();

  @override
  List<Object> get props => [];
}

class TryToGetLocationToMapEvent extends GetLocationToMapEvent {
  const TryToGetLocationToMapEvent(this.coordinates);
  final Map<String, double> coordinates;
  @override
  List<Object> get props => [coordinates];
}
