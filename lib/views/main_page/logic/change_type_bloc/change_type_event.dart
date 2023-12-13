part of 'change_type_bloc.dart';

sealed class ChangeTypeEvent extends Equatable {
  const ChangeTypeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTypeData extends ChangeTypeEvent {
  final int type;
  const ChangeTypeData({
    required this.type,
  });
}
