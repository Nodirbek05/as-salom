class CreateOrderModel {
  String name;
  String phone;
  String desc;
  List<GoodModel> goods;
  int placeType;
  String? zoneName;
  int? roomNumber;
  String? lat;
  String? lng;
  int? homeNumber;
  int? floor;
  int? enterance;
  int? apartment;
  CreateOrderModel({
    required this.name,
    required this.phone,
    required this.desc,
    required this.goods,
    required this.placeType,
    this.zoneName,
    this.roomNumber,
    this.lat,
    this.lng,
    this.homeNumber,
    this.floor,
    this.enterance,
    this.apartment,
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
