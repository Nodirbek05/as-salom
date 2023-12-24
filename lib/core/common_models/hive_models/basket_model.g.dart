// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasketModelAdapter extends TypeAdapter<BasketModel> {
  @override
  final int typeId = 0;

  @override
  BasketModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BasketModel(
      id: fields[0] as int,
      name: fields[1] as String,
      qty: fields[2] as int,
      type: fields[3] as int,
      price: fields[4] as String,
      image: fields[5] as String,
      size: fields[6] as String?,
      kg: fields[7] as String?,
      slug: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BasketModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.qty)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.size)
      ..writeByte(7)
      ..write(obj.kg)
      ..writeByte(8)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
