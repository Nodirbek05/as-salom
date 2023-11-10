import 'package:assalomproject/core/common_models/error_model.dart';
import 'package:assalomproject/views/profile/data/api/user_requests.dart';
import 'package:assalomproject/views/profile/data/models/get_order_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_orders_event.dart';
part 'get_orders_state.dart';

class GetOrdersBloc extends Bloc<GetOrdersEvent, GetOrdersState> {
  GetOrdersBloc() : super(GetOrdersInitial()) {
    on<GetOrdersData>(getOrders);
  }

  Future<void> getOrders(
      GetOrdersData event, Emitter<GetOrdersState> emit) async {
    emit(GetOrdersInitial());
    final response = await UserRequests.getOrders();
    if (response is OrdersModel) {
      emit(GetOrdersSuccess(orderModel: response));
    } else if (response is ErrorModel) {
      emit(GetOrdersFail(errorMessage: response.toString()));
    }
  }
}
