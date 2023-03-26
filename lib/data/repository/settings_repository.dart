import 'package:flutter_qso/data/constants/band.dart';
import 'package:flutter_qso/data/constants/mode.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsRepository {
  late Box<String> _settingsBox;

  SettingsRepository() {
    _settingsBox = Hive.box('settings');
  }

  static const _callsign = 'callsign';
  static const _locale = 'locale';
  static const _theme = 'theme';
  static const _mode = 'mode';
  static const _band = 'band';

  String get callsign => _settingsBox.get(_callsign, defaultValue: '') ?? '';

  String get locale => _settingsBox.get(_locale, defaultValue: 'en') ?? 'en';

  String get theme =>
      _settingsBox.get(_theme, defaultValue: 'Light') ?? 'Light';

  Mode get mode => Mode.values.firstWhere(
        (element) =>
            element.name.toLowerCase() ==
            _settingsBox.get(_mode, defaultValue: 'fm'),
      );

  Band get band => Band.values.firstWhere(
        (element) =>
            element.toString().toLowerCase() ==
            _settingsBox.get(_band, defaultValue: '2m'),
      );

  void storeData(
      {String? callsign, String? locale, String? theme, Mode? mode, Band? band}) async {
    if (callsign != null) {
      await _settingsBox.put(_callsign, callsign);
    }
    if (locale != null) {
      await _settingsBox.put(_locale, locale);
    }
    if (theme != null) {
      await _settingsBox.put(_theme, theme);
    }
    if (mode != null) {
      await _settingsBox.put(_mode, mode.toString());
    } if (band != null) {
      await _settingsBox.put(_band, band.toString());
    }
  }
}
