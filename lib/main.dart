import 'package:flutter/material.dart';
import 'package:flutter_qso/data/constants/band.dart';
import 'package:flutter_qso/data/constants/mode.dart';
import 'package:flutter_qso/data/entity/qso.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(BandAdapter())
    ..registerAdapter(ModeAdapter())
    ..registerAdapter(QSOAdapter());
  await Hive.openBox<String>('settings');
  await Hive.openBox<QSO>('log');
  di.init();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
