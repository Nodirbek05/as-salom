import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/confirm_order/data_state_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'get_location_to_map_event.dart';
part 'get_location_to_map_state.dart';

class GetLocationToMapBloc
    extends Bloc<GetLocationToMapEvent, GetLocationToMapState> {
 
  GetLocationToMapBloc()
      : super(GetLocationToMapLoading()) {
    on<TryToGetLocationToMapEvent>(onGetLocationToMap);
  }

  void onGetLocationToMap(TryToGetLocationToMapEvent event,
      Emitter<GetLocationToMapState> emit) async {
    emit(GetLocationToMapLoading());

    DataState? dataState;

    if (dataState is SuccessfulResponse) {
      Map<String, dynamic> locationData = {
        'lat': event.coordinates['lat'] ?? 61.0,
        'lon': event.coordinates['lon'] ?? 41.0,
      };

      emit(GetLocationToMapSuccess(locationData));
    } else if (dataState is ErrorModel) {
      emit(const GetLocationToMapError(errorMessage: ""));
    }
  }
}
