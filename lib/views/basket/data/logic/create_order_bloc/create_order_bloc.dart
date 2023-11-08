import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/basket/data/models/create_order_model.dart';
import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  CreateOrderBloc() : super(CreateOrderInitial()) {
    on<Makeorder>(makeOrder);
  }

  Future<void> makeOrder(
      Makeorder event, Emitter<CreateOrderState> emit) async {
    emit(CreateOrderInitial());
    final response = await CommonRequests.createOrder(event.good);
    if (response is SuccessfulResponse) {
      emit(CreateOrderSuccess());
      print("CREATE ORDER SUCCESS");
    }
  }
}
