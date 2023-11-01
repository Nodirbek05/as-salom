import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:assalomproject/views/main_page/data/models/get_sub_banner.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_sub_banners_event.dart';
part 'get_sub_banners_state.dart';

class GetSubBannersBloc extends Bloc<GetSubBannersEvent, GetSubBannersState> {
  GetSubBannersBloc() : super(GetSubBannersInitial()) {
    on<GetSubBannersEventData>(getSubBanners);
  }

  Future<void> getSubBanners(
      GetSubBannersEventData event, Emitter<GetSubBannersState> emit) async {
    emit(GetSubBannersInitial());
    final response = await CommonRequests.getSubBanners();
    if (response is GetSubBannersModel) {
      emit(GetSubBannersSuccess(subBanners: response));
      print("GET ALL SUBBanners SUCCESS ${response}");
    } else {
      emit(GetSubBannersFail(errorMessage: response.toString()));
      print("GET ALL SUBBanners ERROR");
    }
  }
}
