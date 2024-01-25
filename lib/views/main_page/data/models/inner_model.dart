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
  String? nameuz;
  String? nameen;
  String? nameru;
  dynamic categoryid;
  String? icon;
  String? photo;
  String? createdat;
  String? updatedat;
  InnerCategorymodel({
    this.id,
    this.nameuz,
    this.nameen,
    this.nameru,
    required this.categoryid,
    this.icon,
    this.photo,
    this.createdat,
    this.updatedat,
  });

  InnerCategorymodel copyWith({
    num? id,
    String? nameuz,
    String? nameen,
    String? nameru,
    dynamic categoryid,
    String? icon,
    String? photo,
    String? createdat,
    String? updatedat,
  }) {
    return InnerCategorymodel(
      id: id ?? this.id,
      nameuz: nameuz ?? this.nameuz,
      nameen: nameen ?? this.nameen,
      nameru: nameru ?? this.nameru,
      categoryid: categoryid ?? this.categoryid,
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
      'category_id': categoryid,
      'icon': icon,
      'photo': photo,
      'created_at': createdat,
      'updated_at': updatedat,
    };
  }

  factory InnerCategorymodel.fromMap(Map<String, dynamic> map) {
    return InnerCategorymodel(
      id: map['id'],
      nameuz: map['name_uz'],
      nameen: map['name_en'],
      nameru: map['name_ru'],
      categoryid: map['category_id'] ?? null,
      icon: map['icon'],
      photo: map['photo'],
      createdat: map['created_at'],
      updatedat: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InnerCategorymodel.fromJson(String source) => InnerCategorymodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InnerCategorymodel(id: $id, name_uz: $nameuz, name_en: $nameen, name_ru: $nameru, category_id: $categoryid, icon: $icon, photo: $photo, created_at: $createdat, updated_at: $updatedat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is InnerCategorymodel &&
      other.id == id &&
      other.nameuz == nameuz &&
      other.nameen == nameen &&
      other.nameru == nameru &&
      other.categoryid == categoryid &&
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
      categoryid.hashCode ^
      icon.hashCode ^
      photo.hashCode ^
      createdat.hashCode ^
      updatedat.hashCode;
  }
}
