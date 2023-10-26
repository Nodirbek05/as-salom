import 'dart:convert';

import 'package:assalomproject/core/common_models/response_data.dart';

class CategoriesModel extends ResponseData {
  CategoryDataModel data;
  CategoriesModel({
    required this.data,
  });

  CategoriesModel copyWith({
    CategoryDataModel? data,
  }) {
    return CategoriesModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': data.toMap()});

    return result;
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      data: CategoryDataModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoriesModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriesModel && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class CategoryDataModel {
  num? id;
  String? name_uz;
  String? name_en;
  String? name_ru;
  String? icon;
  String? photo;
  String? created_at;
  String? updated_at;
  CategoryDataModel({
    this.id,
    this.name_uz,
    this.name_en,
    this.name_ru,
    this.icon,
    this.photo,
    this.created_at,
    this.updated_at,
  });

  CategoryDataModel copyWith({
    num? id,
    String? name_uz,
    String? name_en,
    String? name_ru,
    String? icon,
    String? photo,
    String? created_at,
    String? updated_at,
  }) {
    return CategoryDataModel(
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
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name_uz != null) {
      result.addAll({'name_uz': name_uz});
    }
    if (name_en != null) {
      result.addAll({'name_en': name_en});
    }
    if (name_ru != null) {
      result.addAll({'name_ru': name_ru});
    }
    if (icon != null) {
      result.addAll({'icon': icon});
    }
    if (photo != null) {
      result.addAll({'photo': photo});
    }
    if (created_at != null) {
      result.addAll({'created_at': created_at});
    }
    if (updated_at != null) {
      result.addAll({'updated_at': updated_at});
    }

    return result;
  }

  factory CategoryDataModel.fromMap(Map<String, dynamic> map) {
    return CategoryDataModel(
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

  factory CategoryDataModel.fromJson(String source) =>
      CategoryDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryDataModel(id: $id, name_uz: $name_uz, name_en: $name_en, name_ru: $name_ru, icon: $icon, photo: $photo, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryDataModel &&
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
