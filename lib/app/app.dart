import 'package:flutter/material.dart';
import 'package:flutter_qso/app/di.dart';
import 'package:flutter_qso/app/routing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_qso/feature/profile/profile_state.dart';
import 'package:flutter_qso/feature/profile/profile_state_holder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/constants/themes.dart';

final profileProvider = StateNotifierProvider<ProfileStateHolder, ProfileState>((ref) => di.profileStateHolder);

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    return MaterialApp(
      title: 'QSO',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: AppRouter.generateRoute,
      locale: Locale(state.locale),
      theme: themes[state.theme],
    );
  }
}
