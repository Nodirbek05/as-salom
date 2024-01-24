import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:assalomproject/views/main_page/data/models/sub_categories_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_sub_categories_event.dart';
part 'get_sub_categories_state.dart';

class GetSubCategoriesBloc
    extends Bloc<GetSubCategoriesEvent, GetSubCategoriesState> {
  GetSubCategoriesBloc() : super(GetSubCategoriesInitial()) {
    on<SubCategories>(getSubCategories);
  }

  Future<void> getSubCategories(
      SubCategories event, Emitter<GetSubCategoriesState> emit) async {
    emit(GetSubCategoriesInitial());
    final response = await CommonRequests.getSubcategories();
    if (response is SubcategoriesMainModel) {
      emit(GetSubCategoriesSuccess(data: response));
    } else if (response is ErrorModel) {
      emit(GetSubCategoriesFail(errorDate: response));
    }
  }
}
