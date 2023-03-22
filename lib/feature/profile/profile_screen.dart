import 'package:flutter/material.dart';
import 'package:flutter_qso/data/constants/locales.dart';
import 'package:flutter_qso/feature/profile/profile_state.dart';
import 'package:flutter_qso/feature/profile/profile_state_holder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/di.dart';

final profileProvider = StateNotifierProvider<ProfileStateHolder, ProfileState>(
    (ref) => di.profileStateHolder);

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    final manager = di.profileManager;

    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
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
      ),
    );
  }
}
