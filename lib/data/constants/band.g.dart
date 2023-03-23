// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'band.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BandAdapter extends TypeAdapter<Band> {
  @override
  final int typeId = 2;

  @override
  Band read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Band.b2190m;
      case 1:
        return Band.b630m;
      case 2:
        return Band.b560m;
      case 3:
        return Band.b160m;
      case 4:
        return Band.b80m;
      case 5:
        return Band.b60m;
      case 6:
        return Band.b40m;
      case 7:
        return Band.b30m;
      case 8:
        return Band.b20m;
      case 9:
        return Band.b17m;
      case 10:
        return Band.b15m;
      case 11:
        return Band.b12m;
      case 12:
        return Band.b10m;
      case 13:
        return Band.b8m;
      case 14:
        return Band.b6m;
      case 15:
        return Band.b5m;
      case 16:
        return Band.b4m;
      case 17:
        return Band.b2m;
      case 18:
        return Band.b1_25m;
      case 19:
        return Band.b70cm;
      case 20:
        return Band.b33cm;
      case 21:
        return Band.b23cm;
      case 22:
        return Band.b13cm;
      case 23:
        return Band.b9cm;
      case 24:
        return Band.b6cm;
      case 25:
        return Band.b3cm;
      case 26:
        return Band.b1_25cm;
      case 27:
        return Band.b6mm;
      case 28:
        return Band.b4mm;
      case 29:
        return Band.b2_5mm;
      case 30:
        return Band.b2mm;
      case 31:
        return Band.b1mm;
      case 32:
        return Band.bsubmm;
      default:
        return Band.b2190m;
    }
  }

  @override
  void write(BinaryWriter writer, Band obj) {
    switch (obj) {
      case Band.b2190m:
        writer.writeByte(0);
        break;
      case Band.b630m:
        writer.writeByte(1);
        break;
      case Band.b560m:
        writer.writeByte(2);
        break;
      case Band.b160m:
        writer.writeByte(3);
        break;
      case Band.b80m:
        writer.writeByte(4);
        break;
      case Band.b60m:
        writer.writeByte(5);
        break;
      case Band.b40m:
        writer.writeByte(6);
        break;
      case Band.b30m:
        writer.writeByte(7);
        break;
      case Band.b20m:
        writer.writeByte(8);
        break;
      case Band.b17m:
        writer.writeByte(9);
        break;
      case Band.b15m:
        writer.writeByte(10);
        break;
      case Band.b12m:
        writer.writeByte(11);
        break;
      case Band.b10m:
        writer.writeByte(12);
        break;
      case Band.b8m:
        writer.writeByte(13);
        break;
      case Band.b6m:
        writer.writeByte(14);
        break;
      case Band.b5m:
        writer.writeByte(15);
        break;
      case Band.b4m:
        writer.writeByte(16);
        break;
      case Band.b2m:
        writer.writeByte(17);
        break;
      case Band.b1_25m:
        writer.writeByte(18);
        break;
      case Band.b70cm:
        writer.writeByte(19);
        break;
      case Band.b33cm:
        writer.writeByte(20);
        break;
      case Band.b23cm:
        writer.writeByte(21);
        break;
      case Band.b13cm:
        writer.writeByte(22);
        break;
      case Band.b9cm:
        writer.writeByte(23);
        break;
      case Band.b6cm:
        writer.writeByte(24);
        break;
      case Band.b3cm:
        writer.writeByte(25);
        break;
      case Band.b1_25cm:
        writer.writeByte(26);
        break;
      case Band.b6mm:
        writer.writeByte(27);
        break;
      case Band.b4mm:
        writer.writeByte(28);
        break;
      case Band.b2_5mm:
        writer.writeByte(29);
        break;
      case Band.b2mm:
        writer.writeByte(30);
        break;
      case Band.b1mm:
        writer.writeByte(31);
        break;
      case Band.bsubmm:
        writer.writeByte(32);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
