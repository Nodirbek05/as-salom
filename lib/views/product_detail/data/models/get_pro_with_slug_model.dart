import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';

class GetProWithSlugModel extends ResponseData {
  ProductModel? good;
  List<RandomGoods>? randomgoods;
  GetProWithSlugModel({
    this.good,
    this.randomgoods,
  });

  GetProWithSlugModel copyWith({
    ProductModel? good,
    List<RandomGoods>? randomgoods,
  }) {
    return GetProWithSlugModel(
      good: good ?? this.good,
      randomgoods: randomgoods ?? this.randomgoods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'good': good?.toMap(),
      'random_goods': randomgoods?.map((x) => x.toMap()).toList(),
    };
  }

  factory GetProWithSlugModel.fromMap(Map<String, dynamic> map) {
    return GetProWithSlugModel(
      good: map['good'] != null ? ProductModel.fromMap(map['good']) : null,
      randomgoods: map['random_goods'] != null ? List<RandomGoods>.from(map['random_goods']?.map((x) => RandomGoods.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetProWithSlugModel.fromJson(String source) => GetProWithSlugModel.fromMap(json.decode(source));

  @override
  String toString() => 'GetProWithSlugModel(good: $good, random_goods: $randomgoods)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GetProWithSlugModel &&
      other.good == good &&
      listEquals(other.randomgoods, randomgoods);
  }

  @override
  int get hashCode => good.hashCode ^ randomgoods.hashCode;
}

class RandomGoods extends ResponseData {
  num? id;
  num? typegood;
  dynamic categoryid;
  dynamic subcategoryid;
  String? nameru;
  String? nameuz;
  String? nameen;
  String? slug;
  dynamic price;
  dynamic discount;
  String? weight;
  String? weightmax;
  String? ikpu;
  String? barcode;
  String? nds;
  String? descru;
  String? descuz;
  String? descen;
  List<String>? photo;
  String? createdat;
  String? updatedat;
  num? quantity;
  dynamic weightbruto;
  List<SizeData>? sizes;
  RandomGoods({
    this.id,
    this.typegood,
    this.categoryid,
    this.subcategoryid,
    this.nameru,
    this.nameuz,
    this.nameen,
    this.slug,
    this.price,
    this.discount,
    this.weight,
    this.weightmax,
    this.ikpu,
    this.barcode,
    this.nds,
    this.descru,
    this.descuz,
    this.descen,
    this.photo,
    this.createdat,
    this.updatedat,
    this.quantity,
    this.weightbruto,
    this.sizes,
  });

  RandomGoods copyWith({
    num? id,
    num? typegood,
    dynamic categoryid,
    dynamic subcategoryid,
    String? nameru,
    String? nameuz,
    String? nameen,
    String? slug,
    dynamic price,
    dynamic discount,
    String? weight,
    String? weightmax,
    String? ikpu,
    String? barcode,
    String? nds,
    String? descru,
    String? descuz,
    String? descen,
    List<String>? photo,
    String? createdat,
    String? updatedat,
    num? quantity,
    dynamic weightbruto,
    List<SizeData>? sizes,
  }) {
    return RandomGoods(
      id: id ?? this.id,
      typegood: typegood ?? this.typegood,
      categoryid: categoryid ?? this.categoryid,
      subcategoryid: subcategoryid ?? this.subcategoryid,
      nameru: nameru ?? this.nameru,
      nameuz: nameuz ?? this.nameuz,
      nameen: nameen ?? this.nameen,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      weight: weight ?? this.weight,
      weightmax: weightmax ?? this.weightmax,
      ikpu: ikpu ?? this.ikpu,
      barcode: barcode ?? this.barcode,
      nds: nds ?? this.nds,
      descru: descru ?? this.descru,
      descuz: descuz ?? this.descuz,
      descen: descen ?? this.descen,
      photo: photo ?? this.photo,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
      quantity: quantity ?? this.quantity,
      weightbruto: weightbruto ?? this.weightbruto,
      sizes: sizes ?? this.sizes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type_good': typegood,
      'category_id': categoryid,
      'subcategory_id': subcategoryid,
      'name_ru': nameru,
      'name_uz': nameuz,
      'name_en': nameen,
      'slug': slug,
      'price': price,
      'discount': discount,
      'weight': weight,
      'weight_max': weightmax,
      'ikpu': ikpu,
      'barcode': barcode,
      'nds': nds,
      'desc_ru': descru,
      'desc_uz': descuz,
      'desc_en': descen,
      'photo': photo,
      'created_at': createdat,
      'updated_at': updatedat,
      'quantity': quantity,
      'weight_bruto': weightbruto,
      'sizes': sizes?.map((x) => x.toMap()).toList(),
    };
  }

  factory RandomGoods.fromMap(Map<String, dynamic> map) {
    return RandomGoods(
      id: map['id'],
      typegood: map['type_good'],
      categoryid: map['category_id'],
      subcategoryid: map['subcategory_id'],
      nameru: map['name_ru'],
      nameuz: map['name_uz'],
      nameen: map['name_en'],
      slug: map['slug'],
      price: map['price'],
      discount: map['discount'],
      weight: map['weight'],
      weightmax: map['weight_max'],
      ikpu: map['ikpu'],
      barcode: map['barcode'],
      nds: map['nds'],
      descru: map['desc_ru'],
      descuz: map['desc_uz'],
      descen: map['desc_en'],
      photo: List<String>.from(map['photo']),
      createdat: map['created_at'],
      updatedat: map['updated_at'],
      quantity: map['quantity'],
      weightbruto: map['weight_bruto'],
      sizes: map['sizes'] != null
          ? List<SizeData>.from(map['sizes']?.map((x) => SizeData.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RandomGoods.fromJson(String source) =>
      RandomGoods.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RandomGoods(id: $id, type_good: $typegood, category_id: $categoryid, subcategory_id: $subcategoryid, name_ru: $nameru, name_uz: $nameuz, name_en: $nameen, slug: $slug, price: $price, discount: $discount, weight: $weight, weight_max: $weightmax, ikpu: $ikpu, barcode: $barcode, nds: $nds, desc_ru: $descru, desc_uz: $descuz, desc_en: $descen, photo: $photo, created_at: $createdat, updated_at: $updatedat, quantity: $quantity, weight_bruto: $weightbruto, sizes: $sizes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RandomGoods &&
        other.id == id &&
        other.typegood == typegood &&
        other.categoryid == categoryid &&
        other.subcategoryid == subcategoryid &&
        other.nameru == nameru &&
        other.nameuz == nameuz &&
        other.nameen == nameen &&
        other.slug == slug &&
        other.price == price &&
        other.discount == discount &&
        other.weight == weight &&
        other.weightmax == weightmax &&
        other.ikpu == ikpu &&
        other.barcode == barcode &&
        other.nds == nds &&
        other.descru == descru &&
        other.descuz == descuz &&
        other.descen == descen &&
        listEquals(other.photo, photo) &&
        other.createdat == createdat &&
        other.updatedat == updatedat &&
        other.quantity == quantity &&
        other.weightbruto == weightbruto &&
        listEquals(other.sizes, sizes);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        typegood.hashCode ^
        categoryid.hashCode ^
        subcategoryid.hashCode ^
        nameru.hashCode ^
        nameuz.hashCode ^
        nameen.hashCode ^
        slug.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        weight.hashCode ^
        weightmax.hashCode ^
        ikpu.hashCode ^
        barcode.hashCode ^
        nds.hashCode ^
        descru.hashCode ^
        descuz.hashCode ^
        descen.hashCode ^
        photo.hashCode ^
        createdat.hashCode ^
        updatedat.hashCode ^
        quantity.hashCode ^
        weightbruto.hashCode ^
        sizes.hashCode;
  }
}

class SizeData extends ResponseData {
  num? id;
  String? nameru;
  String? number;
  String? createdat;
  String? updatedat;
  PivotData? pivot;
  SizeData({
    this.id,
    this.nameru,
    this.number,
    this.createdat,
    this.updatedat,
    this.pivot,
  });

  SizeData copyWith({
    num? id,
    String? nameru,
    String? number,
    String? createdat,
    String? updatedat,
    PivotData? pivot,
  }) {
    return SizeData(
      id: id ?? this.id,
      nameru: nameru ?? this.nameru,
      number: number ?? this.number,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
      pivot: pivot ?? this.pivot,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_ru': nameru,
      'number': number,
      'created_at': createdat,
      'updated_at': updatedat,
      'pivot': pivot?.toMap(),
    };
  }

  factory SizeData.fromMap(Map<String, dynamic> map) {
    return SizeData(
      id: map['id'],
      nameru: map['name_ru'],
      number: map['number'],
      createdat: map['created_at'],
      updatedat: map['updated_at'],
      pivot: map['pivot'] != null ? PivotData.fromMap(map['pivot']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SizeData.fromJson(String source) =>
      SizeData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SizeData(id: $id, name_ru: $nameru, number: $number, created_at: $createdat, updated_at: $updatedat, pivot: $pivot)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SizeData &&
        other.id == id &&
        other.nameru == nameru &&
        other.number == number &&
        other.createdat == createdat &&
        other.updatedat == updatedat &&
        other.pivot == pivot;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nameru.hashCode ^
        number.hashCode ^
        createdat.hashCode ^
        updatedat.hashCode ^
        pivot.hashCode;
  }
}

class PivotData extends ResponseData {
  dynamic goodid;
  dynamic sizeid;
  dynamic price;
  dynamic quantity;
  PivotData({
    this.goodid,
    this.sizeid,
    this.price,
    this.quantity,
  });

  PivotData copyWith({
    dynamic goodid,
    dynamic sizeid,
    dynamic price,
    dynamic quantity,
  }) {
    return PivotData(
      goodid: goodid ?? this.goodid,
      sizeid: sizeid ?? this.sizeid,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'good_id': goodid,
      'size_id': sizeid,
      'price': price,
      'quantity': quantity,
    };
  }

  factory PivotData.fromMap(Map<String, dynamic> map) {
    return PivotData(
      goodid: map['good_id'],
      sizeid: map['size_id'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PivotData.fromJson(String source) =>
      PivotData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PivotData(good_id: $goodid, size_id: $sizeid, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PivotData &&
        other.goodid == goodid &&
        other.sizeid == sizeid &&
        other.price == price &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return goodid.hashCode ^
        sizeid.hashCode ^
        price.hashCode ^
        quantity.hashCode;
  }
}
