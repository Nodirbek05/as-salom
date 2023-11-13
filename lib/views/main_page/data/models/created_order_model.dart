import 'dart:convert';

import 'package:http/http.dart';

import 'package:assalomproject/core/common_models/response_data.dart';

class CreatedOrderModel extends ResponseData {
  Oreder order;
  CreatedOrderModel({
    required this.order,
  });

  CreatedOrderModel copyWith({
    Oreder? order,
  }) {
    return CreatedOrderModel(
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'order': order.toMap()});

    return result;
  }

  factory CreatedOrderModel.fromMap(Map<String, dynamic> map) {
    return CreatedOrderModel(
      order: Oreder.fromMap(map['order']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatedOrderModel.fromJson(String source) =>
      CreatedOrderModel.fromMap(json.decode(source));

  @override
  String toString() => 'CreatedOrderModel(order: $order)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreatedOrderModel && other.order == order;
  }

  @override
  int get hashCode => order.hashCode;
}

class Oreder {
  int? id;
  Oreder({
    this.id,
  });

  Oreder copyWith({
    int? id,
  }) {
    return Oreder(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }

    return result;
  }

  factory Oreder.fromMap(Map<String, dynamic> map) {
    return Oreder(
      id: map['id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Oreder.fromJson(String source) => Oreder.fromMap(json.decode(source));

  @override
  String toString() => 'Oreder(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Oreder && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
