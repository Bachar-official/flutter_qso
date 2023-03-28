import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/entity/qso.dart';
import 'log_state.dart';

class LogStateHolder extends StateNotifier<LogState> {
  LogStateHolder(): super(LogState.initial());

  LogState get logState => state;

  void setLog(List<QSO> log) {
    state = state.copyWith(log: log);
  }

  void setQuery(String query) {
    state = state.copyWith(query: query);
  }

  void clearQuery() {
    state = state.copyWith(query: '');
  }
}