part of 'get_location_to_map_bloc.dart';

sealed class GetLocationToMapState extends Equatable {
  const GetLocationToMapState();

  @override
  List<Object> get props => [];
}

final class GetLocationToMapLoading extends GetLocationToMapState {}

final class GetLocationToMapSuccess extends GetLocationToMapState {
  final Map<String, dynamic> locationData;
  const GetLocationToMapSuccess(this.locationData);
  @override
  List<Object> get props => [locationData];
}

final class GetLocationToMapError extends GetLocationToMapState {
  final String errorMessage;
  const GetLocationToMapError({required this.errorMessage});
 
}
