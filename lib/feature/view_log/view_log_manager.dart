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
    if (holder.logState.name.isNotEmpty) {
      qso.name = holder.logState.name;
    }
    if (holder.logState.comment.isNotEmpty) {
      qso.comment = holder.logState.comment;
    }
    if (holder.logState.rstSent.isNotEmpty) {
      qso.rstSent = holder.logState.rstSent;
    }
    if (holder.logState.rstRcvd.isNotEmpty) {
      qso.rstRcvd = holder.logState.rstRcvd;
    }
    if (holder.logState.qth.isNotEmpty) {
      qso.qth = holder.logState.qth;
    }
    if (holder.logState.comment.isNotEmpty) {
      qso.comment = holder.logState.comment;
    }
    setQSO(qso);
    logManager.replaceQSO(holder.logState.qso!);
  }

  void clear() => holder.clear();

  void deleteQso(QSO qso) {
    logManager.removeQSO(qso);
  }
}