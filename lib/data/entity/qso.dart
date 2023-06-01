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

  @HiveField(10)
  String name;

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
    required this.name,
  });

  String toADIFString() {
    return '<operator:${operator.length}>$operator\n'
        '<call:${call.length}>$call\n'
        '<qso_date:${qsoDate.length}>$qsoDate\n'
        '<time_on:${timeOn.length}>$timeOn\n'
        '<mode:${mode.name.length}>${mode.toString()}\n'
        '${rstSent.isNotEmpty ? '<rst_sent:${rstSent.length}>$rstSent\n' : ''}'
        '${rstRcvd.isNotEmpty ? '<rst_rcvd:${rstRcvd.length}>$rstRcvd\n' : ''}'
        '<band:${band.name.length}>${band.toString()}\n'
        '${qth.isNotEmpty ? '<qth:${qth.length}>$qth\n' : ''}'
        '${comment.isNotEmpty ? '<comment:${comment.length}>$comment\n' : ''}'
        '${name.isNotEmpty ? '<name:${name.length}>$name\n' : ''}'
        '<eor>\n';
  }

  QSO.fromJson(Map<String, dynamic> json)
      : operator = json['operator'],
        call = json['call'],
        mode = Mode.values.firstWhere((e) => json['mode'] == e.name),
        rstSent = json['rstSent'],
        rstRcvd = json['rstRcvd'],
        band = Band.values.firstWhere((e) => json['band'] == e.name),
        qth = json['qth'],
        comment = json['comment'],
        name = json['name'],
        qsoDate = json['qsoDate'],
        timeOn = json['timeOn'];

  Map<String, dynamic> toJson() {
    return {
      'operator': operator,
      'call': call,
      'mode': mode.name,
      'rstSent': rstSent,
      'rstRcvd': rstRcvd,
      'band': band.name,
      'qth': qth,
      'comment': comment,
      'name': name,
      'qsoDate': qsoDate,
      'timeOn': timeOn,
    };
  }
}
