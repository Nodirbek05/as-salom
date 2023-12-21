// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesModelAdapter extends TypeAdapter<FavoritesModel> {
  @override
  final int typeId = 1;

  @override
  FavoritesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesModel()
      ..id = fields[0] as int
      ..name_ru = fields[1] as String
      ..name_uz = fields[2] as String
      ..name_en = fields[3] as String
      ..desc_ru = fields[4] as String
      ..desc_uz = fields[5] as String
      ..desc_en = fields[6] as String
      ..type = fields[7] as int
      ..price = fields[8] as String
      ..image = fields[9] as String
      ..discount = fields[10] as String
      ..size = fields[11] as String?
      ..kg = fields[12] as String?
      ..slug = fields[13] as String?;
  }

  @override
  void write(BinaryWriter writer, FavoritesModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name_ru)
      ..writeByte(2)
      ..write(obj.name_uz)
      ..writeByte(3)
      ..write(obj.name_en)
      ..writeByte(4)
      ..write(obj.desc_ru)
      ..writeByte(5)
      ..write(obj.desc_uz)
      ..writeByte(6)
      ..write(obj.desc_en)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.discount)
      ..writeByte(11)
      ..write(obj.size)
      ..writeByte(12)
      ..write(obj.kg)
      ..writeByte(13)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
