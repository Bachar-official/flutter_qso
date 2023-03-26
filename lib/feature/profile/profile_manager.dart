import 'package:flutter/cupertino.dart';
import 'package:flutter_qso/data/repository/settings_repository.dart';
import 'package:flutter_qso/feature/new_log/new_log_manager.dart';
import 'package:flutter_qso/feature/profile/profile_state_holder.dart';

class ProfileManager {
  final ProfileStateHolder holder;
  final SettingsRepository settingsRepository;
  final NewLogManager newLogManager;
  final TextEditingController controller = TextEditingController(text: '');

  ProfileManager({required this.holder, required this.settingsRepository, required this.newLogManager});

  void init() {
    holder.setCallsign(settingsRepository.callsign);
    holder.setLocale(settingsRepository.locale);
    holder.setTheme(settingsRepository.theme);
    controller.value = TextEditingValue(text: holder.profileState.callsign);
  }

  void setCallsign(String callsign) {
    holder.setCallsign(callsign);
    settingsRepository.storeData(callsign: callsign);
    newLogManager.setOperator(callsign);
  }

  void setLocale(String? locale) {
    if (locale != null) {
      holder.setLocale(locale);
      settingsRepository.storeData(locale: locale);
    }
  }

  void setTheme(String? theme) {
    if (theme != null) {
      holder.setTheme(theme);
      settingsRepository.storeData(theme: theme);
    }
  }
}