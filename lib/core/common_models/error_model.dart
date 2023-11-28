import 'dart:convert';

import 'package:assalomproject/core/common_models/response_data.dart';

class ErrorModel extends ResponseData {
  final String? message;
  final String? error;
  final dynamic data;
  ErrorModel({
    this.message,
    this.data,
    this.error,
  });

  ErrorModel copyWith({
    String? message,
    String? error,
    dynamic data,
  }) {
    return ErrorModel(
      message: message ?? this.message,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (message != null) {
      result.addAll({'message': message});
    }
    if (error != null) {
      result.addAll({'error': error});
    }
    result.addAll({'data': data});

    return result;
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      message: map['message'],
      data: map['data'],
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) =>
      ErrorModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ErrorModel(message: $message, error: $error, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ErrorModel &&
        other.message == message &&
        other.error == error &&
        other.data == data;
  }

  @override
  int get hashCode => message.hashCode ^ error.hashCode ^ data.hashCode;
}
