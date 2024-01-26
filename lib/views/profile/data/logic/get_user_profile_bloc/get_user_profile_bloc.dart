import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/profile/data/api/user_requests.dart';
import 'package:assalomproject/views/profile/data/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'get_user_profile_event.dart';
part 'get_user_profile_state.dart';

class GetUserProfileBloc
    extends Bloc<GetUserProfileEvent, GetUserProfileState> {
  GetUserProfileBloc() : super(GetUserProfileInitial()) {
    on<GetProfileEvent>(userProfile);
    on<DeleteAccount>(deleteAccount);
  }

  Future<void> userProfile(
      GetProfileEvent event, Emitter<GetUserProfileState> emit) async {
    emit(GetUserProfileInitial());
    final response = await UserRequests.getProfile();
    // print(response);
    if (response is ProfileModel) {
      // print("object");
      emit(GetUserProfileSuccess(profilData: response));
    } else if (response is ErrorModel) {
      emit(GetUserProfileFail(errorData: response));
    }
  }

  Future<void> deleteAccount(
      DeleteAccount event, Emitter<GetUserProfileState> emit) async {
    emit(GetUserProfileInitial());
    final response = await UserRequests.deleteAccount(event.id);
    if (response is SuccessfulResponse) {
      print("SUCCESS ");
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.remove('token');
      emit(const GetUserProfileSuccess(profilData: null));
    } else if (response is ErrorModel) {
      emit(GetUserProfileFail(errorData: response));
    }
  }
}
