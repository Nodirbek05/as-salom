import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:assalomproject/core/common_models/response_data.dart';

class GetAllBanners extends ResponseData {
  List<BannerData>? data;
  GetAllBanners({
    this.data,
  });

  GetAllBanners copyWith({
    List<BannerData>? data,
  }) {
    return GetAllBanners(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory GetAllBanners.fromMap(Map<String, dynamic> map) {
    return GetAllBanners(
      data: map['data'] != null
          ? List<BannerData>.from(
              map['data']?.map((x) => BannerData.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAllBanners.fromJson(String source) =>
      GetAllBanners.fromMap(json.decode(source));

  @override
  String toString() => 'GetAllBanners(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetAllBanners && listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}

class BannerData extends ResponseData {
  num? id;
  String? photo;
  String? link;
  String? name_ru;
  String? name_uz;
  String? name_en;
  String? created_at;
  String? updated_at;
  BannerData({
    this.id,
    this.photo,
    this.link,
    this.name_ru,
    this.name_uz,
    this.name_en,
    this.created_at,
    this.updated_at,
  });

  BannerData copyWith({
    num? id,
    String? photo,
    String? link,
    String? name_ru,
    String? name_uz,
    String? name_en,
    String? created_at,
    String? updated_at,
  }) {
    return BannerData(
      id: id ?? this.id,
      photo: photo ?? this.photo,
      link: link ?? this.link,
      name_ru: name_ru ?? this.name_ru,
      name_uz: name_uz ?? this.name_uz,
      name_en: name_en ?? this.name_en,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photo': photo,
      'link': link,
      'name_ru': name_ru,
      'name_uz': name_uz,
      'name_en': name_en,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory BannerData.fromMap(Map<String, dynamic> map) {
    return BannerData(
      id: map['id'],
      photo: map['photo'],
      link: map['link'],
      name_ru: map['name_ru'],
      name_uz: map['name_uz'],
      name_en: map['name_en'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerData.fromJson(String source) =>
      BannerData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BannerData(id: $id, photo: $photo, link: $link, name_ru: $name_ru, name_uz: $name_uz, name_en: $name_en, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BannerData &&
        other.id == id &&
        other.photo == photo &&
        other.link == link &&
        other.name_ru == name_ru &&
        other.name_uz == name_uz &&
        other.name_en == name_en &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        photo.hashCode ^
        link.hashCode ^
        name_ru.hashCode ^
        name_uz.hashCode ^
        name_en.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
