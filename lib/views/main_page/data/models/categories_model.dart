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
  String? nameuz;
  String? nameen;
  String? nameru;
  String? nameoz;
  String? icon;
  String? photo;
  String? createdat;
  String? updatedat;
  List<SubCategoryModel>? subcategories;
  CategoryGoods? goods;
  CategoryDataModel({
    this.id,
    this.nameuz,
    this.nameen,
    this.nameru,
    this.nameoz,
    this.icon,
    this.photo,
    this.createdat,
    this.updatedat,
    this.subcategories,
    this.goods,
  });

  CategoryDataModel copyWith({
    num? id,
    String? nameuz,
    String? nameen,
    String? nameru,
    String? nameoz,
    String? icon,
    String? photo,
    String? createdat,
    String? updatedat,
    List<SubCategoryModel>? subcategories,
    CategoryGoods? goods,
  }) {
    return CategoryDataModel(
      id: id ?? this.id,
      nameuz: nameuz ?? this.nameuz,
      nameen: nameen ?? this.nameen,
      nameru: nameru ?? this.nameru,
      nameoz: nameoz ?? this.nameoz,
      icon: icon ?? this.icon,
      photo: photo ?? this.photo,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
      subcategories: subcategories ?? this.subcategories,
      goods: goods ?? this.goods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_uz': nameuz,
      'name_en': nameen,
      'name_ru': nameru,
      'name_oz': nameoz,
      'icon': icon,
      'photo': photo,
      'created_at': createdat,
      'updated_at': updatedat,
      'subcategories': subcategories?.map((x) => x.toMap()).toList(),
      'goods': goods?.toMap(),
    };
  }

  factory CategoryDataModel.fromMap(Map<String, dynamic> map) {
    return CategoryDataModel(
      id: map['id'],
      nameuz: map['name_uz'],
      nameen: map['name_en'],
      nameru: map['name_ru'],
      nameoz: map['name_oz'],
      icon: map['icon'],
      photo: map['photo'],
      createdat: map['created_at'],
      updatedat: map['updated_at'],
      subcategories: map['subcategories'] != null ? List<SubCategoryModel>.from(map['subcategories']?.map((x) => SubCategoryModel.fromMap(x))) : null,
      goods: map['goods'] != null ? CategoryGoods.fromMap(map['goods']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryDataModel.fromJson(String source) => CategoryDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryDataModel(id: $id, name_uz: $nameuz, name_en: $nameen, name_ru: $nameru, name_oz: $nameoz, icon: $icon, photo: $photo, created_at: $createdat, updated_at: $updatedat, subcategories: $subcategories, goods: $goods)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryDataModel &&
      other.id == id &&
      other.nameuz == nameuz &&
      other.nameen == nameen &&
      other.nameru == nameru &&
      other.nameoz == nameoz &&
      other.icon == icon &&
      other.photo == photo &&
      other.createdat == createdat &&
      other.updatedat == updatedat &&
      listEquals(other.subcategories, subcategories) &&
      other.goods == goods;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nameuz.hashCode ^
      nameen.hashCode ^
      nameru.hashCode ^
      nameoz.hashCode ^
      icon.hashCode ^
      photo.hashCode ^
      createdat.hashCode ^
      updatedat.hashCode ^
      subcategories.hashCode ^
      goods.hashCode;
  }
}

class CategoryGoods extends ResponseData {
  num? currentpage;
  String? firstpageurl;
  List<ProductModel>? data;
  List<LinksModel>? links;
  dynamic from;
  num? lastpage;
  String? lastpageurl;
  String? nextpageurl;
  String? path;
  num? perpage;
  String? prevpageurl;
  dynamic to;
  num? total;
  CategoryGoods({
    this.currentpage,
    this.firstpageurl,
    this.data,
    this.links,
    this.from,
    this.lastpage,
    this.lastpageurl,
    this.nextpageurl,
    this.path,
    this.perpage,
    this.prevpageurl,
    this.to,
    this.total,
  });

  CategoryGoods copyWith({
    num? currentpage,
    String? firstpageurl,
    List<ProductModel>? data,
    List<LinksModel>? links,
    dynamic from,
    num? lastpage,
    String? lastpageurl,
    String? nextpageurl,
    String? path,
    num? perpage,
    String? prevpageurl,
    dynamic to,
    num? total,
  }) {
    return CategoryGoods(
      currentpage: currentpage ?? this.currentpage,
      firstpageurl: firstpageurl ?? this.firstpageurl,
      data: data ?? this.data,
      links: links ?? this.links,
      from: from ?? this.from,
      lastpage: lastpage ?? this.lastpage,
      lastpageurl: lastpageurl ?? this.lastpageurl,
      nextpageurl: nextpageurl ?? this.nextpageurl,
      path: path ?? this.path,
      perpage: perpage ?? this.perpage,
      prevpageurl: prevpageurl ?? this.prevpageurl,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': currentpage,
      'first_page_url': firstpageurl,
      'data': data?.map((x) => x.toMap()).toList(),
      'links': links?.map((x) => x.toMap()).toList(),
      'from': from,
      'last_page': lastpage,
      'last_page_url': lastpageurl,
      'next_page_url': nextpageurl,
      'path': path,
      'per_page': perpage,
      'prev_page_url': prevpageurl,
      'to': to,
      'total': total,
    };
  }

  factory CategoryGoods.fromMap(Map<String, dynamic> map) {
    return CategoryGoods(
      currentpage: map['current_page'],
      firstpageurl: map['first_page_url'],
      data: map['data'] != null
          ? List<ProductModel>.from(
              map['data']?.map((x) => ProductModel.fromMap(x)))
          : null,
      links: map['links'] != null
          ? List<LinksModel>.from(
              map['links']?.map((x) => LinksModel.fromMap(x)))
          : null,
      from: map['from'] != null ? map['from'] : null,
      lastpage: map['last_page'],
      lastpageurl: map['last_page_url'],
      nextpageurl: map['next_page_url'],
      path: map['path'],
      perpage: map['per_page'],
      prevpageurl: map['prev_page_url'],
      to: map['to'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryGoods.fromJson(String source) =>
      CategoryGoods.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryGoods(current_page: $currentpage, first_page_url: $firstpageurl, data: $data, links: $links, from: $from, last_page: $lastpage, last_page_url: $lastpageurl, next_page_url: $nextpageurl, path: $path, per_page: $perpage, prev_page_url: $prevpageurl, to: $to, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryGoods &&
        other.currentpage == currentpage &&
        other.firstpageurl == firstpageurl &&
        listEquals(other.data, data) &&
        listEquals(other.links, links) &&
        other.from == from &&
        other.lastpage == lastpage &&
        other.lastpageurl == lastpageurl &&
        other.nextpageurl == nextpageurl &&
        other.path == path &&
        other.perpage == perpage &&
        other.prevpageurl == prevpageurl &&
        other.to == to &&
        other.total == total;
  }

  @override
  int get hashCode {
    return currentpage.hashCode ^
        firstpageurl.hashCode ^
        data.hashCode ^
        links.hashCode ^
        from.hashCode ^
        lastpage.hashCode ^
        lastpageurl.hashCode ^
        nextpageurl.hashCode ^
        path.hashCode ^
        perpage.hashCode ^
        prevpageurl.hashCode ^
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
