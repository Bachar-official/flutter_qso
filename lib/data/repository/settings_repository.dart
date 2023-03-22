import 'package:hive_flutter/adapters.dart';

class SettingsRepository {
  late Box _settingsBox;

  SettingsRepository() {
    _settingsBox = Hive.box('settings');
  }

  static const _callsign = 'callsign';
  static const _locale = 'locale';

  String get callsign => _settingsBox.get(_callsign, defaultValue: '');
  String get locale => _settingsBox.get(_locale, defaultValue: 'en');

  void storeData({String? callsign, String? locale}) async {
    callsign ?? await _settingsBox.put(_callsign, callsign);
    locale ?? await _settingsBox.put(_locale, locale);
  }
}