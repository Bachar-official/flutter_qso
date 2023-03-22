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

  @HiveField(8)
  String qth;

  @HiveField(9)
  String comment;

  QSO({
    required this.operator,
    required this.call,
    required this.qsoDate,
    required this.timeOn,
    required this.mode,
    required this.rstSent,
    required this.rstRcvd,
    required this.band,
    required this.qth,
    required this.comment,
  });

  String toADIFString() {
    return '<operator:${operator.length}>$operator'
        '<call:${call.length}>$call'
        '<qso_date:${qsoDate.length}>$qsoDate'
        '<time_on:${timeOn.length}>$timeOn'
        '<mode:${mode.name.length}>${mode.name}'
        '${rstSent.isNotEmpty ? '<rst_sent:${rstSent.length}>$rstSent' : ''}'
        '${rstRcvd.isNotEmpty ? '<rst_rcvd:${rstRcvd.length}>$rstRcvd' : ''}'
        '<band:${band.name.length}>${band.name}'
        '${qth.isNotEmpty ? '<qth:${qth.length}>$qth' : ''}'
        '${comment.isNotEmpty ? '<comment:${comment.length}>$comment}' : ''}'
        '<eor>\n';
  }
}
