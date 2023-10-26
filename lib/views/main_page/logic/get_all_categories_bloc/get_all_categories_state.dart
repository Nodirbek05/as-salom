part of 'get_all_categories_bloc.dart';

class GetAllCategoriesState extends Equatable {
  const GetAllCategoriesState();

  @override
  List<Object> get props => [];
}

class GetAllCategoriesInitial extends GetAllCategoriesState {}

class GetAllCategoriesSuccess extends GetAllCategoriesState {
  final CategoriesModel categoryModel;

  const GetAllCategoriesSuccess({required this.categoryModel});
}

class GetAllCategoriesFail extends GetAllCategoriesState {
  final ErrorModel errorData;

  const GetAllCategoriesFail({required this.errorData});
}
