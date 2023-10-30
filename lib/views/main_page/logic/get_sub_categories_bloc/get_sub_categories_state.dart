part of 'get_sub_categories_bloc.dart';

class GetSubCategoriesState extends Equatable {
  const GetSubCategoriesState();

  @override
  List<Object> get props => [];
}

class GetSubCategoriesInitial extends GetSubCategoriesState {}

class GetSubCategoriesFail extends GetSubCategoriesState {
  final ErrorModel errorDate;

  // ignore: prefer_const_constructors_in_immutables
  GetSubCategoriesFail({required this.errorDate});
}

class GetSubCategoriesSuccess extends GetSubCategoriesState {
  final SubcategoriesMainModel data;

  const GetSubCategoriesSuccess({required this.data});
}
