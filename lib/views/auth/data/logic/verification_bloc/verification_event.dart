part of 'verification_bloc.dart';

class VerificationEvent extends Equatable {
  const VerificationEvent();

  @override
  List<Object> get props => [];
}

class VerificationDataEvent extends VerificationEvent {
  final num code;
  const VerificationDataEvent({
    required this.code,
  });

  @override
  List<Object> get props => [
        code,
      ];
}
