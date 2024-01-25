import 'package:assalomproject/views/main_page/data/api/common_request.dart';
import 'package:assalomproject/views/main_page/data/models/confirm_order_by_card_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'confirm_order_by_card_event.dart';
part 'confirm_order_by_card_state.dart';

class ConfirmOrderByCardBloc
    extends Bloc<ConfirmOrderByCardEvent, ConfirmOrderByCardState> {
  ConfirmOrderByCardBloc() : super(ConfirmOrderByCardInitial()) {
    on<ConfirmOrderByCardData>(confirmOrderByCard);
  }

  Future<void> confirmOrderByCard(ConfirmOrderByCardData event,
      Emitter<ConfirmOrderByCardState> emit) async {
    emit(ConfirmOrderByCardInitial());
    final response =
        await CommonRequests.confirmOrById(event.name, event.phone, event.id);
    if (response is ConfirmOrderByCard) {
      emit(ConfirmOrderByCardSuccess(data: response));
      // print("CREATE ORDER SUCCESS");
    }
  }
}
