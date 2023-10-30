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
  
    if(data != null){
      result.addAll({'data': data!.toMap()});
    }
  
    return result;
  }

  factory SubcategoriesMainModel.fromMap(Map<String, dynamic> map) {
    return SubcategoriesMainModel(
      data: map['data'] != null ? SubCategoriesModel.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubcategoriesMainModel.fromJson(String source) => SubcategoriesMainModel.fromMap(json.decode(source));

  @override
  String toString() => 'SubcategoriesMainModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SubcategoriesMainModel &&
      other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class SubCategoriesModel extends ResponseData {
  num? id;
  String? name_uz;
  String? name_ru;
  String? name_en;
  List<SubCategoriesModel>? subcategories;
  SubCategoriesModel({
    this.id,
    this.name_uz,
    this.name_ru,
    this.name_en,
    this.subcategories,
  });

  SubCategoriesModel copyWith({
    num? id,
    String? name_uz,
    String? name_ru,
    String? name_en,
    List<SubCategoriesModel>? subcategories,
  }) {
    return SubCategoriesModel(
      id: id ?? this.id,
      name_uz: name_uz ?? this.name_uz,
      name_ru: name_ru ?? this.name_ru,
      name_en: name_en ?? this.name_en,
      subcategories: subcategories ?? this.subcategories,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name_uz != null) {
      result.addAll({'name_uz': name_uz});
    }
    if (name_ru != null) {
      result.addAll({'name_ru': name_ru});
    }
    if (name_en != null) {
      result.addAll({'name_en': name_en});
    }
    if (subcategories != null) {
      result.addAll(
          {'subcategories': subcategories!.map((x) => x?.toMap()).toList()});
    }

    return result;
  }

  factory SubCategoriesModel.fromMap(Map<String, dynamic> map) {
    return SubCategoriesModel(
      id: map['id'],
      name_uz: map['name_uz'],
      name_ru: map['name_ru'],
      name_en: map['name_en'],
      subcategories: map['subcategories'] != null
          ? List<SubCategoriesModel>.from(
              map['subcategories']?.map((x) => SubCategoriesModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoriesModel.fromJson(String source) =>
      SubCategoriesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubCategoriesModel(id: $id, name_uz: $name_uz, name_ru: $name_ru, name_en: $name_en, subcategories: $subcategories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubCategoriesModel &&
        other.id == id &&
        other.name_uz == name_uz &&
        other.name_ru == name_ru &&
        other.name_en == name_en &&
        listEquals(other.subcategories, subcategories);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name_uz.hashCode ^
        name_ru.hashCode ^
        name_en.hashCode ^
        subcategories.hashCode;
  }
}

class SubcategoryModel {
  num? id;
  String? category_id;
  String? name_uz;
  String? name_ru;
  String? name_en;
  String? photo;
  Pivot? pivot;
  SubcategoryModel({
    this.id,
    this.category_id,
    this.name_uz,
    this.name_ru,
    this.name_en,
    this.photo,
    this.pivot,
  });

  SubcategoryModel copyWith({
    num? id,
    String? category_id,
    String? name_uz,
    String? name_ru,
    String? name_en,
    String? photo,
    Pivot? pivot,
  }) {
    return SubcategoryModel(
      id: id ?? this.id,
      category_id: category_id ?? this.category_id,
      name_uz: name_uz ?? this.name_uz,
      name_ru: name_ru ?? this.name_ru,
      name_en: name_en ?? this.name_en,
      photo: photo ?? this.photo,
      pivot: pivot ?? this.pivot,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (category_id != null) {
      result.addAll({'category_id': category_id});
    }
    if (name_uz != null) {
      result.addAll({'name_uz': name_uz});
    }
    if (name_ru != null) {
      result.addAll({'name_ru': name_ru});
    }
    if (name_en != null) {
      result.addAll({'name_en': name_en});
    }
    if (photo != null) {
      result.addAll({'photo': photo});
    }
    if (pivot != null) {
      result.addAll({'pivot': pivot!.toMap()});
    }

    return result;
  }

  factory SubcategoryModel.fromMap(Map<String, dynamic> map) {
    return SubcategoryModel(
      id: map['id'],
      category_id: map['category_id'],
      name_uz: map['name_uz'],
      name_ru: map['name_ru'],
      name_en: map['name_en'],
      photo: map['photo'],
      pivot: map['pivot'] != null ? Pivot.fromMap(map['pivot']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubcategoryModel.fromJson(String source) =>
      SubcategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubcategoryModel(id: $id, category_id: $category_id, name_uz: $name_uz, name_ru: $name_ru, name_en: $name_en, photo: $photo, pivot: $pivot)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubcategoryModel &&
        other.id == id &&
        other.category_id == category_id &&
        other.name_uz == name_uz &&
        other.name_ru == name_ru &&
        other.name_en == name_en &&
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
        photo.hashCode ^
        pivot.hashCode;
  }
}
