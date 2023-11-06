import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';
import 'package:assalomproject/views/main_page/data/models/category_inner_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'inside_cat_first_event.dart';
part 'inside_cat_first_state.dart';

class InsideCatFirstBloc
    extends Bloc<InsideCatFirstEvent, InsideCatFirstState> {
  InsideCatFirstBloc() : super(InsideCatFirstInitial()) {
    on<InsideCatFirstData>(getInsideCategories);
  }

  Future<void> getInsideCategories(
      InsideCatFirstData event, Emitter<InsideCatFirstState> emit) async {
    emit(InsideCatFirstInitial());
    final response = await CommonRequests.getInsideCategories(event.id);
    if (response is CategoryInnerModel) {
      emit(InsideCatFirstSuccess(modelData: response));
      print("GET Inside CATEGORIES SUCCESS ${response}");
      print("${response.category} GOOODS SHOULD COMING WITH DATA");
      print("${response.category.goods!} GOOODS SHOULD COMING");
    } else if (response is ErrorModel) {
      emit(InsideCatFirstFail(errorMessage: response.message!));
      print("GET Inside Banners ERROR");
    }
  }
}
