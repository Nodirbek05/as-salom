class CreateOrderModel {
  String? name;
  String? phone;
  String? desc;
  int? paymentType;
  List<GoodModel> goods;
  CreateOrderModel({
    this.name,
    this.phone,
    this.desc,
    this.paymentType,
    required this.goods,
  });
}

class GoodModel {
  int? goodId;
  int? qty;
  int? weight;
  List<SizeModel>? sizes;
  GoodModel({
    this.goodId,
    this.qty,
    this.weight,
    this.sizes,
  });
}

class SizeModel {
  int? sizeId;
  int? qty;
  SizeModel({
    this.sizeId,
    this.qty,
  });
}
