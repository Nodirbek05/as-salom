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
  late String name_oz;
  @HiveField(5)
  late String desc_ru;
  @HiveField(6)
  late String desc_uz;
  @HiveField(7)
  late String desc_en;
  @HiveField(8)
  late String desc_oz;
  @HiveField(9)
  late int type;
  @HiveField(10)
  late String price;
  @HiveField(11)
  late String image;
  @HiveField(12)
  late String discount;
  @HiveField(13)
  String? size;
  @HiveField(14)
  String? kg;
  @HiveField(15)
  String? slug;
}
