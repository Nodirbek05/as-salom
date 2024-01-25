import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';

class SubcategoriesMainModel extends ResponseData {
  SubCategoriesModel? data;
  SubcategoriesMainModel({
    this.data,
  });

  SubcategoriesMainModel copyWith({
    SubCategoriesModel? data,
  }) {
    return SubcategoriesMainModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (data != null) {
      result.addAll({'data': data!.toMap()});
    }

    return result;
  }

  factory SubcategoriesMainModel.fromMap(Map<String, dynamic> map) {
    return SubcategoriesMainModel(
      data:
          map['data'] != null ? SubCategoriesModel.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubcategoriesMainModel.fromJson(String source) =>
      SubcategoriesMainModel.fromMap(json.decode(source));

  @override
  String toString() => 'SubcategoriesMainModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubcategoriesMainModel && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class SubCategoriesModel extends ResponseData {
  num? id;
  String? nameuz;
  String? nameru;
  String? nameen;
  String? nameoz;
  List<SubCategoryModel>? subcategories;
  SubCategoriesModel({
    this.id,
    this.nameuz,
    this.nameru,
    this.nameen,
    this.nameoz,
    this.subcategories,
  });

  SubCategoriesModel copyWith({
    num? id,
    String? nameuz,
    String? nameru,
    String? nameen,
    String? nameoz,
    List<SubCategoryModel>? subcategories,
  }) {
    return SubCategoriesModel(
      id: id ?? this.id,
      nameuz: nameuz ?? this.nameuz,
      nameru: nameru ?? this.nameru,
      nameen: nameen ?? this.nameen,
      nameoz: nameoz ?? this.nameoz,
      subcategories: subcategories ?? this.subcategories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_uz': nameuz,
      'name_ru': nameru,
      'name_en': nameen,
      'name_oz': nameoz,
      'subcategories': subcategories?.map((x) => x.toMap()).toList(),
    };
  }

  factory SubCategoriesModel.fromMap(Map<String, dynamic> map) {
    return SubCategoriesModel(
      id: map['id'],
      nameuz: map['name_uz'],
      nameru: map['name_ru'],
      nameen: map['name_en'],
      nameoz: map['name_oz'],
      subcategories: map['subcategories'] != null
          ? List<SubCategoryModel>.from(
              map['subcategories']?.map((x) => SubCategoryModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoriesModel.fromJson(String source) =>
      SubCategoriesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubCategoriesModel(id: $id, name_uz: $nameuz, name_ru: $nameru, name_en: $nameen, name_oz: $nameoz, subcategories: $subcategories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubCategoriesModel &&
        other.id == id &&
        other.nameuz == nameuz &&
        other.nameru == nameru &&
        other.nameen == nameen &&
        other.nameoz == nameoz &&
        listEquals(other.subcategories, subcategories);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nameuz.hashCode ^
        nameru.hashCode ^
        nameen.hashCode ^
        nameoz.hashCode ^
        subcategories.hashCode;
  }
}

class SubCategoryModel {
  num? id;
  int? categoryid;
  String? nameuz;
  String? nameru;
  String? nameen;
  String? nameoz;
  String? photo;
  Pivot? pivot;
  SubCategoryModel({
    this.id,
    this.categoryid,
    this.nameuz,
    this.nameru,
    this.nameen,
    this.nameoz,
    this.photo,
    this.pivot,
  });

  SubCategoryModel copyWith({
    num? id,
    int? categoryid,
    String? nameuz,
    String? nameru,
    String? nameen,
    String? nameoz,
    String? photo,
    Pivot? pivot,
  }) {
    return SubCategoryModel(
      id: id ?? this.id,
      categoryid: categoryid ?? this.categoryid,
      nameuz: nameuz ?? this.nameuz,
      nameru: nameru ?? this.nameru,
      nameen: nameen ?? this.nameen,
      nameoz: nameoz ?? this.nameoz,
      photo: photo ?? this.photo,
      pivot: pivot ?? this.pivot,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': categoryid,
      'name_uz': nameuz,
      'name_ru': nameru,
      'name_en': nameen,
      'name_oz': nameoz,
      'photo': photo,
      'pivot': pivot?.toMap(),
    };
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['id'],
      categoryid: map['category_id']?.toInt(),
      nameuz: map['name_uz'],
      nameru: map['name_ru'],
      nameen: map['name_en'],
      nameoz: map['name_oz'],
      photo: map['photo'],
      pivot: map['pivot'] != null ? Pivot.fromMap(map['pivot']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModel.fromJson(String source) =>
      SubCategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubCategoryModel(id: $id, category_id: $categoryid, name_uz: $nameuz, name_ru: $nameru, name_en: $nameen, name_oz: $nameoz, photo: $photo, pivot: $pivot)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubCategoryModel &&
        other.id == id &&
        other.categoryid == categoryid &&
        other.nameuz == nameuz &&
        other.nameru == nameru &&
        other.nameen == nameen &&
        other.nameoz == nameoz &&
        other.photo == photo &&
        other.pivot == pivot;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryid.hashCode ^
        nameuz.hashCode ^
        nameru.hashCode ^
        nameen.hashCode ^
        nameoz.hashCode ^
        photo.hashCode ^
        pivot.hashCode;
  }
}
