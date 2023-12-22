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
  String? name_ru;
  String? name_en;
  String? created_at;
  String? updated_at;
  List<ProductModel>? goods;
  CategoryModel({
    this.id,
    this.name_uz,
    this.name_ru,
    this.name_en,
    this.created_at,
    this.updated_at,
    this.goods,
  });

  CategoryModel copyWith({
    num? id,
    String? name_uz,
    String? name_ru,
    String? name_en,
    String? created_at,
    String? updated_at,
    List<ProductModel>? goods,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name_uz: name_uz ?? this.name_uz,
      name_ru: name_ru ?? this.name_ru,
      name_en: name_en ?? this.name_en,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      goods: goods ?? this.goods,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name_uz != null) {
      result.addAll({'name_uz': name_uz});
    }
    if (name_ru != null) {
      result.addAll({'name_ru': name_ru});
    }
    if (name_en != null) {
      result.addAll({'name_en': name_en});
    }
    if (created_at != null) {
      result.addAll({'created_at': created_at});
    }
    if (updated_at != null) {
      result.addAll({'updated_at': updated_at});
    }
    if (goods != null) {
      result.addAll({'goods': goods!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name_uz: map['name_uz'],
      name_ru: map['name_ru'],
      name_en: map['name_en'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      goods: map['goods'] != null
          ? List<ProductModel>.from(
              map['goods']?.map((x) => ProductModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModel(id: $id, name_uz: $name_uz, name_ru: $name_ru, name_en: $name_en, created_at: $created_at, updated_at: $updated_at, goods: $goods)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.id == id &&
        other.name_uz == name_uz &&
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
  List<String>? photo;
  String? created_at;
  String? updated_at;
  dynamic quantity;
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
    List<String>? photo,
    String? created_at,
    String? updated_at,
    dynamic quantity,
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
      pivot: pivot ?? this.pivot,
      sizes: sizes ?? this.sizes,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(type_good != null){
      result.addAll({'type_good': type_good});
    }
    if(category_id != null){
      result.addAll({'category_id': category_id});
    }
    if(subcategory_id != null){
      result.addAll({'subcategory_id': subcategory_id});
    }
    if(name_ru != null){
      result.addAll({'name_ru': name_ru});
    }
    if(name_uz != null){
      result.addAll({'name_uz': name_uz});
    }
    if(name_en != null){
      result.addAll({'name_en': name_en});
    }
    if(slug != null){
      result.addAll({'slug': slug});
    }
    if(price != null){
      result.addAll({'price': price});
    }
    if(discount != null){
      result.addAll({'discount': discount});
    }
    if(weight != null){
      result.addAll({'weight': weight});
    }
    if(weight_max != null){
      result.addAll({'weight_max': weight_max});
    }
    if(ikpu != null){
      result.addAll({'ikpu': ikpu});
    }
    if(barcode != null){
      result.addAll({'barcode': barcode});
    }
    if(nds != null){
      result.addAll({'nds': nds});
    }
    if(desc_ru != null){
      result.addAll({'desc_ru': desc_ru});
    }
    if(desc_uz != null){
      result.addAll({'desc_uz': desc_uz});
    }
    if(desc_en != null){
      result.addAll({'desc_en': desc_en});
    }
    if(photo != null){
      result.addAll({'photo': photo});
    }
    if(created_at != null){
      result.addAll({'created_at': created_at});
    }
    if(updated_at != null){
      result.addAll({'updated_at': updated_at});
    }
    if(quantity != null){
      result.addAll({'quantity': quantity});
    }
    if(weight_bruto != null){
      result.addAll({'weight_bruto': weight_bruto});
    }
    if(pivot != null){
      result.addAll({'pivot': pivot!.toMap()});
    }
    if(sizes != null){
      result.addAll({'sizes': sizes!.map((x) => x.toMap()).toList()});
    }
  
    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      type_good: map['type_good']?.toInt(),
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
      pivot: map['pivot'] != null ? Pivot.fromMap(map['pivot']) : null,
      sizes: map['sizes'] != null ? List<SizeData>.from(map['sizes']?.map((x) => SizeData.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, type_good: $type_good, category_id: $category_id, subcategory_id: $subcategory_id, name_ru: $name_ru, name_uz: $name_uz, name_en: $name_en, slug: $slug, price: $price, discount: $discount, weight: $weight, weight_max: $weight_max, ikpu: $ikpu, barcode: $barcode, nds: $nds, desc_ru: $desc_ru, desc_uz: $desc_uz, desc_en: $desc_en, photo: $photo, created_at: $created_at, updated_at: $updated_at, quantity: $quantity, weight_bruto: $weight_bruto, pivot: $pivot, sizes: $sizes)';
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
