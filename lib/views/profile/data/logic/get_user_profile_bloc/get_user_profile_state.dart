part of 'get_user_profile_bloc.dart';

class GetUserProfileState extends Equatable {
  const GetUserProfileState();

  @override
  List<Object> get props => [];
}

class GetUserProfileInitial extends GetUserProfileState {}

class GetUserProfileSuccess extends GetUserProfileState {
  final ProfileModel? profilData;

  const GetUserProfileSuccess({ this.profilData});
}

class GetUserProfileFail extends GetUserProfileState {
  final ErrorModel errorData;

  const GetUserProfileFail({required this.errorData});
}
