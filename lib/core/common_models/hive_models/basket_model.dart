import 'package:hive_flutter/adapters.dart';

part 'basket_model.g.dart';

@HiveType(typeId: 0)
class BasketModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int qty;
  @HiveField(3)
  int type;
  @HiveField(4)
  String price;
  @HiveField(5)
  String image;
  @HiveField(6)
  String? size;
  @HiveField(7)
  String? kg;
  @HiveField(8)
  String? slug;
  @HiveField(9)
  String? selectedSize;
  BasketModel({
    required this.id,
    required this.name,
    required this.qty,
    required this.type,
    required this.price,
    required this.image,
     this.size,
     this.kg,
     this.slug,
     this.selectedSize
  });
}