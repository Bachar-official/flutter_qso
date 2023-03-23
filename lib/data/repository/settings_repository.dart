import 'package:hive_flutter/hive_flutter.dart';

class SettingsRepository {
  late Box<String> _settingsBox;

  SettingsRepository() {
    _settingsBox = Hive.box('settings');
  }

  static const _callsign = 'callsign';
  static const _locale = 'locale';
  static const _theme = 'theme';

  String get callsign => _settingsBox.get(_callsign, defaultValue: '') ?? '';
  String get locale => _settingsBox.get(_locale, defaultValue: 'en') ?? 'en';
  String get theme => _settingsBox.get(_theme, defaultValue: 'Light') ?? 'Light';

  void storeData({String? callsign, String? locale, String? theme}) async {
    if (callsign != null) {
      await _settingsBox.put(_callsign, callsign);
    }
    if (locale != null) {
      await _settingsBox.put(_locale, locale);
    }
    if (theme != null) {
      await _settingsBox.put(_theme, _theme);
    }
  }
}
