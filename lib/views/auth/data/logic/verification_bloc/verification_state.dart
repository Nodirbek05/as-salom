part of 'verification_bloc.dart';

sealed class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

final class VerificationInitial extends VerificationState {}

final class VerificationSuccess extends VerificationState {}

final class VerificationFail extends VerificationState {
  final String errorMessage;

  const VerificationFail({required this.errorMessage});
}
