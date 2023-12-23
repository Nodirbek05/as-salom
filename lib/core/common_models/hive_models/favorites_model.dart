import 'package:hive_flutter/adapters.dart';

part 'favorites_model.g.dart';

@HiveType(typeId: 1)
class FavoritesModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name_ru;
  @HiveField(2)
  String? name_uz;
  @HiveField(3)
  String? name_en;
  @HiveField(4)
  String? name_oz;
  @HiveField(5)
  String? desc_ru;
  @HiveField(6)
  String? desc_uz;
  @HiveField(7)
  String? desc_en;
  @HiveField(8)
  String? desc_oz;
  @HiveField(9)
  int? type;
  @HiveField(10)
  String? price;
  @HiveField(11)
  String? image;
  @HiveField(12)
  String? discount;
  @HiveField(13)
  String? size;
  @HiveField(14)
  String? kg;
  @HiveField(15)
  String? slug;
}