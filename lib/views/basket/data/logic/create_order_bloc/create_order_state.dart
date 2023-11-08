part of 'create_order_bloc.dart';

class CreateOrderState extends Equatable {
  const CreateOrderState();

  @override
  List<Object> get props => [];
}

class CreateOrderInitial extends CreateOrderState {}

class CreateOrderSuccess extends CreateOrderState {}

class CreateOrderFail extends CreateOrderState {
  final ErrorModel errorModel;

  const CreateOrderFail({required this.errorModel});
}
