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
  String? name_uz;
  String? name_oz;
  String? name_ru;
  String? name_en;
  String? created_at;
  String? updated_at;
  List<ProductModel>? goods;
  CategoryModel({
    this.id,
    this.name_uz,
    this.name_oz,
    this.name_ru,
    this.name_en,
    this.created_at,
    this.updated_at,
    this.goods,
  });

  CategoryModel copyWith({
    num? id,
    String? name_uz,
    String? name_oz,
    String? name_ru,
    String? name_en,
    String? created_at,
    String? updated_at,
    List<ProductModel>? goods,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name_uz: name_uz ?? this.name_uz,
      name_oz: name_oz ?? this.name_oz,
      name_ru: name_ru ?? this.name_ru,
      name_en: name_en ?? this.name_en,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      goods: goods ?? this.goods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_uz': name_uz,
      'name_oz': name_oz,
      'name_ru': name_ru,
      'name_en': name_en,
      'created_at': created_at,
      'updated_at': updated_at,
      'goods': goods?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name_uz: map['name_uz'],
      name_oz: map['name_oz'],
      name_ru: map['name_ru'],
      name_en: map['name_en'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      goods: map['goods'] != null ? List<ProductModel>.from(map['goods']?.map((x) => ProductModel.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModel(id: $id, name_uz: $name_uz, name_oz: $name_oz, name_ru: $name_ru, name_en: $name_en, created_at: $created_at, updated_at: $updated_at, goods: $goods)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryModel &&
      other.id == id &&
      other.name_uz == name_uz &&
      other.name_oz == name_oz &&
      other.name_ru == name_ru &&
      other.name_en == name_en &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      listEquals(other.goods, goods);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name_uz.hashCode ^
      name_oz.hashCode ^
      name_ru.hashCode ^
      name_en.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      goods.hashCode;
  }
}

class ProductModel {
  num? id;
  int? type_good;
  int? category_id;
  int? subcategory_id;
  String? name_ru;
  String? name_uz;
  String? name_en;
  String? name_oz;
  String? slug;
  dynamic price;
  int? discount;
  String? weight;
  String? weight_max;
  String? ikpu;
  String? barcode;
  String? nds;
  String? desc_ru;
  String? desc_uz;
  String? desc_en;
  String? desc_oz;
  List<String>? photo;
  String? created_at;
  String? updated_at;
  dynamic? quantity;
  dynamic? weight_bruto;
  Pivot? pivot;
  List<SizeData>? sizes;
  ProductModel({
    this.id,
    this.type_good,
    this.category_id,
    this.subcategory_id,
    this.name_ru,
    this.name_uz,
    this.name_en,
    this.name_oz,
    this.slug,
    required this.price,
    this.discount,
    this.weight,
    this.weight_max,
    this.ikpu,
    this.barcode,
    this.nds,
    this.desc_ru,
    this.desc_uz,
    this.desc_en,
    this.desc_oz,
    this.photo,
    this.created_at,
    this.updated_at,
    this.quantity,
    this.weight_bruto,
    this.pivot,
    this.sizes,
  });

  




  ProductModel copyWith({
    num? id,
    int? type_good,
    int? category_id,
    int? subcategory_id,
    String? name_ru,
    String? name_uz,
    String? name_en,
    String? name_oz,
    String? slug,
    dynamic? price,
    int? discount,
    String? weight,
    String? weight_max,
    String? ikpu,
    String? barcode,
    String? nds,
    String? desc_ru,
    String? desc_uz,
    String? desc_en,
    String? desc_oz,
    List<String>? photo,
    String? created_at,
    String? updated_at,
    dynamic? quantity,
    dynamic? weight_bruto,
    Pivot? pivot,
    List<SizeData>? sizes,
  }) {
    return ProductModel(
      id: id ?? this.id,
      type_good: type_good ?? this.type_good,
      category_id: category_id ?? this.category_id,
      subcategory_id: subcategory_id ?? this.subcategory_id,
      name_ru: name_ru ?? this.name_ru,
      name_uz: name_uz ?? this.name_uz,
      name_en: name_en ?? this.name_en,
      name_oz: name_oz ?? this.name_oz,
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
      desc_oz: desc_oz ?? this.desc_oz,
      photo: photo ?? this.photo,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      quantity: quantity ?? this.quantity,
      weight_bruto: weight_bruto ?? this.weight_bruto,
      pivot: pivot ?? this.pivot,
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
      'name_oz': name_oz,
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
      'desc_oz': desc_oz,
      'photo': photo,
      'created_at': created_at,
      'updated_at': updated_at,
      'quantity': quantity,
      'weight_bruto': weight_bruto,
      'pivot': pivot?.toMap(),
      'sizes': sizes?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      type_good: map['type_good']?.toInt(),
      category_id: map['category_id']?.toInt(),
      subcategory_id: map['subcategory_id']?.toInt(),
      name_ru: map['name_ru'],
      name_uz: map['name_uz'],
      name_en: map['name_en'],
      name_oz: map['name_oz'],
      slug: map['slug'],
      price: map['price'] ?? null,
      discount: map['discount']?.toInt(),
      weight: map['weight'],
      weight_max: map['weight_max'],
      ikpu: map['ikpu'],
      barcode: map['barcode'],
      nds: map['nds'],
      desc_ru: map['desc_ru'],
      desc_uz: map['desc_uz'],
      desc_en: map['desc_en'],
      desc_oz: map['desc_oz'],
      photo: List<String>.from(map['photo']),
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      quantity: map['quantity'],
      weight_bruto: map['weight_bruto'],
      pivot: map['pivot'] != null ? Pivot.fromMap(map['pivot']) : null,
      sizes: map['sizes'] != null ? List<SizeData>.from(map['sizes']?.map((x) => SizeData.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, type_good: $type_good, category_id: $category_id, subcategory_id: $subcategory_id, name_ru: $name_ru, name_uz: $name_uz, name_en: $name_en, name_oz: $name_oz, slug: $slug, price: $price, discount: $discount, weight: $weight, weight_max: $weight_max, ikpu: $ikpu, barcode: $barcode, nds: $nds, desc_ru: $desc_ru, desc_uz: $desc_uz, desc_en: $desc_en, desc_oz: $desc_oz, photo: $photo, created_at: $created_at, updated_at: $updated_at, quantity: $quantity, weight_bruto: $weight_bruto, pivot: $pivot, sizes: $sizes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductModel &&
      other.id == id &&
      other.type_good == type_good &&
      other.category_id == category_id &&
      other.subcategory_id == subcategory_id &&
      other.name_ru == name_ru &&
      other.name_uz == name_uz &&
      other.name_en == name_en &&
      other.name_oz == name_oz &&
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
      other.desc_oz == desc_oz &&
      listEquals(other.photo, photo) &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.quantity == quantity &&
      other.weight_bruto == weight_bruto &&
      other.pivot == pivot &&
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
      name_oz.hashCode ^
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
      desc_oz.hashCode ^
      photo.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      quantity.hashCode ^
      weight_bruto.hashCode ^
      pivot.hashCode ^
      sizes.hashCode;
  }
}

class Pivot {
  int? selection_id;
  int? good_id;
  Pivot({
    this.selection_id,
    this.good_id,
  });

  Pivot copyWith({
    int? selection_id,
    int? good_id,
  }) {
    return Pivot(
      selection_id: selection_id ?? this.selection_id,
      good_id: good_id ?? this.good_id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (selection_id != null) {
      result.addAll({'selection_id': selection_id});
    }
    if (good_id != null) {
      result.addAll({'good_id': good_id});
    }

    return result;
  }

  factory Pivot.fromMap(Map<String, dynamic> map) {
    return Pivot(
      selection_id: map['selection_id'],
      good_id: map['good_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pivot.fromJson(String source) => Pivot.fromMap(json.decode(source));

  @override
  String toString() => 'Pivot(selection_id: $selection_id, good_id: $good_id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pivot &&
        other.selection_id == selection_id &&
        other.good_id == good_id;
  }

  @override
  int get hashCode => selection_id.hashCode ^ good_id.hashCode;
}
