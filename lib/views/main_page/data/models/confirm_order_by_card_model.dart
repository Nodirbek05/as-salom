import 'dart:convert';

import 'package:assalomproject/core/common_models/response_data.dart';

class ConfirmOrderByCard extends ResponseData {
  String? message;
  ConfirmOrderByCard({
    this.message,
  });

  ConfirmOrderByCard copyWith({
    String? message,
  }) {
    return ConfirmOrderByCard(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  factory ConfirmOrderByCard.fromMap(Map<String, dynamic> map) {
    return ConfirmOrderByCard(
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfirmOrderByCard.fromJson(String source) => ConfirmOrderByCard.fromMap(json.decode(source));

  @override
  String toString() => 'ConfirmOrderByCard(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ConfirmOrderByCard &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
