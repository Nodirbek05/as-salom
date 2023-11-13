part of 'payment_bloc.dart';

class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PaymentOrder extends PaymentEvent {
  final int id;
  const PaymentOrder({required this.id});

  @override
  List<Object> get props => [];
}
