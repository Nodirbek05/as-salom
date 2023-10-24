part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginDataEvent extends LoginEvent {
  final String phone;

  const LoginDataEvent({required this.phone});

  @override
  List<Object> get props => [phone];
}
