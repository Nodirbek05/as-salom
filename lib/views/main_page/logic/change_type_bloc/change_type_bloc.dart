import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_type_event.dart';
part 'change_type_state.dart';

class ChangeTypeBloc extends Bloc<ChangeTypeEvent, ChangeTypeState> {
  ChangeTypeBloc() : super(ChangeTypeInitial()) {
    on<ChangeTypeData>((event, emit) async {
      emit(ChangeTypeInitial());
      try {
        emit(ChangeTypeLoaded(type: event.type));
      } catch (e) {
        emit(const ChangeTypeFailed(message: "Type could not found"));
      }
    });
  }
}
