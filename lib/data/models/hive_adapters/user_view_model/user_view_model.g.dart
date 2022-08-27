// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserViewModelAdapter extends TypeAdapter<UserViewModel> {
  @override
  final int typeId = 2;

  @override
  UserViewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserViewModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      gender: fields[2] as String?,
      income: fields[3] as String?,
      transactions: (fields[4] as List?)?.cast<TransactionViewModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserViewModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.income)
      ..writeByte(4)
      ..write(obj.transactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserViewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
