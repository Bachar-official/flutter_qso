import 'package:flutter/material.dart';
import 'package:flutter_qso/data/entity/qso.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('settings');
  await Hive.openBox<List<QSO>>('qso');
  di.init();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
