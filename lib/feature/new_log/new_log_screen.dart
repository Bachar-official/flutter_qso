import 'package:flutter/material.dart';
import 'package:flutter_qso/app/di.dart';
import 'package:flutter_qso/data/constants/band.dart';
import 'package:flutter_qso/data/constants/mode.dart';
import 'package:flutter_qso/data/constants/validators.dart';
import 'package:flutter_qso/feature/new_log/components/date_time_picker.dart';
import 'package:flutter_qso/feature/new_log/components/report_card.dart';
import 'package:flutter_qso/feature/new_log/new_log_state.dart';
import 'package:flutter_qso/feature/new_log/new_log_state_holder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final provider = StateNotifierProvider<NewLogStateHolder, NewLogState>(
    (ref) => di.newLogStateHolder);

class NewLogScreen extends ConsumerWidget {
  const NewLogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final manager = di.newLogManager;

    return WillPopScope(
      onWillPop: () async {
        manager.clear();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).newQso),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: manager.formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).operator),
                      validator: (value) => validateEmpty(value, context),
                      initialValue: state.operator,
                      onChanged: manager.setOperator,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).call),
                      validator: (value) => validateEmpty(value, context),
                      initialValue: state.call,
                      onChanged: manager.setCall,
                    ),
                    CheckboxListTile(
                      value: state.isCurrentDateTime,
                      onChanged: manager.setIsCurrentDateTime,
                      title: Text(AppLocalizations.of(context).getCurrentDate),
                    ),
                    !state.isCurrentDateTime
                        ? DateTimeField(
                            onSetDateTime: manager.setQsoDateTime,
                            dateRangeController: manager.dateController,
                            hintText: AppLocalizations.of(context).qsoDate,
                            firstDate: DateTime.parse('1970-01-01'),
                          )
                        : const SizedBox.shrink(),
                    Autocomplete<Mode>(
                      initialValue: TextEditingValue(
                          text: state.mode.toString().toUpperCase()),
                      optionsBuilder: (TextEditingValue value) =>
                          Mode.values.where(
                        (Mode mode) => mode.toString().toUpperCase().startsWith(
                              value.text.toUpperCase(),
                            ),
                      ),
                      displayStringForOption: (Mode mode) =>
                          mode.toString().toUpperCase(),
                      fieldViewBuilder: (BuildContext context,
                              TextEditingController fieldTextEditingController,
                              FocusNode fieldFocusNode,
                              VoidCallback onFieldSubmitted) =>
                          TextFormField(
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).mode),
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                      ),
                      onSelected: manager.setMode,
                    ),
                    Autocomplete<Band>(
                      initialValue: TextEditingValue(
                          text: state.band.toString().toUpperCase()),
                      optionsBuilder: (TextEditingValue value) =>
                          Band.values.where(
                        (Band band) => band.toString().toUpperCase().startsWith(
                              value.text.toUpperCase(),
                            ),
                      ),
                      displayStringForOption: (Band band) =>
                          band.toString().toUpperCase(),
                      fieldViewBuilder: (BuildContext context,
                              TextEditingController fieldTextEditingController,
                              FocusNode fieldFocusNode,
                              VoidCallback onFieldSubmitted) =>
                          TextFormField(
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).band),
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                      ),
                      onSelected: manager.setBand,
                    ),
                    ReportCard(
                        field: TextFormField(
                          decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).r_s),
                          validator: (value) => validateRS(value, context),
                          initialValue: state.rstSent,
                          onChanged: manager.setRstSent,
                        ),
                        title: AppLocalizations.of(context).rstSent),
                    ReportCard(
                        field: TextFormField(
                          decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).r_s),
                          validator: (value) => validateRS(value, context),
                          initialValue: state.rstRcvd,
                          onChanged: manager.setRstRcvd,
                        ),
                        title: AppLocalizations.of(context).rstRcvd),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).qth),
                      initialValue: state.qth,
                      onChanged: manager.setQth,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).comment),
                      initialValue: state.comment,
                      onChanged: manager.setComment,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        bool result = manager.addQSO();
                        if (result) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(AppLocalizations.of(context).add),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
