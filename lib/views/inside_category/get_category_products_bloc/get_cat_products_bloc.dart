import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:assalomproject/views/main_page/data/models/sub_category_inner_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_cat_products_event.dart';
part 'get_cat_products_state.dart';

class GetCatProductsBloc
    extends Bloc<GetCatProductsEvent, GetCatProductsState> {
  GetCatProductsBloc() : super(GetCatProductsInitial()) {
    on<GetProducts>(getProducts);
  }
  Future<void> getProducts(
      GetProducts event, Emitter<GetCatProductsState> emit) async {
    emit(GetCatProductsInitial());
    final response = await CommonRequests.getCatProducts(event.id);
    if (response is SubCategoryModelMain) {
      emit(GetCatProductsSuccess(subcategoryModel: response));
    } else if (response is ErrorModel) {
      emit(GetCatProductsFail(errorModel: response));
    }
  }
}
