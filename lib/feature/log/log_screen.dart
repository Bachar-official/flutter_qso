import 'package:flutter/material.dart';
import 'package:flutter_qso/app/di.dart';
import 'package:flutter_qso/app/routing.dart';
import 'package:flutter_qso/feature/log/components/log_card.dart';
import 'package:flutter_qso/feature/log/components/log_delete_dialog.dart';
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
    var brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).log),
        actions: [
          IconButton(
            onPressed: state.log.isEmpty
                ? null
                : () => showDialog(
                      context: context,
                      builder: (context) =>
                          LogDeleteDialog(onClear: manager.clearList),
                    ),
            icon: const Icon(Icons.folder_delete_outlined),
          ),
          IconButton(
            onPressed: state.log.isEmpty ? null : manager.share,
            icon: Badge(
              alignment: const AlignmentDirectional(5, 21),
              label: const Text(
                'ADIF',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.transparent,
              textColor: _getTextColor(state.log, brightness),
              child: const Icon(Icons.file_copy_outlined),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: state.log.map((log) => LogCard(qso: log)).toList(),
          ),
          Center(
            child: Text(
              state.log.isEmpty ? AppLocalizations.of(context).no_qsos : '',
              textAlign: TextAlign.center,
            ),
          ),
        ],
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

Color _getTextColor(List<dynamic> list, Brightness brightness) {
  if (list.isNotEmpty) {
    return Colors.white70;
  }
  if (brightness == Brightness.dark) {
    return Colors.grey;
  }
  return Colors.indigo;
}
