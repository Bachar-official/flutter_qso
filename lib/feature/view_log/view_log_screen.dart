import 'package:flutter/material.dart';
import 'package:flutter_qso/app/di.dart';
import 'package:flutter_qso/data/entity/qso.dart';
import 'package:flutter_qso/feature/view_log/view_log_state.dart';
import 'package:flutter_qso/feature/view_log/view_log_state_holder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = StateNotifierProvider<ViewLogStateHolder, ViewLogState>(
    (ref) => di.viewLogStateHolder);

class ViewLogScreen extends ConsumerWidget {
  const ViewLogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    QSO qso = ModalRoute.of(context)?.settings.arguments as QSO;
    final state = ref.watch(provider);
    final manager = di.viewLogManager;

    return Scaffold(
      appBar: AppBar(
        title: Text(state.qso?.call ?? 'No'),
      ),
      body: state.qso != null ? const SizedBox.shrink() : Text('AAA')
    );
  }
}
