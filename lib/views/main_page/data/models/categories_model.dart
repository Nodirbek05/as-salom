import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';
import 'package:assalomproject/views/main_page/data/models/sub_categories_model.dart';

class CategoriesModel extends ResponseData {
  List<CategoryDataModel> data;
  CategoriesModel({
    required this.data,
  });

  CategoriesModel copyWith({
    List<CategoryDataModel>? data,
  }) {
    return CategoriesModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': data.map((x) => x.toMap()).toList()});

    return result;
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      data: List<CategoryDataModel>.from(
          map['data']?.map((x) => CategoryDataModel.fromMap(x))),
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

    return other is CategoriesModel && listEquals(other.data, data);
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
  List<SubCategoryModel>? subcategories;
  CategoryGoods? goods;
  CategoryDataModel({
    this.id,
    this.name_uz,
    this.name_en,
    this.name_ru,
    this.icon,
    this.photo,
    this.created_at,
    this.updated_at,
    this.subcategories,
    this.goods,
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
    List<SubCategoryModel>? subcategories,
    CategoryGoods? goods,
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
      subcategories: subcategories ?? this.subcategories,
      goods: goods ?? this.goods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_uz': name_uz,
      'name_en': name_en,
      'name_ru': name_ru,
      'icon': icon,
      'photo': photo,
      'created_at': created_at,
      'updated_at': updated_at,
      'subcategories': subcategories?.map((x) => x.toMap()).toList(),
      'goods': goods?.toMap(),
    };
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
      subcategories: map['subcategories'] != null
          ? List<SubCategoryModel>.from(
              map['subcategories']?.map((x) => SubCategoryModel.fromMap(x)))
          : null,
      goods: map['goods'] != null ? CategoryGoods.fromMap(map['goods']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryDataModel.fromJson(String source) =>
      CategoryDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryDataModel(id: $id, name_uz: $name_uz, name_en: $name_en, name_ru: $name_ru, icon: $icon, photo: $photo, created_at: $created_at, updated_at: $updated_at, subcategories: $subcategories, goods: $goods)';
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
        other.updated_at == updated_at &&
        listEquals(other.subcategories, subcategories) &&
        other.goods == goods;
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
        updated_at.hashCode ^
        subcategories.hashCode ^
        goods.hashCode;
  }
}

class CategoryGoods extends ResponseData {
  num? current_page;
  String? first_page_url;
  List<ProductModel>? data;
  List<LinksModel>? links;
  dynamic from;
  num? last_page;
  String? last_page_url;
  String? next_page_url;
  String? path;
  num? per_page;
  String? prev_page_url;
  dynamic to;
  num? total;
  CategoryGoods({
    this.current_page,
    this.first_page_url,
    this.data,
    this.links,
    this.from,
    this.last_page,
    this.last_page_url,
    this.next_page_url,
    this.path,
    this.per_page,
    this.prev_page_url,
    this.to,
    this.total,
  });

  CategoryGoods copyWith({
    num? current_page,
    String? first_page_url,
    List<ProductModel>? data,
    List<LinksModel>? links,
    dynamic from,
    num? last_page,
    String? last_page_url,
    String? next_page_url,
    String? path,
    num? per_page,
    String? prev_page_url,
    dynamic to,
    num? total,
  }) {
    return CategoryGoods(
      current_page: current_page ?? this.current_page,
      first_page_url: first_page_url ?? this.first_page_url,
      data: data ?? this.data,
      links: links ?? this.links,
      from: from ?? this.from,
      last_page: last_page ?? this.last_page,
      last_page_url: last_page_url ?? this.last_page_url,
      next_page_url: next_page_url ?? this.next_page_url,
      path: path ?? this.path,
      per_page: per_page ?? this.per_page,
      prev_page_url: prev_page_url ?? this.prev_page_url,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': current_page,
      'first_page_url': first_page_url,
      'data': data?.map((x) => x.toMap()).toList(),
      'links': links?.map((x) => x.toMap()).toList(),
      'from': from,
      'last_page': last_page,
      'last_page_url': last_page_url,
      'next_page_url': next_page_url,
      'path': path,
      'per_page': per_page,
      'prev_page_url': prev_page_url,
      'to': to,
      'total': total,
    };
  }

  factory CategoryGoods.fromMap(Map<String, dynamic> map) {
    return CategoryGoods(
      current_page: map['current_page'],
      first_page_url: map['first_page_url'],
      data: map['data'] != null
          ? List<ProductModel>.from(
              map['data']?.map((x) => ProductModel.fromMap(x)))
          : null,
      links: map['links'] != null
          ? List<LinksModel>.from(
              map['links']?.map((x) => LinksModel.fromMap(x)))
          : null,
      from: map['from'] != null ? map['from'] : null,
      last_page: map['last_page'],
      last_page_url: map['last_page_url'],
      next_page_url: map['next_page_url'],
      path: map['path'],
      per_page: map['per_page'],
      prev_page_url: map['prev_page_url'],
      to: map['to'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryGoods.fromJson(String source) =>
      CategoryGoods.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryGoods(current_page: $current_page, first_page_url: $first_page_url, data: $data, links: $links, from: $from, last_page: $last_page, last_page_url: $last_page_url, next_page_url: $next_page_url, path: $path, per_page: $per_page, prev_page_url: $prev_page_url, to: $to, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryGoods &&
        other.current_page == current_page &&
        other.first_page_url == first_page_url &&
        listEquals(other.data, data) &&
        listEquals(other.links, links) &&
        other.from == from &&
        other.last_page == last_page &&
        other.last_page_url == last_page_url &&
        other.next_page_url == next_page_url &&
        other.path == path &&
        other.per_page == per_page &&
        other.prev_page_url == prev_page_url &&
        other.to == to &&
        other.total == total;
  }

  @override
  int get hashCode {
    return current_page.hashCode ^
        first_page_url.hashCode ^
        data.hashCode ^
        links.hashCode ^
        from.hashCode ^
        last_page.hashCode ^
        last_page_url.hashCode ^
        next_page_url.hashCode ^
        path.hashCode ^
        per_page.hashCode ^
        prev_page_url.hashCode ^
        to.hashCode ^
        total.hashCode;
  }
}

class LinksModel extends ResponseData {
  String? url;
  String? label;
  bool? active;
  LinksModel({
    this.url,
    this.label,
    this.active,
  });

  LinksModel copyWith({
    String? url,
    String? label,
    bool? active,
  }) {
    return LinksModel(
      url: url ?? this.url,
      label: label ?? this.label,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'label': label,
      'active': active,
    };
  }

  factory LinksModel.fromMap(Map<String, dynamic> map) {
    return LinksModel(
      url: map['url'],
      label: map['label'],
      active: map['active'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LinksModel.fromJson(String source) =>
      LinksModel.fromMap(json.decode(source));

  @override
  String toString() => 'LinksModel(url: $url, label: $label, active: $active)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LinksModel &&
        other.url == url &&
        other.label == label &&
        other.active == active;
  }

  @override
  int get hashCode => url.hashCode ^ label.hashCode ^ active.hashCode;
}
