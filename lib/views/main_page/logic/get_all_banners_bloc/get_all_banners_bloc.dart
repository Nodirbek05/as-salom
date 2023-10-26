import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:assalomproject/views/main_page/data/models/get_all_banners.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_all_banners_event.dart';
part 'get_all_banners_state.dart';

class GetAllBannersBloc extends Bloc<GetAllBannersEvent, GetAllBannersState> {
  GetAllBannersBloc() : super(GetAllBannersInitial()) {
    on<GetBannersDataEvent>(getBanners);
  }

  Future<void> getBanners(
      GetBannersDataEvent event, Emitter<GetAllBannersState> emit) async {
    emit(GetAllBannersInitial());
    final response = await CommonRequests.getBanners();
    if (response is GetAllBanners) {
      emit(GetAllBannersSucces(allBanners: response));
      print("GET ALL Banners SUCCESS ${response}");
    } else {
      emit(GetAllBannersFailed(errorMessage: response.toString()));
      print("GET ALL Banners ERROR");
    }
  }
}
