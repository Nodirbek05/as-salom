import 'package:hive_flutter/adapters.dart';

part 'basket_model.g.dart';

@HiveType(typeId: 0)
class BasketModel extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late int qty;
  @HiveField(3)
  late int type;
  @HiveField(4)
  late String price;
  @HiveField(5)
  late String image;
  @HiveField(6)
   String? size;
  @HiveField(7)
   String? kg;
}
