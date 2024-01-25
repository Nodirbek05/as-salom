import 'package:assalomproject/core/common_models/zone_models.dart';
import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_zone_event.dart';
part 'get_zone_state.dart';

class GetZoneBloc extends Bloc<GetZoneEvent, GetZoneState> {
  GetZoneBloc() : super(GetZoneInitial()) {
    on<GetZoneData>(getZone);
  }

  Future<void> getZone(GetZoneData event, Emitter<GetZoneState> emit) async {
    emit(GetZoneInitial());
    final response = await CommonRequests.getZone();
    if (response is ZoneModels) {
      emit(GetZoneSuccess(zoneModels: response));
      // print("Zone Came truly");
    }
  }
}
