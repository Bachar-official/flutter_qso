import 'package:flutter/material.dart';
import 'package:flutter_qso/data/entity/qso.dart';

@immutable
class ViewLogState {
  final QSO? qso;
  final String name;
  final String rstSent;
  final String rstRcvd;
  final String qth;
  final String comment;

  const ViewLogState(
      {this.qso,
      required this.comment,
      required this.qth,
      required this.rstRcvd,
      required this.name,
      required this.rstSent});

  const ViewLogState.initial()
      : qso = null,
        comment = '',
        qth = '',
        rstSent = '',
        rstRcvd = '',
        name = '';

  ViewLogState copyWith({
    QSO? qso,
    bool isNullableQSO = false,
    String? comment,
    String? qth,
    String? rstSent,
    String? rstRcvd = '',
    String? name = '',
  }) =>
      ViewLogState(
        qso: isNullableQSO ? null : qso ?? this.qso,
        comment: comment ?? this.comment,
        qth: qth ?? this.qth,
        rstSent: rstSent ?? this.rstSent,
        rstRcvd: rstRcvd ?? this.rstRcvd,
        name: name ?? this.name,
      );
}
