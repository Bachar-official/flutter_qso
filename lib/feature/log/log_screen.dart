import 'package:flutter/material.dart';
import 'package:flutter_qso/app/di.dart';
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
    final localization = AppLocalizations.of(context);
    final state = ref.watch(logProvider);
    final manager = di.logManager;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 15),
            child: SizedBox(
              height: 30,
              child: TextFormField(
                controller: manager.queryController,
                decoration: InputDecoration(
                  hintText: localization.query,
                  suffix: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: manager.clearQuery,
                  ),
                ),
                onChanged: manager.setQuery,
              ),
            ),
          ),
        ),
        title: Text(localization.log),
        actions: [
          IconButton(
            tooltip: localization.delete_all,
            onPressed: state.actualLog.isEmpty
                ? null
                : () => showDialog(
                      context: context,
                      builder: (context) =>
                          LogDeleteDialog(onClear: manager.clearList),
                    ),
            icon: const Icon(Icons.folder_delete_outlined),
          ),
          IconButton(
            tooltip: localization.export,
            onPressed: state.actualLog.isEmpty ? null : manager.share,
            icon: const Icon(Icons.file_copy_outlined),
          ),
          IconButton(
            onPressed: manager.import,
            icon: const Icon(Icons.inbox),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: state.actualLog.map((log) => LogCard(qso: log)).toList(),
          ),
          Center(
            child: Text(
              state.actualLog.isEmpty ? localization.no_qsos : '',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: manager.goToNewLogPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
