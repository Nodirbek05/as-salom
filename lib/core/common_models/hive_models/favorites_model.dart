import 'package:hive_flutter/adapters.dart';


part 'favorites_model.g.dart';
@HiveType(typeId: 1)
class FavoritesModel extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String type;
  @HiveField(3)
  late String price;
  @HiveField(4)
  late String image;
  @HiveField(5)
  late String discount;

}