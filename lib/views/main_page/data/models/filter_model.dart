import 'dart:convert';

import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/main_page/data/models/categories_model.dart';

class FilterModel extends ResponseData {
  FliterSubCategoryModel subcategory;
  CategoryGoods goods;
  FilterModel({
    required this.subcategory,
    required this.goods,
  });

  FilterModel copyWith({
    FliterSubCategoryModel? subcategory,
    CategoryGoods? goods,
  }) {
    return FilterModel(
      subcategory: subcategory ?? this.subcategory,
      goods: goods ?? this.goods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subcategory': subcategory.toMap(),
      'goods': goods.toMap(),
    };
  }

  factory FilterModel.fromMap(Map<String, dynamic> map) {
    return FilterModel(
      subcategory: FliterSubCategoryModel.fromMap(map['subcategory']),
      goods: CategoryGoods.fromMap(map['goods']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterModel.fromJson(String source) => FilterModel.fromMap(json.decode(source));

  @override
  String toString() => 'FilterModel(subcategory: $subcategory, goods: $goods)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FilterModel &&
      other.subcategory == subcategory &&
      other.goods == goods;
  }

  @override
  int get hashCode => subcategory.hashCode ^ goods.hashCode;
}

class FliterSubCategoryModel extends ResponseData {
  num? id;
  String? name_uz;
  String? name_en;
  String? name_ru;
  String? icon;
  String? photo;
  String? created_at;
  String? updated_at;
  FliterSubCategoryModel({
    this.id,
    this.name_uz,
    this.name_en,
    this.name_ru,
    this.icon,
    this.photo,
    this.created_at,
    this.updated_at,
  });

  FliterSubCategoryModel copyWith({
    num? id,
    String? name_uz,
    String? name_en,
    String? name_ru,
    String? icon,
    String? photo,
    String? created_at,
    String? updated_at,
  }) {
    return FliterSubCategoryModel(
      id: id ?? this.id,
      name_uz: name_uz ?? this.name_uz,
      name_en: name_en ?? this.name_en,
      name_ru: name_ru ?? this.name_ru,
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
      'icon': icon,
      'photo': photo,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory FliterSubCategoryModel.fromMap(Map<String, dynamic> map) {
    return FliterSubCategoryModel(
      id: map['id'],
      name_uz: map['name_uz'],
      name_en: map['name_en'],
      name_ru: map['name_ru'],
      icon: map['icon'],
      photo: map['photo'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FliterSubCategoryModel.fromJson(String source) =>
      FliterSubCategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FliterSubCategoryModel(id: $id, name_uz: $name_uz, name_en: $name_en, name_ru: $name_ru, icon: $icon, photo: $photo, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FliterSubCategoryModel &&
        other.id == id &&
        other.name_uz == name_uz &&
        other.name_en == name_en &&
        other.name_ru == name_ru &&
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
        icon.hashCode ^
        photo.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
