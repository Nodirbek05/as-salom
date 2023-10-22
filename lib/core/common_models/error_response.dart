import 'package:assalomproject/core/common_models/response_data.dart';

class ResponseError extends ResponseData {
  final String message;

  const ResponseError(this.message);

  const ResponseError.undefined(int code) : this('$code');

  static const noInternet = ResponseError('no_internet');

  static const incorretFormat = ResponseError('incorrect_format');

  static const serverError = ResponseError('server_error');

  static const unauthorized = ResponseError('not_authorized');

  @override
  String toString() {
    return message;
  }
}
