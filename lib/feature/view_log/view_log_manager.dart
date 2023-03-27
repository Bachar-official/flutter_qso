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
    holder.setName(name);
  }

  void setRstSent(String rstSent) {
    holder.setRstSent(rstSent);
  }

  void setRstRcvd(String rstRcvd) {
    holder.setRstRcvd(rstRcvd);
  }

  void setQth(String qth) {
    holder.setQth(qth);
  }

  void setComment(String comment) {
    holder.setComment(comment);
  }

  void submit() {
    QSO qso = holder.logState.qso!;
    qso
    ..name = holder.logState.name
    ..rstSent = holder.logState.rstSent
    ..rstRcvd = holder.logState.rstRcvd
    ..qth = holder.logState.qth
    ..comment = holder.logState.comment;
    setQSO(qso);
    logManager.replaceQSO(holder.logState.qso!);
  }

  void clear() => holder.clear();
}