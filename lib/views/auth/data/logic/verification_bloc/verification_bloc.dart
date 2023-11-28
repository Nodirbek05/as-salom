import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/auth/data/api/auth_request.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationBloc() : super(VerificationInitial()) {
    on<VerificationDataEvent>(verification);
  }

  Future<void> verification(
      VerificationDataEvent event, Emitter<VerificationState> emit) async {
    emit(VerificationInitial());
    final response = await AuthRequests.verification(event.code);
    if (response is SuccessfulResponse) {
      emit(VerificationSuccess());
    } else if (response is ErrorModel) {
      emit(VerificationFail(errorMessage: response.message!));
    }
  }
}
