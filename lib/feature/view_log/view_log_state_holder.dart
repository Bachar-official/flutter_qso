import 'package:flutter_qso/data/entity/qso.dart';
import 'package:flutter_qso/feature/view_log/view_log_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewLogStateHolder extends StateNotifier<ViewLogState> {
  ViewLogStateHolder() : super(const ViewLogState.initial());

  ViewLogState get logState => state;

  void setQSO(QSO qso) {
    state = state.copyWith(qso: qso);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setRstSent(String rstSent) {
    state = state.copyWith(rstSent: rstSent);
  }

  void setRstRcvd(String rstRcvd) {
    state = state.copyWith(rstRcvd: rstRcvd);
  }

  void setQth(String qth) {
    state = state.copyWith(qth: qth);
  }

  void setComment(String comment) {
    state = state.copyWith(comment: comment);
  }

  void clear() {
    state = state.copyWith(
      qso: null,
      isNullableQSO: true,
    );
  }
}
