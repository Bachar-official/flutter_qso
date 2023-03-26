import 'package:flutter/material.dart';
import 'package:flutter_qso/data/entity/qso.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_qso/feature/view_log/view_log_manager.dart';

class LogEdit extends StatelessWidget {
  final QSO qso;
  final Key formKey;
  final ViewLogManager manager;
  final Function() onSubmit;

  const LogEdit(
      {Key? key,
      required this.qso,
      required this.formKey,
      required this.manager,
      required this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration:
                  InputDecoration(labelText: AppLocalizations.of(context).name),
              initialValue: qso.name,
              onChanged: manager.setName,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).rstSent),
              initialValue: qso.rstSent,
              onChanged: manager.setRstSent,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).rstRcvd),
              initialValue: qso.rstRcvd,
              onChanged: manager.setRstRcvd,
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: AppLocalizations.of(context).qth),
              initialValue: qso.qth,
              onChanged: manager.setQth,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).comment),
              initialValue: qso.comment,
              onChanged: manager.setComment,
            ),
            ElevatedButton(
              onPressed: onSubmit,
              child: Text(AppLocalizations.of(context).save),
            ),
          ],
        ),
      ),
    );
  }
}
