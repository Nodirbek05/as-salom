import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:assalomproject/views/main_page/data/models/search_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchProduct>(search);
  }

  Future<void> search(SearchProduct event, Emitter<SearchState> emit) async {
    emit(SearchInitial());
    final response = await CommonRequests.searchProducts(event.query);
    print("QUERY IS COMING HERE:${event.query}");
    if (response is SearchModel) {
      emit(SearchSuccess(data: response));
      print("GET SEARCH DATA **************** ${response}");
    } else if (response is ErrorModel) {
      emit(SearchFail(errorData: response));
      print("GET ALL PRODUCTS ERROR");
    }
  }
}
