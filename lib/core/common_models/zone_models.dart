import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:assalomproject/core/common_models/response_data.dart';

class ZoneModels extends ResponseData {
  List<ZoneData> data;
  ZoneModels({
    required this.data,
  });

  ZoneModels copyWith({
    List<ZoneData>? data,
  }) {
    return ZoneModels(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory ZoneModels.fromMap(Map<String, dynamic> map) {
    return ZoneModels(
      data: List<ZoneData>.from(map['data']?.map((x) => ZoneData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ZoneModels.fromJson(String source) =>
      ZoneModels.fromMap(json.decode(source));

  @override
  String toString() => 'ZoneModels(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ZoneModels && listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}

class ZoneData extends ResponseData {
  num? id;
  String? name_ru;
  String? name_uz;
  String? name_en;
  String? name_oz;
  String? created_at;
  String? updated_at;
  ZoneData({
    this.id,
    this.name_ru,
    this.name_uz,
    this.name_en,
    this.name_oz,
    this.created_at,
    this.updated_at,
  });

  ZoneData copyWith({
    num? id,
    String? name_ru,
    String? name_uz,
    String? name_en,
    String? name_oz,
    String? created_at,
    String? updated_at,
  }) {
    return ZoneData(
      id: id ?? this.id,
      name_ru: name_ru ?? this.name_ru,
      name_uz: name_uz ?? this.name_uz,
      name_en: name_en ?? this.name_en,
      name_oz: name_oz ?? this.name_oz,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_ru': name_ru,
      'name_uz': name_uz,
      'name_en': name_en,
      'name_oz': name_oz,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory ZoneData.fromMap(Map<String, dynamic> map) {
    return ZoneData(
      id: map['id'],
      name_ru: map['name_ru'],
      name_uz: map['name_uz'],
      name_en: map['name_en'],
      name_oz: map['name_oz'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ZoneData.fromJson(String source) =>
      ZoneData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ZoneData(id: $id, name_ru: $name_ru, name_uz: $name_uz, name_en: $name_en, name_oz: $name_oz, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ZoneData &&
        other.id == id &&
        other.name_ru == name_ru &&
        other.name_uz == name_uz &&
        other.name_en == name_en &&
        other.name_oz == name_oz &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name_ru.hashCode ^
        name_uz.hashCode ^
        name_en.hashCode ^
        name_oz.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
