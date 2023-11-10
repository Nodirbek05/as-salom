part of 'get_orders_bloc.dart';

sealed class GetOrdersState extends Equatable {
  const GetOrdersState();

  @override
  List<Object> get props => [];
}

final class GetOrdersInitial extends GetOrdersState {}

class GetOrdersFail extends GetOrdersState {
  final String? errorMessage;
  const GetOrdersFail({
    this.errorMessage,
  });
}

class GetOrdersSuccess extends GetOrdersState {
  final OrdersModel orderModel;
  const GetOrdersSuccess({
    required this.orderModel,
  });
}
