part of 'create_order_bloc.dart';

class CreateOrderEvent extends Equatable {
  const CreateOrderEvent();

  @override
  List<Object> get props => [];
}

class Makeorder extends CreateOrderEvent {
  final CreateOrderModel good;

  const Makeorder({required this.good});
}
