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
      ..name = fields[1] as String
      ..type = fields[2] as int
      ..price = fields[3] as String
      ..image = fields[4] as String
      ..discount = fields[5] as String
      ..size = fields[6] as String?
      ..kg = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, FavoritesModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.discount)
      ..writeByte(6)
      ..write(obj.size)
      ..writeByte(7)
      ..write(obj.kg);
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
