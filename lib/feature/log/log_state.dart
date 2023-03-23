import 'package:flutter/material.dart';

import '../../data/entity/qso.dart';

@immutable
class LogState {
  final List<QSO> log;

  const LogState({required this.log});

  LogState.initial():
      log = [];

  LogState copyWith({List<QSO>? log}) => LogState(log: log ?? this.log);
}