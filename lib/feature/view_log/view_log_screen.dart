import 'package:flutter/material.dart';
import 'package:flutter_qso/app/di.dart';
import 'package:flutter_qso/data/entity/qso.dart';
import 'package:flutter_qso/feature/view_log/components/log_edit.dart';
import 'package:flutter_qso/feature/view_log/components/log_show.dart';
import 'package:flutter_qso/feature/view_log/components/view_log_detele_dialog.dart';
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

    return WillPopScope(
      onWillPop: () async {
        manager.clear();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            state.qso == null
                ? IconButton(
                    onPressed: () => manager.setQSO(qso),
                    icon: const Icon(Icons.edit),
                  )
                : Container(),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => ViewLogDeleteDialog(
                    qso: qso, onDeleteQSO: manager.deleteQso),
              ),
              icon: const Icon(Icons.delete),
            ),
          ],
          title: Text(state.qso?.call ?? qso.call),
        ),
        body: state.qso != null
            ? SingleChildScrollView(
                child: LogEdit(
                  qso: state.qso!,
                  formKey: manager.formKey,
                  manager: manager,
                  onSubmit: () {
                    manager.submit();
                    Navigator.pop(context);
                  },
                ),
              )
            : LogShow(qso: qso),
      ),
    );
  }
}
