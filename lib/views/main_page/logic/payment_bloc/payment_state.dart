part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentFail extends PaymentState {
  final ErrorModel errorModel;

  const PaymentFail({required this.errorModel});
}

class PaymentSuccess extends PaymentState {
  final PaymentTypesModel paymentTypesModel;

  const PaymentSuccess({required this.paymentTypesModel});
}
