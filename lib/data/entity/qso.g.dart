// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qso.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QSOAdapter extends TypeAdapter<QSO> {
  @override
  final int typeId = 0;

  @override
  QSO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QSO(
      operator: fields[0] as String,
      call: fields[1] as String,
      qsoDate: fields[2] as String,
      timeOn: fields[3] as String,
      mode: fields[4] as Mode,
      rstSent: fields[5] as String,
      rstRcvd: fields[6] as String,
      band: fields[7] as Band,
      qth: fields[8] as String,
      comment: fields[9] as String,
      name: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QSO obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.operator)
      ..writeByte(1)
      ..write(obj.call)
      ..writeByte(2)
      ..write(obj.qsoDate)
      ..writeByte(3)
      ..write(obj.timeOn)
      ..writeByte(4)
      ..write(obj.mode)
      ..writeByte(5)
      ..write(obj.rstSent)
      ..writeByte(6)
      ..write(obj.rstRcvd)
      ..writeByte(7)
      ..write(obj.band)
      ..writeByte(8)
      ..write(obj.qth)
      ..writeByte(9)
      ..write(obj.comment)
      ..writeByte(10)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QSOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
