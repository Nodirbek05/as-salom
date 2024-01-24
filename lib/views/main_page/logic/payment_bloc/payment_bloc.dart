import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:assalomproject/views/main_page/data/models/payment_types_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentOrder>(makePayment);
  }

  Future<void> makePayment(
      PaymentOrder event, Emitter<PaymentState> emit) async {
    emit(PaymentInitial());
    final response = await CommonRequests.payForOrder(event.id);
    if (response is PaymentTypesModel) {
      emit(PaymentSuccess(paymentTypesModel: response));
    } else if (response is ErrorModel) {
      emit(PaymentFail(errorModel: response));
    }
  }
}
