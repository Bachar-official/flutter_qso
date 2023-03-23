import 'package:flutter/cupertino.dart';
import 'package:flutter_qso/data/repository/qso_repository.dart';
import 'package:flutter_qso/data/repository/settings_repository.dart';
import 'package:flutter_qso/feature/home/home_manager.dart';
import 'package:flutter_qso/feature/home/home_state_holder.dart';

import '../feature/log/log_manager.dart';
import '../feature/log/log_state_holder.dart';
import '../feature/profile/profile_manager.dart';
import '../feature/profile/profile_state_holder.dart';

class DI {
  late final SettingsRepository settingsRepository;
  late final QSORepository qsoRepository;

  late final HomeManager homeManager;
  late final HomeStateHolder homeStateHolder;
  late final ProfileManager profileManager;
  late final ProfileStateHolder profileStateHolder;
  late final LogStateHolder logStateHolder;
  late final LogManager logManager;

  DI() {
    settingsRepository = SettingsRepository();
    qsoRepository = QSORepository();

    homeStateHolder = HomeStateHolder();
    homeManager = HomeManager(holder: homeStateHolder);

    profileStateHolder = ProfileStateHolder();
    profileManager = ProfileManager(
        holder: profileStateHolder, settingsRepository: settingsRepository);

    logStateHolder = LogStateHolder();
    logManager =
        LogManager(holder: logStateHolder, qsoRepository: qsoRepository);
  }

  void init() {
    profileManager.init();
    logManager.init();
    debugPrint('DI initialized');
  }
}

final di = DI();