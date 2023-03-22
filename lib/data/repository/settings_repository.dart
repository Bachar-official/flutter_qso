import 'package:hive_flutter/hive_flutter.dart';

class SettingsRepository {
  late Box<String> _settingsBox;

  SettingsRepository() {
    _settingsBox = Hive.box('settings');
  }

  static const _callsign = 'callsign';
  static const _locale = 'locale';

  String get callsign => _settingsBox.get(_callsign, defaultValue: '') ?? '';
  String get locale => _settingsBox.get(_locale, defaultValue: 'en') ?? 'en';

  void storeData({String? callsign, String? locale}) async {
    if (callsign != null) {
      await _settingsBox.put(_callsign, callsign);
    }
    if (locale != null) {
      await _settingsBox.put(_locale, locale);
    }
  }
}
