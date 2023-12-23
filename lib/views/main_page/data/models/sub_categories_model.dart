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
  String? name_uz;
  String? name_ru;
  String? name_en;
  String? name_oz;
  List<SubCategoryModel>? subcategories;
  SubCategoriesModel({
    this.id,
    this.name_uz,
    this.name_ru,
    this.name_en,
    this.name_oz,
    this.subcategories,
  });

  SubCategoriesModel copyWith({
    num? id,
    String? name_uz,
    String? name_ru,
    String? name_en,
    String? name_oz,
    List<SubCategoryModel>? subcategories,
  }) {
    return SubCategoriesModel(
      id: id ?? this.id,
      name_uz: name_uz ?? this.name_uz,
      name_ru: name_ru ?? this.name_ru,
      name_en: name_en ?? this.name_en,
      name_oz: name_oz ?? this.name_oz,
      subcategories: subcategories ?? this.subcategories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_uz': name_uz,
      'name_ru': name_ru,
      'name_en': name_en,
      'name_oz': name_oz,
      'subcategories': subcategories?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory SubCategoriesModel.fromMap(Map<String, dynamic> map) {
    return SubCategoriesModel(
      id: map['id'],
      name_uz: map['name_uz'],
      name_ru: map['name_ru'],
      name_en: map['name_en'],
      name_oz: map['name_oz'],
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
    return 'SubCategoriesModel(id: $id, name_uz: $name_uz, name_ru: $name_ru, name_en: $name_en, name_oz: $name_oz, subcategories: $subcategories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubCategoriesModel &&
        other.id == id &&
        other.name_uz == name_uz &&
        other.name_ru == name_ru &&
        other.name_en == name_en &&
        other.name_oz == name_oz &&
        listEquals(other.subcategories, subcategories);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name_uz.hashCode ^
        name_ru.hashCode ^
        name_en.hashCode ^
        name_oz.hashCode ^
        subcategories.hashCode;
  }
}

class SubCategoryModel {
  num? id;
  int? category_id;
  String? name_uz;
  String? name_ru;
  String? name_en;
  String? name_oz;
  String? photo;
  Pivot? pivot;
  SubCategoryModel({
    this.id,
    this.category_id,
    this.name_uz,
    this.name_ru,
    this.name_en,
    this.name_oz,
    this.photo,
    this.pivot,
  });

  SubCategoryModel copyWith({
    num? id,
    int? category_id,
    String? name_uz,
    String? name_ru,
    String? name_en,
    String? name_oz,
    String? photo,
    Pivot? pivot,
  }) {
    return SubCategoryModel(
      id: id ?? this.id,
      category_id: category_id ?? this.category_id,
      name_uz: name_uz ?? this.name_uz,
      name_ru: name_ru ?? this.name_ru,
      name_en: name_en ?? this.name_en,
      name_oz: name_oz ?? this.name_oz,
      photo: photo ?? this.photo,
      pivot: pivot ?? this.pivot,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': category_id,
      'name_uz': name_uz,
      'name_ru': name_ru,
      'name_en': name_en,
      'name_oz': name_oz,
      'photo': photo,
      'pivot': pivot?.toMap(),
    };
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['id'],
      category_id: map['category_id']?.toInt(),
      name_uz: map['name_uz'],
      name_ru: map['name_ru'],
      name_en: map['name_en'],
      name_oz: map['name_oz'],
      photo: map['photo'],
      pivot: map['pivot'] != null ? Pivot.fromMap(map['pivot']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModel.fromJson(String source) =>
      SubCategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubCategoryModel(id: $id, category_id: $category_id, name_uz: $name_uz, name_ru: $name_ru, name_en: $name_en, name_oz: $name_oz, photo: $photo, pivot: $pivot)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubCategoryModel &&
        other.id == id &&
        other.category_id == category_id &&
        other.name_uz == name_uz &&
        other.name_ru == name_ru &&
        other.name_en == name_en &&
        other.name_oz == name_oz &&
        other.photo == photo &&
        other.pivot == pivot;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category_id.hashCode ^
        name_uz.hashCode ^
        name_ru.hashCode ^
        name_en.hashCode ^
        name_oz.hashCode ^
        photo.hashCode ^
        pivot.hashCode;
  }
}
