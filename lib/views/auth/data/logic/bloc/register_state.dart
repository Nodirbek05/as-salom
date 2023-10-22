part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterFail extends RegisterState {
  final ErrorModel errorModel;

  const RegisterFail({required this.errorModel});
}

class RegisterSuccess extends RegisterState {
  final CreatedAccountModel registerData;

  const RegisterSuccess({required this.registerData});
}
