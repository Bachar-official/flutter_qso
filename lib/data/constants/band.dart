import 'package:hive_flutter/hive_flutter.dart';

part 'band.g.dart';

@HiveType(typeId: 2)
enum Band {
  @HiveField(0)
  b2190m,
  @HiveField(1)
  b630m,
  @HiveField(2)
  b560m,
  @HiveField(3)
  b160m,
  @HiveField(4)
  b80m,
  @HiveField(5)
  b60m,
  @HiveField(6)
  b40m,
  @HiveField(7)
  b30m,
  @HiveField(8)
  b20m,
  @HiveField(9)
  b17m,
  @HiveField(10)
  b15m,
  @HiveField(11)
  b12m,
  @HiveField(12)
  b10m,
  @HiveField(13)
  b8m,
  @HiveField(14)
  b6m,
  @HiveField(15)
  b5m,
  @HiveField(16)
  b4m,
  @HiveField(17)
  b2m,
  @HiveField(18)
  b1_25m,
  @HiveField(19)
  b70cm,
  @HiveField(20)
  b33cm,
  @HiveField(21)
  b23cm,
  @HiveField(22)
  b13cm,
  @HiveField(23)
  b9cm,
  @HiveField(24)
  b6cm,
  @HiveField(25)
  b3cm,
  @HiveField(26)
  b1_25cm,
  @HiveField(27)
  b6mm,
  @HiveField(28)
  b4mm,
  @HiveField(29)
  b2_5mm,
  @HiveField(30)
  b2mm,
  @HiveField(31)
  b1mm,
  @HiveField(32)
  bsubmm;

  @override
  String toString() => name.substring(1).replaceAll('_', '.');
}
