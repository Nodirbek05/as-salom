part of 'change_type_bloc.dart';

sealed class ChangeTypeState extends Equatable {
  const ChangeTypeState();

  @override
  List<Object> get props => [];
}

final class ChangeTypeInitial extends ChangeTypeState {}

class ChangeTypeFailed extends ChangeTypeState {
  final String message;
  const ChangeTypeFailed({
    required this.message,
  });
}

class ChangeTypeLoaded extends ChangeTypeState {
  final int type;
 const ChangeTypeLoaded({
    required this.type,
  });
}
