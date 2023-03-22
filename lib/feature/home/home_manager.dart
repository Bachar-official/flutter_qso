import 'package:flutter_qso/feature/home/home_state_holder.dart';

import '../../data/repository/settings_repository.dart';

class HomeManager {
  final HomeStateHolder holder;
  final SettingsRepository settingsRepository;

  HomeManager({required this.holder, required this.settingsRepository}) {
    holder.setCallsign(settingsRepository.callsign);
    holder.setLocale(settingsRepository.locale);
  }

  void setCallsign(String callsign) {
    holder.setCallsign(callsign);
    settingsRepository.storeData(callsign: callsign);
  }

  void setPageNumber(int pageNumber) {
    holder.setPageNumber(pageNumber);
  }

  void setLocale(String locale) {
    holder.setLocale(locale);
    settingsRepository.storeData(locale: locale);
  }
}