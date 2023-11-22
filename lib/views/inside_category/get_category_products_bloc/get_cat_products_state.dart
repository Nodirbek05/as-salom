part of 'get_cat_products_bloc.dart';

class GetCatProductsState extends Equatable {
  const GetCatProductsState();

  @override
  List<Object> get props => [];
}

class GetInitial extends GetCatProductsState {}

class GetCatProductsInitial extends GetCatProductsState {}

class GetCatProductsSuccess extends GetCatProductsState {
  final SubCategoryModelMain subcategoryModel;

  const GetCatProductsSuccess({required this.subcategoryModel});
}

class GetCatProductsFail extends GetCatProductsState {
  final ErrorModel errorModel;

  const GetCatProductsFail({required this.errorModel});
}

class GetSubCatProductsInitial extends GetCatProductsState {}

class GetSubCatProductsSuccess extends GetCatProductsState {
  final InnerModel innerModel;

  const GetSubCatProductsSuccess({required this.innerModel});
}

class GetSubCatProductsFail extends GetCatProductsState {
  final ErrorModel errorModel;

  const GetSubCatProductsFail({required this.errorModel});
}
