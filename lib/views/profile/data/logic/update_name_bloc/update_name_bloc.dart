import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/profile/data/api/user_requests.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_name_event.dart';
part 'update_name_state.dart';

class UpdateNameBloc extends Bloc<UpdateNameEvent, UpdateNameState> {
  UpdateNameBloc() : super(UpdateNameInitial()) {
    on<UpdateName>(updateName);
    on<UpdateNumber>(updateNumber);
    
  }

  Future<void> updateName(
      UpdateName event, Emitter<UpdateNameState> emit) async {
    emit(UpdateNameInitial());
    final response = await UserRequests.updateName(event.name, event.userId);
    if (response is SuccessfulResponse) {
      emit(UpdateNameSuccess());
    } else if (response is ErrorModel) {
      emit(UpdateNameFail(errorModel: response));
    }
  }

  Future<void> updateNumber(
      UpdateNumber event, Emitter<UpdateNameState> emit) async {
    emit(UpdateNumberInitial());
    final response = await UserRequests.updatePhone(event.number, event.userId);
    if (response is SuccessfulResponse) {
      emit(UpdateNumberSuccess());
    } else if (response is ErrorModel) {
      emit(UpdateNumberFail(errorModel: response));
    }
  }




}
