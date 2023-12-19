import 'package:hive_flutter/adapters.dart';

part 'favorites_model.g.dart';

@HiveType(typeId: 1)
class FavoritesModel extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late int type;
  @HiveField(3)
  late String price;
  @HiveField(4)
  late String image;
  @HiveField(5)
  late String discount;
  @HiveField(6)
  String? size;
  @HiveField(7)
  String? kg;
  @HiveField(8)
  String? slug;
}
