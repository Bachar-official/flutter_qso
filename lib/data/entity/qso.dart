import 'package:hive/hive.dart';

import '../constants/band.dart';
import '../constants/mode.dart';

part 'qso.g.dart';

@HiveType(typeId: 0)
class QSO extends HiveObject {
  @HiveField(0)
  String operator;

  @HiveField(1)
  String call;

  @HiveField(2)
  String qsoDate;

  @HiveField(3)
  String timeOn;

  @HiveField(4)
  Mode mode;

  @HiveField(5)
  String rstSent;

  @HiveField(6)
  String rstRcvd;

  @HiveField(7)
  Band band;

  QSO({
    required this.operator,
    required this.call,
    required this.qsoDate,
    required this.timeOn,
    required this.mode,
    required this.rstSent,
    required this.rstRcvd,
    required this.band,
  });
}
