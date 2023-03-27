import 'package:flutter/material.dart';
import 'package:flutter_qso/data/entity/qso.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewLogDeleteDialog extends StatelessWidget {
  final QSO qso;
  final Function(QSO) onDeleteQSO;

  const ViewLogDeleteDialog(
      {Key? key, required this.qso, required this.onDeleteQSO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(AppLocalizations.of(context).delete_qso_confirmation),
      actions: [
        TextButton(
          onPressed: () {
            onDeleteQSO(qso);
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Text(AppLocalizations.of(context).yes),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppLocalizations.of(context).no),
        )
      ],
    );
  }
}
