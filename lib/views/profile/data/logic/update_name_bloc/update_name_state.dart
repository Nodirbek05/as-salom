part of 'update_name_bloc.dart';

class UpdateNameState extends Equatable {
  const UpdateNameState();

  @override
  List<Object> get props => [];
}

class UpdateNameInitial extends UpdateNameState {}

class UpdateNameSuccess extends UpdateNameState {}

class UpdateNameFail extends UpdateNameState {
  final ErrorModel errorModel;

  const UpdateNameFail({required this.errorModel});
}

class UpdateNumberInitial extends UpdateNameState {}

class UpdateNumberSuccess extends UpdateNameState {}

class UpdateNumberFail extends UpdateNameState {
  final ErrorModel errorModel;

  const UpdateNumberFail({required this.errorModel});
}
