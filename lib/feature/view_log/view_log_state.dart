import 'package:flutter/material.dart';
import 'package:flutter_qso/data/entity/qso.dart';

@immutable
class ViewLogState {
  final QSO? qso;
  final QSO? editableQso;

  const ViewLogState({this.qso, this.editableQso});

  const ViewLogState.initial()
      : qso = null,
        editableQso = null;

  ViewLogState copyWith(
          {QSO? qso,
          bool isNullableQSO = false,
          QSO? editableQso,
          bool isNullableEditableQso = false}) =>
      ViewLogState(
        qso: isNullableQSO ? null : qso ?? this.qso,
        editableQso:
            isNullableEditableQso ? null : editableQso ?? this.editableQso,
      );
}
