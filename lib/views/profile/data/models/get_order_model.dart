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
  dynamic userid;
  String? name;
  String? phone;
  String? desc;
  String? paymenttype;
  dynamic totalprice;
  String? status;
  dynamic isactive;
  String? statustext;
  String? createdat;
  String? updatedat;
  List<ProductData>? products;
  OrdersData({
    this.id,
    this.userid,
    this.name,
    this.phone,
    this.desc,
    this.paymenttype,
    this.totalprice,
    this.status,
    this.isactive,
    this.statustext,
    this.createdat,
    this.updatedat,
    this.products,
  });

  OrdersData copyWith({
    int? id,
    dynamic userid,
    String? name,
    String? phone,
    String? desc,
    String? paymenttype,
    dynamic totalprice,
    String? status,
    dynamic isactive,
    String? statustext,
    String? createdat,
    String? updatedat,
    List<ProductData>? products,
  }) {
    return OrdersData(
      id: id ?? this.id,
      userid: userid ?? this.userid,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      desc: desc ?? this.desc,
      paymenttype: paymenttype ?? this.paymenttype,
      totalprice: totalprice ?? this.totalprice,
      status: status ?? this.status,
      isactive: isactive ?? this.isactive,
      statustext: statustext ?? this.statustext,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userid,
      'name': name,
      'phone': phone,
      'desc': desc,
      'payment_type': paymenttype,
      'total_price': totalprice,
      'status': status,
      'is_active': isactive,
      'status_text': statustext,
      'created_at': createdat,
      'updated_at': updatedat,
      'products': products?.map((x) => x.toMap()).toList(),
    };
  }

  factory OrdersData.fromMap(Map<String, dynamic> map) {
    return OrdersData(
      id: map['id']?.toInt(),
      userid: map['user_id'],
      name: map['name'],
      phone: map['phone'],
      desc: map['desc'],
      paymenttype: map['payment_type'],
      totalprice: map['total_price'],
      status: map['status'],
      isactive: map['is_active'],
      statustext: map['status_text'],
      createdat: map['created_at'],
      updatedat: map['updated_at'],
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
    return 'OrdersData(id: $id, user_id: $userid, name: $name, phone: $phone, desc: $desc, payment_type: $paymenttype, total_price: $totalprice, status: $status, is_active: $isactive, status_text: $statustext, created_at: $createdat, updated_at: $updatedat, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrdersData &&
        other.id == id &&
        other.userid == userid &&
        other.name == name &&
        other.phone == phone &&
        other.desc == desc &&
        other.paymenttype == paymenttype &&
        other.totalprice == totalprice &&
        other.status == status &&
        other.isactive == isactive &&
        other.statustext == statustext &&
        other.createdat == createdat &&
        other.updatedat == updatedat &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userid.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        desc.hashCode ^
        paymenttype.hashCode ^
        totalprice.hashCode ^
        status.hashCode ^
        isactive.hashCode ^
        statustext.hashCode ^
        createdat.hashCode ^
        updatedat.hashCode ^
        products.hashCode;
  }
}

class ProductData extends ResponseData {
  int? typegood;
  String? photo;
  String? nameru;
  String? ikpu;
  String? barcode;
  String? nds;
  int? productcount;
  int? productprice;
  List<Size>? sizes;
  ProductData({
    this.typegood,
    this.photo,
    this.nameru,
    this.ikpu,
    this.barcode,
    this.nds,
    this.productcount,
    this.productprice,
    this.sizes,
  });

  ProductData copyWith({
    int? typegood,
    String? photo,
    String? nameru,
    String? ikpu,
    String? barcode,
    String? nds,
    int? productcount,
    int? productprice,
    List<Size>? sizes,
  }) {
    return ProductData(
      typegood: typegood ?? this.typegood,
      photo: photo ?? this.photo,
      nameru: nameru ?? this.nameru,
      ikpu: ikpu ?? this.ikpu,
      barcode: barcode ?? this.barcode,
      nds: nds ?? this.nds,
      productcount: productcount ?? this.productcount,
      productprice: productprice ?? this.productprice,
      sizes: sizes ?? this.sizes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type_good': typegood,
      'photo': photo,
      'name_ru': nameru,
      'ikpu': ikpu,
      'barcode': barcode,
      'nds': nds,
      'product_count': productcount,
      'product_price': productprice,
      'sizes': sizes?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductData.fromMap(Map<String, dynamic> map) {
    return ProductData(
      typegood: map['type_good']?.toInt(),
      photo: map['photo'],
      nameru: map['name_ru'],
      ikpu: map['ikpu'],
      barcode: map['barcode'],
      nds: map['nds'],
      productcount: map['product_count']?.toInt(),
      productprice: map['product_price']?.toInt(),
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
    return 'ProductData(type_good: $typegood, photo: $photo, name_ru: $nameru, ikpu: $ikpu, barcode: $barcode, nds: $nds, product_count: $productcount, product_price: $productprice, sizes: $sizes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductData &&
        other.typegood == typegood &&
        other.photo == photo &&
        other.nameru == nameru &&
        other.ikpu == ikpu &&
        other.barcode == barcode &&
        other.nds == nds &&
        other.productcount == productcount &&
        other.productprice == productprice &&
        listEquals(other.sizes, sizes);
  }

  @override
  int get hashCode {
    return typegood.hashCode ^
        photo.hashCode ^
        nameru.hashCode ^
        ikpu.hashCode ^
        barcode.hashCode ^
        nds.hashCode ^
        productcount.hashCode ^
        productprice.hashCode ^
        sizes.hashCode;
  }
}

class Size extends ResponseData {
  dynamic sizeid;
  dynamic sizequantity;
  dynamic sizeprice;
  String? sizename;
  String? sizenumber;
  Size({
    this.sizeid,
    this.sizequantity,
    this.sizeprice,
    this.sizename,
    this.sizenumber,
  });

  Size copyWith({
    dynamic sizeid,
    dynamic sizequantity,
    dynamic sizeprice,
    String? sizename,
    String? sizenumber,
  }) {
    return Size(
      sizeid: sizeid ?? this.sizeid,
      sizequantity: sizequantity ?? this.sizequantity,
      sizeprice: sizeprice ?? this.sizeprice,
      sizename: sizename ?? this.sizename,
      sizenumber: sizenumber ?? this.sizenumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'size_id': sizeid,
      'size_quantity': sizequantity,
      'size_price': sizeprice,
      'size_name': sizename,
      'size_number': sizenumber,
    };
  }

  factory Size.fromMap(Map<String, dynamic> map) {
    return Size(
      sizeid: map['size_id'],
      sizequantity: map['size_quantity'],
      sizeprice: map['size_price'],
      sizename: map['size_name'],
      sizenumber: map['size_number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Size.fromJson(String source) => Size.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Size(size_id: $sizeid, size_quantity: $sizequantity, size_price: $sizeprice, size_name: $sizename, size_number: $sizenumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Size &&
      other.sizeid == sizeid &&
      other.sizequantity == sizequantity &&
      other.sizeprice == sizeprice &&
      other.sizename == sizename &&
      other.sizenumber == sizenumber;
  }

  @override
  int get hashCode {
    return sizeid.hashCode ^
      sizequantity.hashCode ^
      sizeprice.hashCode ^
      sizename.hashCode ^
      sizenumber.hashCode;
  }
}
