import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/auth/data/api/auth_request.dart';
import 'package:assalomproject/views/auth/data/models/created_account_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginDataEvent>(login);
  }

  Future<void> login(LoginDataEvent event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    final response = await AuthRequests.login(event.phone);
    if (response is CreateAccountDataModel) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.token);
      emit(LoginSuccess(loginData: response));
    } else if (response is ErrorModel) {
      emit(LoginFail(errorModel: response));
    }
  }
}
