part of 'get_cat_products_bloc.dart';

class GetCatProductsState extends Equatable {
  const GetCatProductsState();

  @override
  List<Object> get props => [];
}

class GetCatProductsInitial extends GetCatProductsState {}

class GetCatProductsSuccess extends GetCatProductsState {
  final SubCategoryModelMain subcategoryModel;

  const GetCatProductsSuccess({required this.subcategoryModel});
}

class GetCatProductsFail extends GetCatProductsState {
  final ErrorModel errorModel;

  const GetCatProductsFail({required this.errorModel});
}
