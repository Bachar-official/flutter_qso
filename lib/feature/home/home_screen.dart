import 'package:flutter/material.dart';
import 'package:flutter_qso/app/di.dart';
import 'package:flutter_qso/feature/home/home_state_holder.dart';
import 'package:flutter_qso/feature/log/log_screen.dart';
import 'package:flutter_qso/feature/profile/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_state.dart';

final homeProvider = StateNotifierProvider<HomeStateHolder, HomeState>(
    (ref) => di.homeStateHolder);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final manager = di.homeManager;
    return Scaffold(
      body: <Widget>[
        const LogScreen(),
        const ProfileScreen(),
      ][state.pageNumber],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: manager.setPageNumber,
        selectedIndex: state.pageNumber,
        destinations: [
          NavigationDestination(icon: const Icon(Icons.table_rows), label: AppLocalizations.of(context).log),
          NavigationDestination(icon: const Icon(Icons.person), label: AppLocalizations.of(context).profile),
        ],
      ),
    );
  }
}
