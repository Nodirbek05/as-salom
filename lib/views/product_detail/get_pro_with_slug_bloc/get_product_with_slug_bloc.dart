import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/product_detail/data/api/get_pro_with_slug.dart';
import 'package:assalomproject/views/product_detail/data/models/get_pro_with_slug_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_product_with_slug_event.dart';
part 'get_product_with_slug_state.dart';

class GetProductWithSlugBloc
    extends Bloc<GetProductWithSlugEvent, GetProductWithSlugState> {
  GetProductWithSlugBloc() : super(GetProductWithSlugInitial()) {
    on<GetProductWithSlugData>(getProSlug);
  }

  Future<void> getProSlug(GetProductWithSlugData event,
      Emitter<GetProductWithSlugState> emit) async {
    emit(GetProductWithSlugInitial());
    final response = await GetProWithSlug.getProSlug(event.slug);
    if (response is GetProWithSlugModel) {
      emit(GetProductWithSlugSuccess(dataModel: response));
    } else if (response is ErrorModel) {
      emit(GetProductWithSlugFailed(errorMessage: response.toString()));
    }
  }
}
