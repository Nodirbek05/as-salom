import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:assalomproject/core/common_models/response_data.dart';
import 'package:assalomproject/views/product_detail/data/models/get_pro_with_slug_model.dart';

class SpesificProductsModel extends ResponseData {
  List<CategoryModel>? data;
  SpesificProductsModel({
    this.data,
  });

  SpesificProductsModel copyWith({
    List<CategoryModel>? data,
  }) {
    return SpesificProductsModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (data != null) {
      result.addAll({'data': data!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory SpesificProductsModel.fromMap(Map<String, dynamic> map) {
    return SpesificProductsModel(
      data: map['data'] != null
          ? List<CategoryModel>.from(
              map['data']?.map((x) => CategoryModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpesificProductsModel.fromJson(String source) =>
      SpesificProductsModel.fromMap(json.decode(source));

  @override
  String toString() => 'SpesificProductsModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpesificProductsModel && listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}

class CategoryModel {
  num? id;
  String? nameuz;
  String? nameoz;
  String? nameru;
  String? nameen;
  String? createdat;
  String? updatedat;
  List<ProductModel>? goods;
  CategoryModel({
    this.id,
    this.nameuz,
    this.nameoz,
    this.nameru,
    this.nameen,
    this.createdat,
    this.updatedat,
    this.goods,
  });

  CategoryModel copyWith({
    num? id,
    String? nameuz,
    String? nameoz,
    String? nameru,
    String? nameen,
    String? createdat,
    String? updatedat,
    List<ProductModel>? goods,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      nameuz: nameuz ?? this.nameuz,
      nameoz: nameoz ?? this.nameoz,
      nameru: nameru ?? this.nameru,
      nameen: nameen ?? this.nameen,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
      goods: goods ?? this.goods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_uz': nameuz,
      'name_oz': nameoz,
      'name_ru': nameru,
      'name_en': nameen,
      'created_at': createdat,
      'updated_at': updatedat,
      'goods': goods?.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      nameuz: map['name_uz'],
      nameoz: map['name_oz'],
      nameru: map['name_ru'],
      nameen: map['name_en'],
      createdat: map['created_at'],
      updatedat: map['updated_at'],
      goods: map['goods'] != null ? List<ProductModel>.from(map['goods']?.map((x) => ProductModel.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModel(id: $id, name_uz: $nameuz, name_oz: $nameoz, name_ru: $nameru, name_en: $nameen, created_at: $createdat, updated_at: $updatedat, goods: $goods)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryModel &&
      other.id == id &&
      other.nameuz == nameuz &&
      other.nameoz == nameoz &&
      other.nameru == nameru &&
      other.nameen == nameen &&
      other.createdat == createdat &&
      other.updatedat == updatedat &&
      listEquals(other.goods, goods);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nameuz.hashCode ^
      nameoz.hashCode ^
      nameru.hashCode ^
      nameen.hashCode ^
      createdat.hashCode ^
      updatedat.hashCode ^
      goods.hashCode;
  }
}

class ProductModel {
  num? id;
  int? typegood;
  int? categoryid;
  int? subcategoryid;
  String? nameru;
  String? nameuz;
  String? nameen;
  String? nameoz;
  String? slug;
  dynamic price;
  int? discount;
  String? weight;
  String? weightmax;
  String? ikpu;
  String? barcode;
  String? nds;
  String? descru;
  String? descuz;
  String? descen;
  String? descoz;
  List<String>? photo;
  String? createdat;
  String? updatedat;
  dynamic quantity;
  dynamic weightbruto;
  Pivot? pivot;
  List<SizeData>? sizes;
  ProductModel({
    this.id,
    this.typegood,
    this.categoryid,
    this.subcategoryid,
    this.nameru,
    this.nameuz,
    this.nameen,
    this.nameoz,
    this.slug,
    required this.price,
    this.discount,
    this.weight,
    this.weightmax,
    this.ikpu,
    this.barcode,
    this.nds,
    this.descru,
    this.descuz,
    this.descen,
    this.descoz,
    this.photo,
    this.createdat,
    this.updatedat,
    this.quantity,
    this.weightbruto,
    this.pivot,
    this.sizes,
  });

  




  ProductModel copyWith({
    num? id,
    int? typegood,
    int? categoryid,
    int? subcategoryid,
    String? nameru,
    String? nameuz,
    String? nameen,
    String? nameoz,
    String? slug,
    dynamic price,
    int? discount,
    String? weight,
    String? weightmax,
    String? ikpu,
    String? barcode,
    String? nds,
    String? descru,
    String? descuz,
    String? descen,
    String? descoz,
    List<String>? photo,
    String? createdat,
    String? updatedat,
    dynamic quantity,
    dynamic weightbruto,
    Pivot? pivot,
    List<SizeData>? sizes,
  }) {
    return ProductModel(
      id: id ?? this.id,
      typegood: typegood ?? this.typegood,
      categoryid: categoryid ?? this.categoryid,
      subcategoryid: subcategoryid ?? this.subcategoryid,
      nameru: nameru ?? this.nameru,
      nameuz: nameuz ?? this.nameuz,
      nameen: nameen ?? this.nameen,
      nameoz: nameoz ?? this.nameoz,
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
      descoz: descoz ?? this.descoz,
      photo: photo ?? this.photo,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
      quantity: quantity ?? this.quantity,
      weightbruto: weightbruto ?? this.weightbruto,
      pivot: pivot ?? this.pivot,
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
      'name_oz': nameoz,
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
      'desc_oz': descoz,
      'photo': photo,
      'created_at': createdat,
      'updated_at': updatedat,
      'quantity': quantity,
      'weight_bruto': weightbruto,
      'pivot': pivot?.toMap(),
      'sizes': sizes?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      typegood: map['type_good']?.toInt(),
      categoryid: map['category_id']?.toInt(),
      subcategoryid: map['subcategory_id']?.toInt(),
      nameru: map['name_ru'],
      nameuz: map['name_uz'],
      nameen: map['name_en'],
      nameoz: map['name_oz'],
      slug: map['slug'],
      price: map['price'] ?? null,
      discount: map['discount']?.toInt(),
      weight: map['weight'],
      weightmax: map['weight_max'],
      ikpu: map['ikpu'],
      barcode: map['barcode'],
      nds: map['nds'],
      descru: map['desc_ru'],
      descuz: map['desc_uz'],
      descen: map['desc_en'],
      descoz: map['desc_oz'],
      photo: List<String>.from(map['photo']),
      createdat: map['created_at'],
      updatedat: map['updated_at'],
      quantity: map['quantity'],
      weightbruto: map['weight_bruto'],
      pivot: map['pivot'] != null ? Pivot.fromMap(map['pivot']) : null,
      sizes: map['sizes'] != null ? List<SizeData>.from(map['sizes']?.map((x) => SizeData.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, type_good: $typegood, category_id: $categoryid, subcategory_id: $subcategoryid, name_ru: $nameru, name_uz: $nameuz, name_en: $nameen, name_oz: $nameoz, slug: $slug, price: $price, discount: $discount, weight: $weight, weight_max: $weightmax, ikpu: $ikpu, barcode: $barcode, nds: $nds, desc_ru: $descru, desc_uz: $descuz, desc_en: $descen, desc_oz: $descoz, photo: $photo, created_at: $createdat, updated_at: $updatedat, quantity: $quantity, weight_bruto: $weightbruto, pivot: $pivot, sizes: $sizes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductModel &&
      other.id == id &&
      other.typegood == typegood &&
      other.categoryid == categoryid &&
      other.subcategoryid == subcategoryid &&
      other.nameru == nameru &&
      other.nameuz == nameuz &&
      other.nameen == nameen &&
      other.nameoz == nameoz &&
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
      other.descoz == descoz &&
      listEquals(other.photo, photo) &&
      other.createdat == createdat &&
      other.updatedat == updatedat &&
      other.quantity == quantity &&
      other.weightbruto == weightbruto &&
      other.pivot == pivot &&
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
      nameoz.hashCode ^
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
      descoz.hashCode ^
      photo.hashCode ^
      createdat.hashCode ^
      updatedat.hashCode ^
      quantity.hashCode ^
      weightbruto.hashCode ^
      pivot.hashCode ^
      sizes.hashCode;
  }
}

class Pivot {
  int? selectionid;
  int? goodid;
  Pivot({
    this.selectionid,
    this.goodid,
  });

  Pivot copyWith({
    int? selectionid,
    int? goodid,
  }) {
    return Pivot(
      selectionid: selectionid ?? this.selectionid,
      goodid: goodid ?? this.goodid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (selectionid != null) {
      result.addAll({'selection_id': selectionid});
    }
    if (goodid != null) {
      result.addAll({'good_id': goodid});
    }

    return result;
  }

  factory Pivot.fromMap(Map<String, dynamic> map) {
    return Pivot(
      selectionid: map['selection_id'],
      goodid: map['good_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pivot.fromJson(String source) => Pivot.fromMap(json.decode(source));

  @override
  String toString() => 'Pivot(selection_id: $selectionid, good_id: $goodid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pivot &&
        other.selectionid == selectionid &&
        other.goodid == goodid;
  }

  @override
  int get hashCode => selectionid.hashCode ^ goodid.hashCode;
}
