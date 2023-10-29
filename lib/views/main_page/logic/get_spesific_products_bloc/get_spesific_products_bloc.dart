import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_spesific_products_event.dart';
part 'get_spesific_products_state.dart';

class GetSpesificProductsBloc
    extends Bloc<GetSpesificProductsEvent, GetSpesificProductsState> {
  GetSpesificProductsBloc() : super(GetSpesificProductsInitial()) {
    on<GetSpesificProductsDataEvent>(getSpesificProducts);
  }

  Future<void> getSpesificProducts(GetSpesificProductsDataEvent event,
      Emitter<GetSpesificProductsState> emit) async {
    emit(GetSpesificProductsInitial());
    final response = await CommonRequests.getSpesificProducts();
    if (response is SpesificProductsModel) {
      emit(GetSpesificProductsSuccess(spesificProducts: response));
      print("GET ALL CATEGORIES SUCCESS ${response}");
    } else if (response is ErrorModel) {
      emit(GetSpesificProductsError(errorData: response));
      print("GET ALL PRODUCTS ERROR");
    }
  }
}
