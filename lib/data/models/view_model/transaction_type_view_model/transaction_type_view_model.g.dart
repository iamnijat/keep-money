// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_type_view_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionTypeViewModelAdapter
    extends TypeAdapter<TransactionTypeViewModel> {
  @override
  final int typeId = 1;

  @override
  TransactionTypeViewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionTypeViewModel(
      id: fields[0] as String?,
      title: fields[1] as String?,
      type: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionTypeViewModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionTypeViewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
