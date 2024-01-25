import 'package:hive_flutter/adapters.dart';

part 'favorites_model.g.dart';

@HiveType(typeId: 1)
class FavoritesModel extends HiveObject{
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  dynamic nameru;
  @HiveField(2)
  dynamic nameuz;
  @HiveField(3)
  dynamic nameen;
  @HiveField(4)
  dynamic nameoz;
  @HiveField(5)
  dynamic descru;
  @HiveField(6)
  dynamic descuz;
  @HiveField(7)
  dynamic descen;
  @HiveField(8)
  dynamic descoz;
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
     this.nameru,
     this.nameuz,
     this.nameen,
     this.nameoz,
     this.descru,
     this.descuz,
     this.descen,
     this.descoz,
     this.type,
     this.price,
     this.image,
     this.discount,
    this.size,
    this.kg,
    this.slug,
  });
}
