import 'package:flutter/cupertino.dart';
import 'package:flutter_qso/data/constants/band.dart';
import 'package:flutter_qso/data/constants/mode.dart';
import 'package:flutter_qso/data/repository/settings_repository.dart';
import 'package:flutter_qso/feature/log/log_manager.dart';
import 'package:flutter_qso/feature/new_log/new_log_state_holder.dart';

class NewLogManager {
  final NewLogStateHolder holder;
  final LogManager logManager;
  final SettingsRepository settingsRepository;
  final formKey = GlobalKey<FormState>();


  NewLogManager(
      {required this.holder,
      required this.logManager,
      required this.settingsRepository});

  void init() {
    holder.setOperator(settingsRepository.callsign);
    setQsoDateTime(DateTime.now());
  }

  void setOperator(String operator) {
    holder.setOperator(operator);
  }

  void setCall(String call) {
    holder.setCall(call);
  }

  void setQsoDate(String qsoDate) {
    holder.setQsoDate(qsoDate);
  }

  void setTimeOn(String timeOn) {
    holder.setTimeOn(timeOn);
  }

  void setMode(Mode? mode) {
    if (mode != null) {
      holder.setMode(mode);
    }
  }

  void setRstSent(String rstSent) {
    holder.setRstSent(rstSent);
  }

  void setRstRcvd(String rstRcvd) {
    holder.setRstRcvd(rstRcvd);
  }

  void setBand(Band? band) {
    if (band != null) {
      holder.setBand(band);
    }
  }

  void setQth(String qth) {
    holder.setQth(qth);
  }

  void setComment(String comment) {
    holder.setComment(comment);
  }

  void setIsCurrentDateTime(bool? isCurrentDateTime) {
    if (isCurrentDateTime != null) {
      holder.setIsCurrentDateTime(isCurrentDateTime);
      if(isCurrentDateTime) {
        setQsoDateTime(DateTime.now());
      }
    }
  }

  void setQsoDateTime(DateTime qsoDateTime) {
    holder.setQsoDateTime(qsoDateTime);
    _processDateTime(qsoDateTime.toString());
  }

  void setRstSentR(String r) {
    if (holder.newLogState.rstSent.isEmpty || holder.newLogState.rstSent.length == 1) {
      setRstSent('${r}1');
    }
    setRstSent('$r${holder.newLogState.rstSent[1]}');
  }

  void addQSO() {
    if (formKey.currentState!.validate()) {
      logManager.addQSO(holder.newLogState.qso);
    }
  }

  void clear() {
    holder.clearState();
    init();
  }

  void _processDateTime(String dateTime) {
    List<String> dateAndTime = dateTime.split(' ');
    setQsoDate(_processDate(dateAndTime[0]));
    setTimeOn(_processTime(dateAndTime[1]));
  }

  String _processDate(String date) => date.replaceAll('-', '');

  String _processTime(String time) => time.replaceAll(':', '').substring(0,6);
}
