import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/profile/data/api/user_requests.dart';
import 'package:assalomproject/views/profile/data/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_user_profile_event.dart';
part 'get_user_profile_state.dart';

class GetUserProfileBloc
    extends Bloc<GetUserProfileEvent, GetUserProfileState> {
  GetUserProfileBloc() : super(GetUserProfileInitial()) {
    on<GetProfileEvent>(userProfile);
  }

  Future<void> userProfile(
      GetProfileEvent event, Emitter<GetUserProfileState> emit) async {
    emit(GetUserProfileInitial());
    final response = await UserRequests.getProfile();
    if (response is ProfileModel) {
      emit(GetUserProfileSuccess(profilData: response));
    } else if (response is ErrorModel) {
      emit(GetUserProfileFail(errorData: response));
    }
  }
}
