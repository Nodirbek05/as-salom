import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/auth/data/api/auth_request.dart';
import 'package:assalomproject/views/auth/data/models/created_account_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterDataEvent>(register);
  }

  Future<void> register(
      RegisterDataEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterInitial());
    final response = await AuthRequests.createAccount(
        event.name, event.phone, event.deviceName);
    if (response is CreatedAccountModel) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.data.token);
      emit(RegisterSuccess(registerData: response));
    } else if (response is ErrorModel) {
      emit(RegisterFail(errorModel: response));
    }
  }
}
