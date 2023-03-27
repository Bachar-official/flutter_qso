import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogDeleteDialog extends StatelessWidget {
  final Function() onClear;

  const LogDeleteDialog({Key? key, required this.onClear}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(AppLocalizations.of(context).clear_qso_confirmation),
      actions: [
        TextButton(
          onPressed: () {
            onClear();
            Navigator.pop(context);
          },
          child: Text(AppLocalizations.of(context).yes),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppLocalizations.of(context).no),
        ),
      ],
    );
  }
}
