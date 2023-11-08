part of 'get_cat_products_bloc.dart';

class GetCatProductsEvent extends Equatable {
  const GetCatProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProducts extends GetCatProductsEvent {
  final int id;
  const GetProducts({required this.id});
}
