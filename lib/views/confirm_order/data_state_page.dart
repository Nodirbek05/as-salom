import 'package:assalomproject/core/common_models/error_model.dart';

abstract class DataState {
  final dynamic data;
  final ErrorModel? error;
  const DataState({this.data, this.error});
}

class DataSuccess extends DataState {
  const DataSuccess(dynamic data) : super(data: data);
}

class DataError extends DataState {
  const DataError(ErrorModel dioCustomException)
      : super(
          error: dioCustomException,
        );
}
