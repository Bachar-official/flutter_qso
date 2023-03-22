import 'package:flutter/cupertino.dart';
import 'package:flutter_qso/data/repository/settings_repository.dart';
import 'package:flutter_qso/feature/home/home_manager.dart';
import 'package:flutter_qso/feature/home/home_state_holder.dart';

import '../feature/profile/profile_manager.dart';
import '../feature/profile/profile_state_holder.dart';

class DI {
  late final SettingsRepository settingsRepository;

  late final HomeManager homeManager;
  late final HomeStateHolder homeStateHolder;
  late final ProfileManager profileManager;
  late final ProfileStateHolder profileStateHolder;

  DI() {
    settingsRepository = SettingsRepository();
    homeStateHolder = HomeStateHolder();
    homeManager = HomeManager(holder: homeStateHolder);
    profileStateHolder = ProfileStateHolder();
    profileManager = ProfileManager(
        holder: profileStateHolder, settingsRepository: settingsRepository);
  }

  void init() {
    profileManager.init();
    debugPrint('DI initialized');
  }
}

final di = DI();
