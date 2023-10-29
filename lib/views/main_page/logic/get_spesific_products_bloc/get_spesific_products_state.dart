part of 'get_spesific_products_bloc.dart';

 class GetSpesificProductsState extends Equatable {
  const GetSpesificProductsState();

  @override
  List<Object> get props => [];
}

final class GetSpesificProductsInitial extends GetSpesificProductsState {}

final class GetSpesificProductsError extends GetSpesificProductsState {
  final ErrorModel errorData;

  const GetSpesificProductsError({required this.errorData});
}

final class GetSpesificProductsSuccess extends GetSpesificProductsState {
  final SpesificProductsModel spesificProducts;

  const GetSpesificProductsSuccess({required this.spesificProducts});
}
