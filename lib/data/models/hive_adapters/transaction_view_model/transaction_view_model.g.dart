// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_view_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionViewModelAdapter extends TypeAdapter<TransactionViewModel> {
  @override
  final int typeId = 3;

  @override
  TransactionViewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionViewModel(
      id: fields[0] as String?,
      title: fields[1] as String?,
      type: fields[2] as String?,
      currency: fields[3] as String?,
      createdAt: fields[4] as String?,
      userId: fields[5] as String?,
      amount: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionViewModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.currency)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.userId)
      ..writeByte(6)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionViewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
