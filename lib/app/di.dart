import 'package:flutter/cupertino.dart';
import 'package:flutter_qso/data/repository/settings_repository.dart';
import 'package:flutter_qso/feature/home/home_manager.dart';
import 'package:flutter_qso/feature/home/home_state_holder.dart';

class DI {
  late final SettingsRepository settingsRepository;

  late final HomeManager homeManager;
  late final HomeStateHolder homeStateHolder;

  DI() {
    settingsRepository = SettingsRepository();
    homeStateHolder = HomeStateHolder();
    homeManager = HomeManager(
        holder: homeStateHolder, settingsRepository: settingsRepository);
  }

  void init() {
    debugPrint('DI initialized');
  }
}

final di = DI();
