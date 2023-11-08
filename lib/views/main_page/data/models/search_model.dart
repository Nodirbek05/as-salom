import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';

class SearchModel extends ResponseData {
  List<ProductModel>? data;
  SearchModel({
    this.data,
  });

  SearchModel copyWith({
    List<ProductModel>? data,
  }) {
    return SearchModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (data != null) {
      result.addAll({'data': data!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      data: map['data'] != null
          ? List<ProductModel>.from(
              map['data']?.map((x) => ProductModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source));

  @override
  String toString() => 'SearchModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchModel && listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
