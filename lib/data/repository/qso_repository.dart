import 'package:flutter_qso/data/entity/qso.dart';
import 'package:hive_flutter/hive_flutter.dart';

class QSORepository {
  late Box<List<QSO>> _qsoBox;

  QSORepository() {
    _qsoBox = Hive.box('qso');
  }

  static const _qso = 'qso';

  List<QSO> get qso => _qsoBox.get(_qso, defaultValue: []) ?? [];

  void storeData(List<QSO> qso) async {
    await _qsoBox.put(_qso, qso);
  }
}