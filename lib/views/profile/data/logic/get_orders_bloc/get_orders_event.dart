part of 'get_orders_bloc.dart';

sealed class GetOrdersEvent extends Equatable {
  const GetOrdersEvent();

  @override
  List<Object> get props => [];
}

class GetOrdersData extends GetOrdersEvent {}