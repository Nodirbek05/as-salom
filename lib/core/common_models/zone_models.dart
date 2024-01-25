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
  String? nameru;
  String? nameuz;
  String? nameen;
  String? nameoz;
  String? createdat;
  String? updatedat;
  ZoneData({
    this.id,
    this.nameru,
    this.nameuz,
    this.nameen,
    this.nameoz,
    this.createdat,
    this.updatedat,
  });

  ZoneData copyWith({
    num? id,
    String? nameru,
    String? nameuz,
    String? nameen,
    String? nameoz,
    String? createdat,
    String? updatedat,
  }) {
    return ZoneData(
      id: id ?? this.id,
      nameru: nameru ?? this.nameru,
      nameuz: nameuz ?? this.nameuz,
      nameen: nameen ?? this.nameen,
      nameoz: nameoz ?? this.nameoz,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_ru': nameru,
      'name_uz': nameuz,
      'name_en': nameen,
      'name_oz': nameoz,
      'created_at': createdat,
      'updated_at': updatedat,
    };
  }

  factory ZoneData.fromMap(Map<String, dynamic> map) {
    return ZoneData(
      id: map['id'],
      nameru: map['name_ru'],
      nameuz: map['name_uz'],
      nameen: map['name_en'],
      nameoz: map['name_oz'],
      createdat: map['created_at'],
      updatedat: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ZoneData.fromJson(String source) =>
      ZoneData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ZoneData(id: $id, name_ru: $nameru, name_uz: $nameuz, name_en: $nameen, name_oz: $nameoz, created_at: $createdat, updated_at: $updatedat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ZoneData &&
        other.id == id &&
        other.nameru == nameru &&
        other.nameuz == nameuz &&
        other.nameen == nameen &&
        other.nameoz == nameoz &&
        other.createdat == createdat &&
        other.updatedat == updatedat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nameru.hashCode ^
        nameuz.hashCode ^
        nameen.hashCode ^
        nameoz.hashCode ^
        createdat.hashCode ^
        updatedat.hashCode;
  }
}
