import 'package:flutter/material.dart';
import 'package:flutter_qso/app/di.dart';
import 'package:flutter_qso/app/routing.dart';
import 'package:flutter_qso/feature/log/components/log_card.dart';
import 'package:flutter_qso/feature/log/log_state.dart';
import 'package:flutter_qso/feature/log/log_state_holder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final logProvider =
    StateNotifierProvider<LogStateHolder, LogState>((ref) => di.logStateHolder);

class LogScreen extends ConsumerWidget {
  const LogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(logProvider);
    final manager = di.logManager;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).log),
      ),
      body: ListView(
        children: state.log.map((log) => LogCard(qso: log)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AppRouter.newQsoScreen);
        },
      ),
    );
  }
}
