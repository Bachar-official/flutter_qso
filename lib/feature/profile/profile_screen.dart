import 'package:flutter/material.dart';
import 'package:flutter_qso/data/constants/locales.dart';
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
    final state = ref.watch(profileProvider);
    final manager = di.profileManager;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).profile),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).language),
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
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).theme),
                  value: state.theme,
                  items: themes.keys
                      .map(
                        (key) => DropdownMenuItem<String>(
                          value: key,
                          child: Text(key),
                        ),
                      )
                      .toList(),
                  onChanged: manager.setTheme),
            ],
          ),
        ),
      ),
    );
  }
}
