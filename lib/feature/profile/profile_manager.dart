import 'package:flutter_qso/data/repository/settings_repository.dart';
import 'package:flutter_qso/feature/profile/profile_state_holder.dart';

class ProfileManager {
  final ProfileStateHolder holder;
  final SettingsRepository settingsRepository;

  ProfileManager({required this.holder, required this.settingsRepository});

  void init() {
    holder.setCallsign(settingsRepository.callsign);
    holder.setLocale(settingsRepository.locale);
  }

  void setCallsign(String callsign) {
    holder.setCallsign(callsign);
    settingsRepository.storeData(callsign: callsign);
  }

  void setLocale(String? locale) {
    if (locale != null) {
      holder.setLocale(locale);
      settingsRepository.storeData(locale: locale);
    }
  }
}