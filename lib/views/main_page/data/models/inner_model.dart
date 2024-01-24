import 'dart:convert';

import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';

class InnerModel extends ResponseData {
  CategoryGoods goods;
  InnerCategorymodel subcategory;
  InnerModel({
    required this.goods,
    required this.subcategory,
  });

  InnerModel copyWith({
    CategoryGoods? goods,
    InnerCategorymodel? subcategory,
  }) {
    return InnerModel(
      goods: goods ?? this.goods,
      subcategory: subcategory ?? this.subcategory,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'goods': goods.toMap()});
    result.addAll({'subcategory': subcategory.toMap()});

    return result;
  }

  factory InnerModel.fromMap(Map<String, dynamic> map) {
    return InnerModel(
      goods: CategoryGoods.fromMap(map['goods']),
      subcategory: InnerCategorymodel.fromMap(map['subcategory']),
    );
  }

  String toJson() => json.encode(toMap());

  factory InnerModel.fromJson(String source) =>
      InnerModel.fromMap(json.decode(source));

  @override
  String toString() => 'InnerModel(goods: $goods, subcategory: $subcategory)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InnerModel &&
        other.goods == goods &&
        other.subcategory == subcategory;
  }

  @override
  int get hashCode => goods.hashCode ^ subcategory.hashCode;
}

class InnerCategorymodel {
  num? id;
  String? name_uz;
  String? name_en;
  String? name_ru;
  dynamic category_id;
  String? icon;
  String? photo;
  String? created_at;
  String? updated_at;
  InnerCategorymodel({
    this.id,
    this.name_uz,
    this.name_en,
    this.name_ru,
    required this.category_id,
    this.icon,
    this.photo,
    this.created_at,
    this.updated_at,
  });

  InnerCategorymodel copyWith({
    num? id,
    String? name_uz,
    String? name_en,
    String? name_ru,
    dynamic category_id,
    String? icon,
    String? photo,
    String? created_at,
    String? updated_at,
  }) {
    return InnerCategorymodel(
      id: id ?? this.id,
      name_uz: name_uz ?? this.name_uz,
      name_en: name_en ?? this.name_en,
      name_ru: name_ru ?? this.name_ru,
      category_id: category_id ?? this.category_id,
      icon: icon ?? this.icon,
      photo: photo ?? this.photo,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_uz': name_uz,
      'name_en': name_en,
      'name_ru': name_ru,
      'category_id': category_id,
      'icon': icon,
      'photo': photo,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory InnerCategorymodel.fromMap(Map<String, dynamic> map) {
    return InnerCategorymodel(
      id: map['id'],
      name_uz: map['name_uz'],
      name_en: map['name_en'],
      name_ru: map['name_ru'],
      category_id: map['category_id'] ?? null,
      icon: map['icon'],
      photo: map['photo'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InnerCategorymodel.fromJson(String source) => InnerCategorymodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InnerCategorymodel(id: $id, name_uz: $name_uz, name_en: $name_en, name_ru: $name_ru, category_id: $category_id, icon: $icon, photo: $photo, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is InnerCategorymodel &&
      other.id == id &&
      other.name_uz == name_uz &&
      other.name_en == name_en &&
      other.name_ru == name_ru &&
      other.category_id == category_id &&
      other.icon == icon &&
      other.photo == photo &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name_uz.hashCode ^
      name_en.hashCode ^
      name_ru.hashCode ^
      category_id.hashCode ^
      icon.hashCode ^
      photo.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}
