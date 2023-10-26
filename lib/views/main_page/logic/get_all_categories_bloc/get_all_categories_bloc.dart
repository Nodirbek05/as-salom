import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_all_categories_event.dart';
part 'get_all_categories_state.dart';

class GetAllCategoriesBloc
    extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  GetAllCategoriesBloc() : super(GetAllCategoriesInitial()) {
    on<GetCategories>(getCategories);
  }

  Future<void> getCategories(
      GetCategories event, Emitter<GetAllCategoriesState> emit) async {
    emit(GetAllCategoriesInitial());
    final response = await CommonRequests.getCategories();
    if (response is CategoriesModel) {
      emit(GetAllCategoriesSuccess(categoryModel: response));
      print("GET ALL CATEGORIES SUCCESS ${response}");
    } else if (response is ErrorModel) {
      emit(GetAllCategoriesFail(errorData: response));
      print("GET ALL Banners ERROR");
    }
  }
}
