import 'dart:convert';

import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';

class CategoryInnerModel extends ResponseData {
  CategoryDataModel category;
  CategoryGoods? goods;
  CategoryInnerModel({
    required this.category,
    this.goods,
  });

  CategoryInnerModel copyWith({
    CategoryDataModel? category,
    CategoryGoods? goods,
  }) {
    return CategoryInnerModel(
      category: category ?? this.category,
      goods: goods ?? this.goods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category.toMap(),
      'goods': goods?.toMap(),
    };
  }

  factory CategoryInnerModel.fromMap(Map<String, dynamic> map) {
    return CategoryInnerModel(
      category: CategoryDataModel.fromMap(map['category']),
      goods: map['goods'] != null ? CategoryGoods.fromMap(map['goods']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryInnerModel.fromJson(String source) => CategoryInnerModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryInnerModel(category: $category, goods: $goods)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryInnerModel &&
      other.category == category &&
      other.goods == goods;
  }

  @override
  int get hashCode => category.hashCode ^ goods.hashCode;
}
