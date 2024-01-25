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
  String? nameru;
  String? nameuz;
  String? nameen;
  String? createdat;
  String? updatedat;
  BannerData({
    this.id,
    this.photo,
    this.link,
    this.nameru,
    this.nameuz,
    this.nameen,
    this.createdat,
    this.updatedat,
  });

  BannerData copyWith({
    num? id,
    String? photo,
    String? link,
    String? nameru,
    String? nameuz,
    String? nameen,
    String? createdat,
    String? updatedat,
  }) {
    return BannerData(
      id: id ?? this.id,
      photo: photo ?? this.photo,
      link: link ?? this.link,
      nameru: nameru ?? this.nameru,
      nameuz: nameuz ?? this.nameuz,
      nameen: nameen ?? this.nameen,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photo': photo,
      'link': link,
      'name_ru': nameru,
      'name_uz': nameuz,
      'name_en': nameen,
      'created_at': createdat,
      'updated_at': updatedat,
    };
  }

  factory BannerData.fromMap(Map<String, dynamic> map) {
    return BannerData(
      id: map['id'],
      photo: map['photo'],
      link: map['link'],
      nameru: map['name_ru'],
      nameuz: map['name_uz'],
      nameen: map['name_en'],
      createdat: map['created_at'],
      updatedat: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerData.fromJson(String source) =>
      BannerData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BannerData(id: $id, photo: $photo, link: $link, name_ru: $nameru, name_uz: $nameuz, name_en: $nameen, created_at: $createdat, updated_at: $updatedat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BannerData &&
        other.id == id &&
        other.photo == photo &&
        other.link == link &&
        other.nameru == nameru &&
        other.nameuz == nameuz &&
        other.nameen == nameen &&
        other.createdat == createdat &&
        other.updatedat == updatedat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        photo.hashCode ^
        link.hashCode ^
        nameru.hashCode ^
        nameuz.hashCode ^
        nameen.hashCode ^
        createdat.hashCode ^
        updatedat.hashCode;
  }
}
