import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:assalomproject/core/common_models/response_data.dart';

class PaymentTypesModel extends ResponseData {
  List<Payment> data;
  PaymentTypesModel({
    required this.data,
  });


  PaymentTypesModel copyWith({
    List<Payment>? data,
  }) {
    return PaymentTypesModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'data': data.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory PaymentTypesModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypesModel(
      data: List<Payment>.from(map['data']?.map((x) => Payment.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypesModel.fromJson(String source) => PaymentTypesModel.fromMap(json.decode(source));

  @override
  String toString() => 'PaymentTypesModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PaymentTypesModel &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}

class Payment {
  String? url;
  String? icon;
  Payment({
    this.url,
    this.icon,
  });

  Payment copyWith({
    String? url,
    String? icon,
  }) {
    return Payment(
      url: url ?? this.url,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(url != null){
      result.addAll({'url': url});
    }
    if(icon != null){
      result.addAll({'icon': icon});
    }
  
    return result;
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      url: map['url'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) => Payment.fromMap(json.decode(source));

  @override
  String toString() => 'Payment(url: $url, icon: $icon)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Payment &&
      other.url == url &&
      other.icon == icon;
  }

  @override
  int get hashCode => url.hashCode ^ icon.hashCode;
}
