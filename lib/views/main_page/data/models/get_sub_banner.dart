import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:assalomproject/core/common_models/response_data.dart';

class GetSubBannersModel extends ResponseData {
  List<SubBanners>? data;
  GetSubBannersModel({
    this.data,
  });

  GetSubBannersModel copyWith({
    List<SubBanners>? data,
  }) {
    return GetSubBannersModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory GetSubBannersModel.fromMap(Map<String, dynamic> map) {
    return GetSubBannersModel(
      data: map['data'] != null
          ? List<SubBanners>.from(
              map['data']?.map((x) => SubBanners.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetSubBannersModel.fromJson(String source) =>
      GetSubBannersModel.fromMap(json.decode(source));

  @override
  String toString() => 'GetSubBannersModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetSubBannersModel && listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}

class SubBanners extends ResponseData {
  num? id;
  String? photo;
  String? link;
  String? nameru;
  String? nameoz;
  String? nameuz;
  String? nameen;
  String? createdat;
  String? updatedat;
  SubBanners({
    this.id,
    this.photo,
    this.link,
    this.nameru,
    this.nameoz,
    this.nameuz,
    this.nameen,
    this.createdat,
    this.updatedat,
  });

  SubBanners copyWith({
    num? id,
    String? photo,
    String? link,
    String? nameru,
    String? nameoz,
    String? nameuz,
    String? nameen,
    String? createdat,
    String? updatedat,
  }) {
    return SubBanners(
      id: id ?? this.id,
      photo: photo ?? this.photo,
      link: link ?? this.link,
      nameru: nameru ?? this.nameru,
      nameoz: nameoz ?? this.nameoz,
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
      'name_oz': nameoz,
      'name_uz': nameuz,
      'name_en': nameen,
      'created_at': createdat,
      'updated_at': updatedat,
    };
  }

  factory SubBanners.fromMap(Map<String, dynamic> map) {
    return SubBanners(
      id: map['id'],
      photo: map['photo'],
      link: map['link'],
      nameru: map['name_ru'],
      nameoz: map['name_oz'],
      nameuz: map['name_uz'],
      nameen: map['name_en'],
      createdat: map['created_at'],
      updatedat: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubBanners.fromJson(String source) =>
      SubBanners.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubBanners(id: $id, photo: $photo, link: $link, name_ru: $nameru, name_oz: $nameoz, name_uz: $nameuz, name_en: $nameen, created_at: $createdat, updated_at: $updatedat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubBanners &&
        other.id == id &&
        other.photo == photo &&
        other.link == link &&
        other.nameru == nameru &&
        other.nameoz == nameoz &&
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
        nameoz.hashCode ^
        nameuz.hashCode ^
        nameen.hashCode ^
        createdat.hashCode ^
        updatedat.hashCode;
  }
}
