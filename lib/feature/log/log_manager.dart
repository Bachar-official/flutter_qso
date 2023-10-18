import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qso/app/routing.dart';
import 'dart:io' show Platform, File;
import 'package:flutter_qso/feature/log/log_state_holder.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/entity/qso.dart';
import '../../data/repository/qso_repository.dart';

class LogManager {
  final LogStateHolder holder;
  final QSORepository qsoRepository;
  final TextEditingController queryController = TextEditingController(text: '');
  final GlobalKey<NavigatorState> navKey;

  LogManager(
      {required this.holder,
      required this.qsoRepository,
      required this.navKey});

  void init() {
    holder.setLog(qsoRepository.qso);
  }

  void setQSO(List<QSO> log) {
    holder.setLog(log);
    qsoRepository.storeData(log);
  }

  void addQSO(QSO qso) {
    List<QSO> newLog = [...holder.logState.log, qso];
    setQSO(newLog);
  }

  void setQuery(String query) => holder.setQuery(query);

  void clearQuery() {
    queryController.value = const TextEditingValue(text: '');
    holder.clearQuery();
  }

  void replaceQSO(QSO qso) {
    List<QSO> newLog = holder.logState.log;
    int index = newLog.indexWhere((element) =>
        element.qsoDate == qso.qsoDate && element.timeOn == qso.timeOn);
    newLog[index] = qso;
    setQSO(newLog);
  }

  void removeQSO(QSO qso) {
    List<QSO> newLog = holder.logState.log;
    int index = newLog.indexWhere((element) =>
        element.qsoDate == qso.qsoDate && element.timeOn == qso.timeOn);
    newLog.removeAt(index);
    setQSO(newLog);
  }

  void clearList() async {
    await qsoRepository.clearData();
    setQSO([]);
  }

  void goToNewLogPage() {
    BuildContext context = navKey.currentState!.context;
    Navigator.pushNamed(context, AppRouter.newQsoScreen);
  }

  void share() {
    String adiFileContent = '<adif_ver:5>3.0.5\n'
        '<eoh>\n'
        '${_collectLog()}';
    if (Platform.isWindows) {
      final file = SaveFilePicker()
        ..filterSpecification = {}
        ..defaultFilterIndex = 0
        ..defaultExtension = 'adif';
      File? saved = file.getFile();
      if (saved != null) {
        saved.writeAsStringSync(adiFileContent);
      }
    } else {
      Share.share(adiFileContent);
    }
  }

  String _collectLog() {
    String content = '';
    for (var log in holder.logState.log) {
      content += log.toADIFString();
    }
    return content;
  }
}
