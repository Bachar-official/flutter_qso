import 'package:flutter/material.dart';
import 'package:flutter_qso/data/constants/band.dart';
import 'package:flutter_qso/data/constants/mode.dart';
import 'package:flutter_qso/data/entity/qso.dart';

@immutable
class NewLogState {
  final String operator;
  final String call;
  final String qsoDate;
  final String timeOn;
  final Mode mode;
  final String rstSent;
  final String rstRcvd;
  final Band band;
  final String qth;
  final String comment;
  final bool isCurrentDateTime;
  final DateTime qsoDateTime;
  final String name;

  QSO get qso => QSO(
      operator: operator,
      call: call,
      qsoDate: qsoDate,
      timeOn: timeOn,
      mode: mode,
      rstSent: rstSent,
      rstRcvd: rstRcvd,
      band: band,
      qth: qth,
      comment: comment,
      name: name);

  const NewLogState(
      {required this.comment,
      required this.qth,
      required this.rstRcvd,
      required this.rstSent,
      required this.mode,
      required this.timeOn,
      required this.qsoDate,
      required this.operator,
      required this.band,
      required this.call,
      required this.isCurrentDateTime,
      required this.qsoDateTime,
      required this.name});

  NewLogState.initial()
      : comment = '',
        call = '',
        qsoDate = '',
        rstSent = '',
        rstRcvd = '',
        timeOn = '',
        mode = Mode.fm,
        operator = '',
        band = Band.b80m,
        qth = '',
        isCurrentDateTime = false,
        name = '',
        qsoDateTime = DateTime.now();

  NewLogState copyWith({
    String? comment,
    String? call,
    String? qsoDate,
    String? rstSent,
    String? rstRcvd,
    String? timeOn,
    Mode? mode,
    String? operator,
    Band? band,
    String? qth,
    bool? isCurrentDateTime,
    DateTime? qsoDateTime,
    String? name,
  }) =>
      NewLogState(
          call: call ?? this.call,
          comment: comment ?? this.comment,
          qsoDate: qsoDate ?? this.qsoDate,
          rstSent: rstSent ?? this.rstSent,
          rstRcvd: rstRcvd ?? this.rstRcvd,
          timeOn: timeOn ?? this.timeOn,
          operator: operator ?? this.operator,
          mode: mode ?? this.mode,
          band: band ?? this.band,
          qth: qth ?? this.qth,
          isCurrentDateTime: isCurrentDateTime ?? this.isCurrentDateTime,
          qsoDateTime: qsoDateTime ?? this.qsoDateTime,
          name: name ?? this.name);
}
