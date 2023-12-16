import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/main_page/data/models/spesific_products.dart';

class GetProWithSlugModel extends ResponseData {
  ProductModel? good;
  List<RandomGoods>? random_goods;
  GetProWithSlugModel({
    this.good,
    this.random_goods,
  });

  GetProWithSlugModel copyWith({
    ProductModel? good,
    List<RandomGoods>? random_goods,
  }) {
    return GetProWithSlugModel(
      good: good ?? this.good,
      random_goods: random_goods ?? this.random_goods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'good': good?.toMap(),
      'random_goods': random_goods?.map((x) => x.toMap()).toList(),
    };
  }

  factory GetProWithSlugModel.fromMap(Map<String, dynamic> map) {
    return GetProWithSlugModel(
      good: map['good'] != null ? ProductModel.fromMap(map['good']) : null,
      random_goods: map['random_goods'] != null ? List<RandomGoods>.from(map['random_goods']?.map((x) => RandomGoods.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetProWithSlugModel.fromJson(String source) => GetProWithSlugModel.fromMap(json.decode(source));

  @override
  String toString() => 'GetProWithSlugModel(good: $good, random_goods: $random_goods)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GetProWithSlugModel &&
      other.good == good &&
      listEquals(other.random_goods, random_goods);
  }

  @override
  int get hashCode => good.hashCode ^ random_goods.hashCode;
}

class RandomGoods extends ResponseData {
  num? id;
  num? type_good;
  String? category_id;
  String? subcategory_id;
  String? name_ru;
  String? name_uz;
  String? name_en;
  String? slug;
  String? price;
  dynamic? discount;
  String? weight;
  String? weight_max;
  String? ikpu;
  String? barcode;
  String? nds;
  String? desc_ru;
  String? desc_uz;
  String? desc_en;
  List<String>? photo;
  String? created_at;
  String? updated_at;
  num? quantity;
  String? weight_bruto;
  List<SizeData>? sizes;
  RandomGoods({
    this.id,
    this.type_good,
    this.category_id,
    this.subcategory_id,
    this.name_ru,
    this.name_uz,
    this.name_en,
    this.slug,
    this.price,
    this.discount,
    this.weight,
    this.weight_max,
    this.ikpu,
    this.barcode,
    this.nds,
    this.desc_ru,
    this.desc_uz,
    this.desc_en,
    this.photo,
    this.created_at,
    this.updated_at,
    this.quantity,
    this.weight_bruto,
    this.sizes,
  });

  RandomGoods copyWith({
    num? id,
    num? type_good,
    String? category_id,
    String? subcategory_id,
    String? name_ru,
    String? name_uz,
    String? name_en,
    String? slug,
    String? price,
    dynamic? discount,
    String? weight,
    String? weight_max,
    String? ikpu,
    String? barcode,
    String? nds,
    String? desc_ru,
    String? desc_uz,
    String? desc_en,
    List<String>? photo,
    String? created_at,
    String? updated_at,
    num? quantity,
    String? weight_bruto,
    List<SizeData>? sizes,
  }) {
    return RandomGoods(
      id: id ?? this.id,
      type_good: type_good ?? this.type_good,
      category_id: category_id ?? this.category_id,
      subcategory_id: subcategory_id ?? this.subcategory_id,
      name_ru: name_ru ?? this.name_ru,
      name_uz: name_uz ?? this.name_uz,
      name_en: name_en ?? this.name_en,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      weight: weight ?? this.weight,
      weight_max: weight_max ?? this.weight_max,
      ikpu: ikpu ?? this.ikpu,
      barcode: barcode ?? this.barcode,
      nds: nds ?? this.nds,
      desc_ru: desc_ru ?? this.desc_ru,
      desc_uz: desc_uz ?? this.desc_uz,
      desc_en: desc_en ?? this.desc_en,
      photo: photo ?? this.photo,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      quantity: quantity ?? this.quantity,
      weight_bruto: weight_bruto ?? this.weight_bruto,
      sizes: sizes ?? this.sizes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type_good': type_good,
      'category_id': category_id,
      'subcategory_id': subcategory_id,
      'name_ru': name_ru,
      'name_uz': name_uz,
      'name_en': name_en,
      'slug': slug,
      'price': price,
      'discount': discount,
      'weight': weight,
      'weight_max': weight_max,
      'ikpu': ikpu,
      'barcode': barcode,
      'nds': nds,
      'desc_ru': desc_ru,
      'desc_uz': desc_uz,
      'desc_en': desc_en,
      'photo': photo,
      'created_at': created_at,
      'updated_at': updated_at,
      'quantity': quantity,
      'weight_bruto': weight_bruto,
      'sizes': sizes?.map((x) => x.toMap()).toList(),
    };
  }

  factory RandomGoods.fromMap(Map<String, dynamic> map) {
    return RandomGoods(
      id: map['id'],
      type_good: map['type_good'],
      category_id: map['category_id'],
      subcategory_id: map['subcategory_id'],
      name_ru: map['name_ru'],
      name_uz: map['name_uz'],
      name_en: map['name_en'],
      slug: map['slug'],
      price: map['price'],
      discount: map['discount'],
      weight: map['weight'],
      weight_max: map['weight_max'],
      ikpu: map['ikpu'],
      barcode: map['barcode'],
      nds: map['nds'],
      desc_ru: map['desc_ru'],
      desc_uz: map['desc_uz'],
      desc_en: map['desc_en'],
      photo: List<String>.from(map['photo']),
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      quantity: map['quantity'],
      weight_bruto: map['weight_bruto'],
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
    return 'RandomGoods(id: $id, type_good: $type_good, category_id: $category_id, subcategory_id: $subcategory_id, name_ru: $name_ru, name_uz: $name_uz, name_en: $name_en, slug: $slug, price: $price, discount: $discount, weight: $weight, weight_max: $weight_max, ikpu: $ikpu, barcode: $barcode, nds: $nds, desc_ru: $desc_ru, desc_uz: $desc_uz, desc_en: $desc_en, photo: $photo, created_at: $created_at, updated_at: $updated_at, quantity: $quantity, weight_bruto: $weight_bruto, sizes: $sizes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RandomGoods &&
        other.id == id &&
        other.type_good == type_good &&
        other.category_id == category_id &&
        other.subcategory_id == subcategory_id &&
        other.name_ru == name_ru &&
        other.name_uz == name_uz &&
        other.name_en == name_en &&
        other.slug == slug &&
        other.price == price &&
        other.discount == discount &&
        other.weight == weight &&
        other.weight_max == weight_max &&
        other.ikpu == ikpu &&
        other.barcode == barcode &&
        other.nds == nds &&
        other.desc_ru == desc_ru &&
        other.desc_uz == desc_uz &&
        other.desc_en == desc_en &&
        listEquals(other.photo, photo) &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.quantity == quantity &&
        other.weight_bruto == weight_bruto &&
        listEquals(other.sizes, sizes);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type_good.hashCode ^
        category_id.hashCode ^
        subcategory_id.hashCode ^
        name_ru.hashCode ^
        name_uz.hashCode ^
        name_en.hashCode ^
        slug.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        weight.hashCode ^
        weight_max.hashCode ^
        ikpu.hashCode ^
        barcode.hashCode ^
        nds.hashCode ^
        desc_ru.hashCode ^
        desc_uz.hashCode ^
        desc_en.hashCode ^
        photo.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        quantity.hashCode ^
        weight_bruto.hashCode ^
        sizes.hashCode;
  }
}

class SizeData extends ResponseData {
  num? id;
  String? name_ru;
  String? number;
  String? created_at;
  String? updated_at;
  PivotData? pivot;
  SizeData({
    this.id,
    this.name_ru,
    this.number,
    this.created_at,
    this.updated_at,
    this.pivot,
  });

  SizeData copyWith({
    num? id,
    String? name_ru,
    String? number,
    String? created_at,
    String? updated_at,
    PivotData? pivot,
  }) {
    return SizeData(
      id: id ?? this.id,
      name_ru: name_ru ?? this.name_ru,
      number: number ?? this.number,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      pivot: pivot ?? this.pivot,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_ru': name_ru,
      'number': number,
      'created_at': created_at,
      'updated_at': updated_at,
      'pivot': pivot?.toMap(),
    };
  }

  factory SizeData.fromMap(Map<String, dynamic> map) {
    return SizeData(
      id: map['id'],
      name_ru: map['name_ru'],
      number: map['number'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      pivot: map['pivot'] != null ? PivotData.fromMap(map['pivot']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SizeData.fromJson(String source) =>
      SizeData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SizeData(id: $id, name_ru: $name_ru, number: $number, created_at: $created_at, updated_at: $updated_at, pivot: $pivot)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SizeData &&
        other.id == id &&
        other.name_ru == name_ru &&
        other.number == number &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.pivot == pivot;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name_ru.hashCode ^
        number.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        pivot.hashCode;
  }
}

class PivotData extends ResponseData {
  dynamic? good_id;
  dynamic? size_id;
  dynamic? price;
  dynamic? quantity;
  PivotData({
    this.good_id,
    this.size_id,
    this.price,
    this.quantity,
  });

  PivotData copyWith({
    dynamic? good_id,
    dynamic? size_id,
    dynamic? price,
    dynamic? quantity,
  }) {
    return PivotData(
      good_id: good_id ?? this.good_id,
      size_id: size_id ?? this.size_id,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'good_id': good_id,
      'size_id': size_id,
      'price': price,
      'quantity': quantity,
    };
  }

  factory PivotData.fromMap(Map<String, dynamic> map) {
    return PivotData(
      good_id: map['good_id'],
      size_id: map['size_id'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PivotData.fromJson(String source) =>
      PivotData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PivotData(good_id: $good_id, size_id: $size_id, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PivotData &&
        other.good_id == good_id &&
        other.size_id == size_id &&
        other.price == price &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return good_id.hashCode ^
        size_id.hashCode ^
        price.hashCode ^
        quantity.hashCode;
  }
}
