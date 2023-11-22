part of 'confirm_order_by_card_bloc.dart';

sealed class ConfirmOrderByCardEvent extends Equatable {
  const ConfirmOrderByCardEvent();

  @override
  List<Object> get props => [];
}

class ConfirmOrderByCardData extends ConfirmOrderByCardEvent {
  final int id;
  final String name;
  final String phone;
  const ConfirmOrderByCardData({
    required this.id,
    required this.name,
    required this.phone
  });
}
