import 'package:hive_flutter/adapters.dart';

part 'favorites_model.g.dart';

@HiveType(typeId: 1)
class FavoritesModel extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String name_ru;

  @HiveField(2)
  late String name_uz;

  @HiveField(3)
  late String name_en;

  @HiveField(4)
  late String desc_ru;

  @HiveField(5)
  late String desc_uz;

  @HiveField(6)
  late String desc_en;
  @HiveField(7)
  late int type;
  @HiveField(8)
  late String price;
  @HiveField(9)
  late String image;
  @HiveField(10)
  late String discount;
  @HiveField(11)
  String? size;
  @HiveField(12)
  String? kg;
  @HiveField(13)
  String? slug;
}
