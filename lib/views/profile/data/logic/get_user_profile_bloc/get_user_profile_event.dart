part of 'get_user_profile_bloc.dart';

 class GetUserProfileEvent extends Equatable {
  const GetUserProfileEvent();

  @override
  List<Object> get props => [];
}


class GetProfileEvent extends GetUserProfileEvent{}

class DeleteAccount extends GetUserProfileEvent {
  final num id;
  const DeleteAccount({
    required this.id,
  });
}
