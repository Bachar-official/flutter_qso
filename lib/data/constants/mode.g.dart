// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModeAdapter extends TypeAdapter<Mode> {
  @override
  final int typeId = 1;

  @override
  Mode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Mode.am;
      case 1:
        return Mode.ardop;
      case 2:
        return Mode.atv;
      case 3:
        return Mode.chip;
      case 4:
        return Mode.clo;
      case 5:
        return Mode.contesti;
      case 6:
        return Mode.cw;
      case 7:
        return Mode.digitalVoice;
      case 8:
        return Mode.domino;
      case 9:
        return Mode.dynamic;
      case 10:
        return Mode.fax;
      case 11:
        return Mode.fm;
      case 12:
        return Mode.fsk441;
      case 13:
        return Mode.ft8;
      case 14:
        return Mode.hell;
      case 15:
        return Mode.iscat;
      case 16:
        return Mode.jt4;
      case 17:
        return Mode.jt6m;
      case 18:
        return Mode.jt9;
      case 19:
        return Mode.jt44;
      case 20:
        return Mode.jt65;
      case 21:
        return Mode.mfsk;
      case 22:
        return Mode.msk144;
      case 23:
        return Mode.mt63;
      case 24:
        return Mode.olivia;
      case 25:
        return Mode.opera;
      case 26:
        return Mode.pac;
      case 27:
        return Mode.pax;
      case 28:
        return Mode.pkt;
      case 29:
        return Mode.psk;
      case 30:
        return Mode.psk2k;
      case 31:
        return Mode.q15;
      case 32:
        return Mode.qra64;
      case 33:
        return Mode.ros;
      case 34:
        return Mode.rtty;
      case 35:
        return Mode.rttyM;
      case 36:
        return Mode.ssb;
      case 37:
        return Mode.sstv;
      case 38:
        return Mode.t10;
      case 39:
        return Mode.thor;
      case 40:
        return Mode.thrb;
      case 41:
        return Mode.tor;
      case 42:
        return Mode.v4;
      case 43:
        return Mode.voi;
      case 44:
        return Mode.winmor;
      case 45:
        return Mode.wspr;
      case 46:
        return Mode.amtorfec;
      case 47:
        return Mode.asci;
      case 48:
        return Mode.c4fm;
      case 49:
        return Mode.chip64;
      case 50:
        return Mode.chip128;
      case 51:
        return Mode.dominoF;
      case 52:
        return Mode.dstar;
      case 53:
        return Mode.fmhell;
      case 54:
        return Mode.fsk31;
      case 55:
        return Mode.gtor;
      case 56:
        return Mode.hell80;
      case 57:
        return Mode.hfsk;
      case 58:
        return Mode.jt4a;
      case 59:
        return Mode.jt4b;
      case 60:
        return Mode.jt4c;
      case 61:
        return Mode.jt4d;
      case 62:
        return Mode.jt4e;
      case 63:
        return Mode.jt4f;
      case 64:
        return Mode.jt4g;
      case 65:
        return Mode.jt65a;
      case 66:
        return Mode.jt65b;
      case 67:
        return Mode.jt65c;
      case 68:
        return Mode.mfsk8;
      case 69:
        return Mode.mfsk16;
      case 70:
        return Mode.pac2;
      case 71:
        return Mode.pac3;
      case 72:
        return Mode.pax2;
      case 73:
        return Mode.pcw;
      case 74:
        return Mode.psk10;
      case 75:
        return Mode.psk31;
      case 76:
        return Mode.psk63;
      case 77:
        return Mode.psk63f;
      case 78:
        return Mode.psk125;
      case 79:
        return Mode.pskam10;
      case 80:
        return Mode.pskam31;
      case 81:
        return Mode.pskam50;
      case 82:
        return Mode.pskfec31;
      case 83:
        return Mode.pskhell;
      case 84:
        return Mode.qpsk31;
      case 85:
        return Mode.qpsk63;
      case 86:
        return Mode.qpsk125;
      case 87:
        return Mode.thrbx;
      default:
        return Mode.am;
    }
  }

  @override
  void write(BinaryWriter writer, Mode obj) {
    switch (obj) {
      case Mode.am:
        writer.writeByte(0);
        break;
      case Mode.ardop:
        writer.writeByte(1);
        break;
      case Mode.atv:
        writer.writeByte(2);
        break;
      case Mode.chip:
        writer.writeByte(3);
        break;
      case Mode.clo:
        writer.writeByte(4);
        break;
      case Mode.contesti:
        writer.writeByte(5);
        break;
      case Mode.cw:
        writer.writeByte(6);
        break;
      case Mode.digitalVoice:
        writer.writeByte(7);
        break;
      case Mode.domino:
        writer.writeByte(8);
        break;
      case Mode.dynamic:
        writer.writeByte(9);
        break;
      case Mode.fax:
        writer.writeByte(10);
        break;
      case Mode.fm:
        writer.writeByte(11);
        break;
      case Mode.fsk441:
        writer.writeByte(12);
        break;
      case Mode.ft8:
        writer.writeByte(13);
        break;
      case Mode.hell:
        writer.writeByte(14);
        break;
      case Mode.iscat:
        writer.writeByte(15);
        break;
      case Mode.jt4:
        writer.writeByte(16);
        break;
      case Mode.jt6m:
        writer.writeByte(17);
        break;
      case Mode.jt9:
        writer.writeByte(18);
        break;
      case Mode.jt44:
        writer.writeByte(19);
        break;
      case Mode.jt65:
        writer.writeByte(20);
        break;
      case Mode.mfsk:
        writer.writeByte(21);
        break;
      case Mode.msk144:
        writer.writeByte(22);
        break;
      case Mode.mt63:
        writer.writeByte(23);
        break;
      case Mode.olivia:
        writer.writeByte(24);
        break;
      case Mode.opera:
        writer.writeByte(25);
        break;
      case Mode.pac:
        writer.writeByte(26);
        break;
      case Mode.pax:
        writer.writeByte(27);
        break;
      case Mode.pkt:
        writer.writeByte(28);
        break;
      case Mode.psk:
        writer.writeByte(29);
        break;
      case Mode.psk2k:
        writer.writeByte(30);
        break;
      case Mode.q15:
        writer.writeByte(31);
        break;
      case Mode.qra64:
        writer.writeByte(32);
        break;
      case Mode.ros:
        writer.writeByte(33);
        break;
      case Mode.rtty:
        writer.writeByte(34);
        break;
      case Mode.rttyM:
        writer.writeByte(35);
        break;
      case Mode.ssb:
        writer.writeByte(36);
        break;
      case Mode.sstv:
        writer.writeByte(37);
        break;
      case Mode.t10:
        writer.writeByte(38);
        break;
      case Mode.thor:
        writer.writeByte(39);
        break;
      case Mode.thrb:
        writer.writeByte(40);
        break;
      case Mode.tor:
        writer.writeByte(41);
        break;
      case Mode.v4:
        writer.writeByte(42);
        break;
      case Mode.voi:
        writer.writeByte(43);
        break;
      case Mode.winmor:
        writer.writeByte(44);
        break;
      case Mode.wspr:
        writer.writeByte(45);
        break;
      case Mode.amtorfec:
        writer.writeByte(46);
        break;
      case Mode.asci:
        writer.writeByte(47);
        break;
      case Mode.c4fm:
        writer.writeByte(48);
        break;
      case Mode.chip64:
        writer.writeByte(49);
        break;
      case Mode.chip128:
        writer.writeByte(50);
        break;
      case Mode.dominoF:
        writer.writeByte(51);
        break;
      case Mode.dstar:
        writer.writeByte(52);
        break;
      case Mode.fmhell:
        writer.writeByte(53);
        break;
      case Mode.fsk31:
        writer.writeByte(54);
        break;
      case Mode.gtor:
        writer.writeByte(55);
        break;
      case Mode.hell80:
        writer.writeByte(56);
        break;
      case Mode.hfsk:
        writer.writeByte(57);
        break;
      case Mode.jt4a:
        writer.writeByte(58);
        break;
      case Mode.jt4b:
        writer.writeByte(59);
        break;
      case Mode.jt4c:
        writer.writeByte(60);
        break;
      case Mode.jt4d:
        writer.writeByte(61);
        break;
      case Mode.jt4e:
        writer.writeByte(62);
        break;
      case Mode.jt4f:
        writer.writeByte(63);
        break;
      case Mode.jt4g:
        writer.writeByte(64);
        break;
      case Mode.jt65a:
        writer.writeByte(65);
        break;
      case Mode.jt65b:
        writer.writeByte(66);
        break;
      case Mode.jt65c:
        writer.writeByte(67);
        break;
      case Mode.mfsk8:
        writer.writeByte(68);
        break;
      case Mode.mfsk16:
        writer.writeByte(69);
        break;
      case Mode.pac2:
        writer.writeByte(70);
        break;
      case Mode.pac3:
        writer.writeByte(71);
        break;
      case Mode.pax2:
        writer.writeByte(72);
        break;
      case Mode.pcw:
        writer.writeByte(73);
        break;
      case Mode.psk10:
        writer.writeByte(74);
        break;
      case Mode.psk31:
        writer.writeByte(75);
        break;
      case Mode.psk63:
        writer.writeByte(76);
        break;
      case Mode.psk63f:
        writer.writeByte(77);
        break;
      case Mode.psk125:
        writer.writeByte(78);
        break;
      case Mode.pskam10:
        writer.writeByte(79);
        break;
      case Mode.pskam31:
        writer.writeByte(80);
        break;
      case Mode.pskam50:
        writer.writeByte(81);
        break;
      case Mode.pskfec31:
        writer.writeByte(82);
        break;
      case Mode.pskhell:
        writer.writeByte(83);
        break;
      case Mode.qpsk31:
        writer.writeByte(84);
        break;
      case Mode.qpsk63:
        writer.writeByte(85);
        break;
      case Mode.qpsk125:
        writer.writeByte(86);
        break;
      case Mode.thrbx:
        writer.writeByte(87);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
