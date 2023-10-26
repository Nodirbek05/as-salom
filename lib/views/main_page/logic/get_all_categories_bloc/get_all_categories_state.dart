part of 'get_all_categories_bloc.dart';

sealed class GetAllCategoriesState extends Equatable {
  const GetAllCategoriesState();
  
  @override
  List<Object> get props => [];
}

final class GetAllCategoriesInitial extends GetAllCategoriesState {}
