import 'package:flutter/cupertino.dart';
import 'package:flutter_qso/data/entity/qso.dart';
import 'package:flutter_qso/feature/log/log_manager.dart';
import 'package:flutter_qso/feature/view_log/view_log_state_holder.dart';

class ViewLogManager {
  final ViewLogStateHolder holder;
  final LogManager logManager;
  final formKey = GlobalKey<FormState>();

  ViewLogManager({required this.holder, required this.logManager});

  void setQSO(QSO qso) {
    holder.setQSO(qso);
  }

  void setName(String name) {
    QSO qso = holder.logState.qso!;
    qso.name = name;
    setQSO(qso);
  }

  void setRstSent(String rstSent) {
    QSO qso = holder.logState.qso!;
    qso.rstSent = rstSent;
    setQSO(qso);
  }

  void setRstRcvd(String rstRcvd) {
    QSO qso = holder.logState.qso!;
    qso.rstRcvd = rstRcvd;
    setQSO(qso);
  }

  void setQth(String qth) {
    QSO qso = holder.logState.qso!;
    qso.qth = qth;
    setQSO(qso);
  }

  void setComment(String comment) {
    QSO qso = holder.logState.qso!;
    qso.comment = comment;
    setQSO(qso);
  }

  void submit() {
    logManager.replaceQSO(holder.logState.qso!);
  }

  void clear() => holder.clear();
}