import 'package:flutter_qso/data/entity/qso.dart';
import 'package:flutter_qso/feature/view_log/view_log_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewLogStateHolder extends StateNotifier<ViewLogState> {
  ViewLogStateHolder() : super(const ViewLogState.initial());

  ViewLogState get logState => state;

  void setQSO(QSO qso) {
    state = state.copyWith(qso: qso);
  }

  void setEditableQSO(QSO qso) {
    state = state.copyWith(editableQso: qso);
  }

  void clear() {
    state = state.copyWith(
        qso: null,
        isNullableQSO: true,
        editableQso: null,
        isNullableEditableQso: true);
  }
}
