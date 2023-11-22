part of 'confirm_order_by_card_bloc.dart';

sealed class ConfirmOrderByCardState extends Equatable {
  const ConfirmOrderByCardState();

  @override
  List<Object> get props => [];
}

final class ConfirmOrderByCardInitial extends ConfirmOrderByCardState {}

class ConfirmOrderByCardFail extends ConfirmOrderByCardState {
  final String errorMessage;
  const ConfirmOrderByCardFail({
    required this.errorMessage,
  });
}

class ConfirmOrderByCardSuccess extends ConfirmOrderByCardState {
  final ConfirmOrderByCard data;
  const ConfirmOrderByCardSuccess({
    required this.data,
  });
}
