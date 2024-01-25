import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:assalomproject/views/main_page/data/models/filter_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterData>(getFilter);
  }

  Future<void> getFilter(FilterData event, Emitter<FilterState> emit) async {
    emit(FilterInitial());
    final response = await CommonRequests.filterCat(event.id);
    if (response is FilterModel) {
      emit(FilterSuccess(filterModel: response));
      // print("GET FilterData SUCCESS ${response}");
    } else if (response is ErrorModel) {
      emit(FilterFailed(errorMessage: response.message!));
      // print("GET FilterData ERROR");
    }
  }
}
