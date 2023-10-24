part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final CreateAccountDataModel loginData;

  const LoginSuccess({required this.loginData});
}

final class LoginFail extends LoginState {
  final ErrorModel errorModel;

  const LoginFail({required this.errorModel});
}
