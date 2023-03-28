import 'package:flutter/material.dart';
import 'package:flutter_qso/data/utils/format_qso.dart';

import '../../data/entity/qso.dart';

@immutable
class LogState {
  final List<QSO> log;
  final String query;

  List<QSO> get actualLog => _searchList(log, query);

  const LogState({required this.log, required this.query});

  LogState.initial()
      : log = [],
        query = '';

  LogState copyWith({List<QSO>? log, String? query}) =>
      LogState(log: log ?? this.log, query: query ?? this.query);
}

List<QSO> _searchList(List<QSO> list, String query) {
  if (query.isEmpty) return list;
  String q = query.toLowerCase();
  return list
      .where((qso) =>
          qso.call.toLowerCase().contains(q) ||
          qso.band.toString().toLowerCase().contains(q) ||
          qso.mode.toString().toLowerCase().contains(q) ||
          qso.comment.toString().toLowerCase().contains(q) ||
          qso.qth.toString().toLowerCase().contains(q) ||
          qso.rstRcvd.contains(q) ||
          qso.rstSent.contains(q) ||
          qso.name.contains(q) ||
          formatQSODate(qso.qsoDate).contains(q) ||
          formatQSOTime(qso.timeOn).contains(q))
      .toList();
}
