import 'package:flutter_qso/data/constants/band.dart';
import 'package:flutter_qso/data/constants/mode.dart';
import 'package:flutter_qso/feature/new_log/new_log_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewLogStateHolder extends StateNotifier<NewLogState> {
  NewLogStateHolder() : super(NewLogState.initial());

  NewLogState get newLogState => state;

  void setOperator(String operator) {
    state = state.copyWith(operator: operator);
  }

  void setCall(String call) {
    state = state.copyWith(call: call);
  }

  void setQsoDate(String qsoDate) {
    state = state.copyWith(qsoDate: qsoDate);
  }

  void setTimeOn(String timeOn) {
    state = state.copyWith(timeOn: timeOn);
  }

  void setMode(Mode mode) {
    state = state.copyWith(mode: mode);
  }

  void setRstSent(String rstSent) {
    state = state.copyWith(rstSent: rstSent);
  }

  void setRstRcvd(String rstRcvd) {
    state = state.copyWith(rstRcvd: rstRcvd);
  }

  void setBand(Band band) {
    state = state.copyWith(band: band);
  }

  void setQth(String qth) {
    state = state.copyWith(qth: qth);
  }

  void setComment(String comment) {
    state = state.copyWith(comment: comment);
  }

  void clearState() {
    state = NewLogState.initial();
  }

  void setIsCurrentDateTime(bool isCurrentDateTime) {
    state = state.copyWith(isCurrentDateTime: isCurrentDateTime);
  }
}