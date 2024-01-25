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
  String? nameuz;
  String? nameen;
  String? nameru;
  String? icon;
  String? photo;
  String? createdat;
  String? updatedat;
  FliterSubCategoryModel({
    this.id,
    this.nameuz,
    this.nameen,
    this.nameru,
    this.icon,
    this.photo,
    this.createdat,
    this.updatedat,
  });

  FliterSubCategoryModel copyWith({
    num? id,
    String? nameuz,
    String? nameen,
    String? nameru,
    String? icon,
    String? photo,
    String? createdat,
    String? updatedat,
  }) {
    return FliterSubCategoryModel(
      id: id ?? this.id,
      nameuz: nameuz ?? this.nameuz,
      nameen: nameen ?? this.nameen,
      nameru: nameru ?? this.nameru,
      icon: icon ?? this.icon,
      photo: photo ?? this.photo,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_uz': nameuz,
      'name_en': nameen,
      'name_ru': nameru,
      'icon': icon,
      'photo': photo,
      'created_at': createdat,
      'updated_at': updatedat,
    };
  }

  factory FliterSubCategoryModel.fromMap(Map<String, dynamic> map) {
    return FliterSubCategoryModel(
      id: map['id'],
      nameuz: map['name_uz'],
      nameen: map['name_en'],
      nameru: map['name_ru'],
      icon: map['icon'],
      photo: map['photo'],
      createdat: map['created_at'],
      updatedat: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FliterSubCategoryModel.fromJson(String source) =>
      FliterSubCategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FliterSubCategoryModel(id: $id, name_uz: $nameuz, name_en: $nameen, name_ru: $nameru, icon: $icon, photo: $photo, created_at: $createdat, updated_at: $updatedat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FliterSubCategoryModel &&
        other.id == id &&
        other.nameuz == nameuz &&
        other.nameen == nameen &&
        other.nameru == nameru &&
        other.icon == icon &&
        other.photo == photo &&
        other.createdat == createdat &&
        other.updatedat == updatedat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nameuz.hashCode ^
        nameen.hashCode ^
        nameru.hashCode ^
        icon.hashCode ^
        photo.hashCode ^
        createdat.hashCode ^
        updatedat.hashCode;
  }
}
