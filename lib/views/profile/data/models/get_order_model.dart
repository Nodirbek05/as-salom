import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:assalomproject/core/common_models/response_data.dart';

class OrdersModel extends ResponseData {
  List<OrdersData> data;
  OrdersModel({
    required this.data,
  });

  OrdersModel copyWith({
    List<OrdersData>? data,
  }) {
    return OrdersModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory OrdersModel.fromMap(Map<String, dynamic> map) {
    return OrdersModel(
      data:
          List<OrdersData>.from(map['data']?.map((x) => OrdersData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdersModel.fromJson(String source) =>
      OrdersModel.fromMap(json.decode(source));

  @override
  String toString() => 'OrdersModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrdersModel && listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}

class OrdersData extends ResponseData {
  int? id;
  String? user_id;
  String? name;
  String? phone;
  String? desc;
  String? payment_type;
  String? total_price;
  String? status;
  String? is_active;
  String? status_text;
  String? created_at;
  String? updated_at;
  List<ProductData>? products;
  OrdersData({
    this.id,
    this.user_id,
    this.name,
    this.phone,
    this.desc,
    this.payment_type,
    this.total_price,
    this.status,
    this.is_active,
    this.status_text,
    this.created_at,
    this.updated_at,
    this.products,
  });

  OrdersData copyWith({
    int? id,
    String? user_id,
    String? name,
    String? phone,
    String? desc,
    String? payment_type,
    String? total_price,
    String? status,
    String? is_active,
    String? status_text,
    String? created_at,
    String? updated_at,
    List<ProductData>? products,
  }) {
    return OrdersData(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      desc: desc ?? this.desc,
      payment_type: payment_type ?? this.payment_type,
      total_price: total_price ?? this.total_price,
      status: status ?? this.status,
      is_active: is_active ?? this.is_active,
      status_text: status_text ?? this.status_text,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'name': name,
      'phone': phone,
      'desc': desc,
      'payment_type': payment_type,
      'total_price': total_price,
      'status': status,
      'is_active': is_active,
      'status_text': status_text,
      'created_at': created_at,
      'updated_at': updated_at,
      'products': products?.map((x) => x.toMap()).toList(),
    };
  }

  factory OrdersData.fromMap(Map<String, dynamic> map) {
    return OrdersData(
      id: map['id']?.toInt(),
      user_id: map['user_id'],
      name: map['name'],
      phone: map['phone'],
      desc: map['desc'],
      payment_type: map['payment_type'],
      total_price: map['total_price'],
      status: map['status'],
      is_active: map['is_active'],
      status_text: map['status_text'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      products: map['products'] != null
          ? List<ProductData>.from(
              map['products']?.map((x) => ProductData.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdersData.fromJson(String source) =>
      OrdersData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrdersData(id: $id, user_id: $user_id, name: $name, phone: $phone, desc: $desc, payment_type: $payment_type, total_price: $total_price, status: $status, is_active: $is_active, status_text: $status_text, created_at: $created_at, updated_at: $updated_at, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrdersData &&
        other.id == id &&
        other.user_id == user_id &&
        other.name == name &&
        other.phone == phone &&
        other.desc == desc &&
        other.payment_type == payment_type &&
        other.total_price == total_price &&
        other.status == status &&
        other.is_active == is_active &&
        other.status_text == status_text &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        desc.hashCode ^
        payment_type.hashCode ^
        total_price.hashCode ^
        status.hashCode ^
        is_active.hashCode ^
        status_text.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        products.hashCode;
  }
}

class ProductData extends ResponseData {
  int? type_good;
  String? photo;
  String? name_ru;
  String? ikpu;
  String? barcode;
  String? nds;
  int? product_count;
  int? product_price;
  List<Size>? sizes;
  ProductData({
    this.type_good,
    this.photo,
    this.name_ru,
    this.ikpu,
    this.barcode,
    this.nds,
    this.product_count,
    this.product_price,
    this.sizes,
  });

  ProductData copyWith({
    int? type_good,
    String? photo,
    String? name_ru,
    String? ikpu,
    String? barcode,
    String? nds,
    int? product_count,
    int? product_price,
    List<Size>? sizes,
  }) {
    return ProductData(
      type_good: type_good ?? this.type_good,
      photo: photo ?? this.photo,
      name_ru: name_ru ?? this.name_ru,
      ikpu: ikpu ?? this.ikpu,
      barcode: barcode ?? this.barcode,
      nds: nds ?? this.nds,
      product_count: product_count ?? this.product_count,
      product_price: product_price ?? this.product_price,
      sizes: sizes ?? this.sizes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type_good': type_good,
      'photo': photo,
      'name_ru': name_ru,
      'ikpu': ikpu,
      'barcode': barcode,
      'nds': nds,
      'product_count': product_count,
      'product_price': product_price,
      'sizes': sizes?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductData.fromMap(Map<String, dynamic> map) {
    return ProductData(
      type_good: map['type_good']?.toInt(),
      photo: map['photo'],
      name_ru: map['name_ru'],
      ikpu: map['ikpu'],
      barcode: map['barcode'],
      nds: map['nds'],
      product_count: map['product_count']?.toInt(),
      product_price: map['product_price']?.toInt(),
      sizes: map['sizes'] != null
          ? List<Size>.from(map['sizes']?.map((x) => Size.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductData.fromJson(String source) =>
      ProductData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductData(type_good: $type_good, photo: $photo, name_ru: $name_ru, ikpu: $ikpu, barcode: $barcode, nds: $nds, product_count: $product_count, product_price: $product_price, sizes: $sizes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductData &&
        other.type_good == type_good &&
        other.photo == photo &&
        other.name_ru == name_ru &&
        other.ikpu == ikpu &&
        other.barcode == barcode &&
        other.nds == nds &&
        other.product_count == product_count &&
        other.product_price == product_price &&
        listEquals(other.sizes, sizes);
  }

  @override
  int get hashCode {
    return type_good.hashCode ^
        photo.hashCode ^
        name_ru.hashCode ^
        ikpu.hashCode ^
        barcode.hashCode ^
        nds.hashCode ^
        product_count.hashCode ^
        product_price.hashCode ^
        sizes.hashCode;
  }
}

class Size extends ResponseData {
  String? size_id;
  String? size_quantity;
  String? size_price;
  Size({
    this.size_id,
    this.size_quantity,
    this.size_price,
  });

  Size copyWith({
    String? size_id,
    String? size_quantity,
    String? size_price,
  }) {
    return Size(
      size_id: size_id ?? this.size_id,
      size_quantity: size_quantity ?? this.size_quantity,
      size_price: size_price ?? this.size_price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'size_id': size_id,
      'size_quantity': size_quantity,
      'size_price': size_price,
    };
  }

  factory Size.fromMap(Map<String, dynamic> map) {
    return Size(
      size_id: map['size_id'],
      size_quantity: map['size_quantity'],
      size_price: map['size_price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Size.fromJson(String source) => Size.fromMap(json.decode(source));

  @override
  String toString() =>
      'Size(size_id: $size_id, size_quantity: $size_quantity, size_price: $size_price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Size &&
        other.size_id == size_id &&
        other.size_quantity == size_quantity &&
        other.size_price == size_price;
  }

  @override
  int get hashCode =>
      size_id.hashCode ^ size_quantity.hashCode ^ size_price.hashCode;
}
