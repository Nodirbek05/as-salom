import 'package:hive_flutter/adapters.dart';

part 'favorites_model.g.dart';

@HiveType(typeId: 1)
class FavoritesModel extends HiveObject{
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
     this.id,
     this.name_ru,
     this.name_uz,
     this.name_en,
     this.name_oz,
     this.desc_ru,
     this.desc_uz,
     this.desc_en,
     this.desc_oz,
     this.type,
     this.price,
     this.image,
     this.discount,
    this.size,
    this.kg,
    this.slug,
  });
}
