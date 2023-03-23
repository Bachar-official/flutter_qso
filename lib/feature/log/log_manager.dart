import 'package:flutter_qso/feature/log/log_state_holder.dart';

import '../../data/entity/qso.dart';
import '../../data/repository/qso_repository.dart';

class LogManager {
  final LogStateHolder holder;
  final QSORepository qsoRepository;

  LogManager({required this.holder, required this.qsoRepository});

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

  void clearList() async {
    await qsoRepository.clearData();
    setQSO([]);
  }
}