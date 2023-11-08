import 'dart:convert';

import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';

class SubCategoryModelMain extends ResponseData {
  CategoryDataModel? subcategory;
  CategoryGoods? goods;
  SubCategoryModelMain({
    this.subcategory,
    this.goods,
  });

  SubCategoryModelMain copyWith({
    CategoryDataModel? subcategory,
    CategoryGoods? goods,
  }) {
    return SubCategoryModelMain(
      subcategory: subcategory ?? this.subcategory,
      goods: goods ?? this.goods,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (subcategory != null) {
      result.addAll({'subcategory': subcategory!.toMap()});
    }
    if (goods != null) {
      result.addAll({'goods': goods!.toMap()});
    }

    return result;
  }

  factory SubCategoryModelMain.fromMap(Map<String, dynamic> map) {
    return SubCategoryModelMain(
      subcategory: map['subcategory'] != null
          ? CategoryDataModel.fromMap(map['subcategory'])
          : null,
      goods: map['goods'] != null ? CategoryGoods.fromMap(map['goods']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModelMain.fromJson(String source) =>
      SubCategoryModelMain.fromMap(json.decode(source));

  @override
  String toString() =>
      'SubCategoryModel(subcategory: $subcategory, goods: $goods)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubCategoryModelMain &&
        other.subcategory == subcategory &&
        other.goods == goods;
  }

  @override
  int get hashCode => subcategory.hashCode ^ goods.hashCode;
}
