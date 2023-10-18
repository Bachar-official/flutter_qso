import 'package:flutter/material.dart';
import 'package:flutter_qso/data/constants/band.dart';
import 'package:flutter_qso/data/constants/locales.dart';
import 'package:flutter_qso/data/constants/mode.dart';
import 'package:flutter_qso/feature/profile/profile_state.dart';
import 'package:flutter_qso/feature/profile/profile_state_holder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app/di.dart';
import '../../data/constants/themes.dart';

final profileProvider = StateNotifierProvider<ProfileStateHolder, ProfileState>(
    (ref) => di.profileStateHolder);

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context);
    final state = ref.watch(profileProvider);
    final manager = di.profileManager;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).profile),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: manager.controller,
                  onChanged: manager.setCallsign,
                  decoration: InputDecoration(labelText: localization.operator),
                ),
                Autocomplete<Mode>(
                  initialValue: TextEditingValue(
                      text: state.mode.toString().toLowerCase()),
                  optionsBuilder: (TextEditingValue value) => Mode.values.where(
                    (Mode mode) => mode.toString().toLowerCase().startsWith(
                          value.text.toLowerCase(),
                        ),
                  ),
                  displayStringForOption: (Mode mode) =>
                      mode.toString().toLowerCase(),
                  fieldViewBuilder: (BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) =>
                      TextFormField(
                    decoration:
                        InputDecoration(labelText: localization.default_mode),
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                  ),
                  onSelected: manager.setMode,
                ),
                Autocomplete<Band>(
                  initialValue: TextEditingValue(
                      text: state.band.toString().toLowerCase()),
                  optionsBuilder: (TextEditingValue value) => Band.values.where(
                    (Band band) => band.toString().toLowerCase().startsWith(
                          value.text.toLowerCase(),
                        ),
                  ),
                  displayStringForOption: (Band band) =>
                      band.toString().toLowerCase(),
                  fieldViewBuilder: (BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) =>
                      TextFormField(
                    decoration:
                        InputDecoration(labelText: localization.default_band),
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                  ),
                  onSelected: manager.setBand,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: localization.language),
                  value: state.locale,
                  items: locales
                      .map(
                        (key, value) => MapEntry(
                          key,
                          DropdownMenuItem<String>(
                            value: value,
                            child: Text(key),
                          ),
                        ),
                      )
                      .values
                      .toList(),
                  onChanged: manager.setLocale,
                ),
                DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: localization.theme),
                    value: state.theme,
                    items: _themeList(themes.keys),
                    onChanged: manager.setTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> _themeList(Iterable<String> options) {
  return options
      .map(
        (option) => DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        ),
      )
      .toList();
}
