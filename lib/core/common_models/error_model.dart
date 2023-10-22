import 'dart:convert';

import 'package:assalomproject/core/common_models/response_data.dart';

class ErrorModel extends ResponseData {
   final String? message;
  final dynamic data;
  ErrorModel({
    this.message,
     this.data,
  });

  ErrorModel copyWith({
    String? message,
    dynamic data,
  }) {
    return ErrorModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(message != null){
      result.addAll({'message': message});
    }
    result.addAll({'data': data});
  
    return result;
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      message: map['message'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) => ErrorModel.fromMap(json.decode(source));

  @override
  String toString() => 'ErrorModel(message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ErrorModel &&
      other.message == message &&
      other.data == data;
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}
