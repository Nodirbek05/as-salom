import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_all_categories_event.dart';
part 'get_all_categories_state.dart';

class GetAllCategoriesBloc extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  GetAllCategoriesBloc() : super(GetAllCategoriesInitial()) {
    on<GetAllCategoriesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
