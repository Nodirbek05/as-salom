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
    return FavoritesModel(
      id: fields[0] as dynamic,
      name_ru: fields[1] as dynamic,
      name_uz: fields[2] as dynamic,
      name_en: fields[3] as dynamic,
      name_oz: fields[4] as dynamic,
      desc_ru: fields[5] as dynamic,
      desc_uz: fields[6] as dynamic,
      desc_en: fields[7] as dynamic,
      desc_oz: fields[8] as dynamic,
      type: fields[9] as dynamic,
      price: fields[10] as dynamic,
      image: fields[11] as dynamic,
      discount: fields[12] as dynamic,
      size: fields[13] as dynamic,
      kg: fields[14] as dynamic,
      slug: fields[15] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, FavoritesModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name_ru)
      ..writeByte(2)
      ..write(obj.name_uz)
      ..writeByte(3)
      ..write(obj.name_en)
      ..writeByte(4)
      ..write(obj.name_oz)
      ..writeByte(5)
      ..write(obj.desc_ru)
      ..writeByte(6)
      ..write(obj.desc_uz)
      ..writeByte(7)
      ..write(obj.desc_en)
      ..writeByte(8)
      ..write(obj.desc_oz)
      ..writeByte(9)
      ..write(obj.type)
      ..writeByte(10)
      ..write(obj.price)
      ..writeByte(11)
      ..write(obj.image)
      ..writeByte(12)
      ..write(obj.discount)
      ..writeByte(13)
      ..write(obj.size)
      ..writeByte(14)
      ..write(obj.kg)
      ..writeByte(15)
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
