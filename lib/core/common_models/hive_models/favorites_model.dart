import 'package:hive_flutter/adapters.dart';

part 'favorites_model.g.dart';

@HiveType(typeId: 1)
class FavoritesModel {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  dynamic name_ru;
  @HiveField(2)
  dynamic name_uz;
  @HiveField(3)
  dynamic name_en;
  @HiveField(4)
  dynamic name_oz;
  @HiveField(5)
  dynamic desc_ru;
  @HiveField(6)
  dynamic desc_uz;
  @HiveField(7)
  dynamic desc_en;
  @HiveField(8)
  dynamic desc_oz;
  @HiveField(9)
  dynamic type;
  @HiveField(10)
  dynamic price;
  @HiveField(11)
  dynamic image;
  @HiveField(12)
  dynamic discount;
  @HiveField(13)
  dynamic size;
  @HiveField(14)
  dynamic kg;
  @HiveField(15)
  dynamic slug;
  FavoritesModel({
    required this.id,
    required this.name_ru,
    required this.name_uz,
    required this.name_en,
    required this.name_oz,
    required this.desc_ru,
    required this.desc_uz,
    required this.desc_en,
    required this.desc_oz,
    required this.type,
    required this.price,
    required this.image,
    required this.discount,
    this.size,
    this.kg,
    this.slug,
  });
}
