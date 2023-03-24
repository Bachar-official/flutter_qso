import 'package:flutter/material.dart';
import 'package:flutter_qso/data/entity/qso.dart';

@immutable
class ViewLogState {
  final QSO? qso;

  const ViewLogState({this.qso});

  const ViewLogState.initial(): qso = null;

  ViewLogState copyWith({QSO? qso, bool isNullableQSO = false}) => ViewLogState(
    qso: isNullableQSO ? null : qso ?? this.qso
  );
}