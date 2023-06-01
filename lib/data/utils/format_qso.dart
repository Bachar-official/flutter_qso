import 'dart:convert';
import '../entity/qso.dart';

String formatQSODate(String date) =>
    '${date.substring(0, 4)}-${date.substring(4, 6)}-${date.substring(6, 8)}';

String formatQSOTime(String time) =>
    '${time.substring(0, 2)}:${time.substring(2, 4)}:${time.substring(4, 6)}';

String qsoListToJson(List<QSO> qsoList) {
  const jsonEncoder = JsonEncoder();
  return jsonEncoder.convert(qsoList.map((qso) => qso.toJson()).toList());
}

List<QSO> parseQSOList(String message) {
  const jsonDecoder = JsonDecoder();
  List<dynamic> list = jsonDecoder.convert(message);
  return list.map((entry) => QSO.fromJson(entry)).toList();
}