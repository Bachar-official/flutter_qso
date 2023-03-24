import 'package:flutter_qso/data/entity/qso.dart';
import 'package:hive_flutter/hive_flutter.dart';

class QSORepository {
  late Box<QSO> _qsoBox;

  QSORepository() {
    _qsoBox = Hive.box('log');
  }

  List<QSO> get qso => _qsoBox.values.toList();

  Map<int, QSO> _convertQso(List<QSO> qso) => qso.asMap();

  void storeData(List<QSO> qso) async {
    await _qsoBox.putAll(_convertQso(qso));
  }

  Future<void> clearData() async {
    await _qsoBox.clear();
  }
}