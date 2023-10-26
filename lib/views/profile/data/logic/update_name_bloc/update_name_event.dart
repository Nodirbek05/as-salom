part of 'update_name_bloc.dart';

class UpdateNameEvent extends Equatable {
  const UpdateNameEvent();

  @override
  List<Object> get props => [];
}

class UpdateName extends UpdateNameEvent {
  final String name;
  final num userId;

  const UpdateName({required this.name, required this.userId});
}

class UpdateNumber extends UpdateNameEvent {
  final String number;
  final num userId;

  const UpdateNumber({required this.number, required this.userId});
}
