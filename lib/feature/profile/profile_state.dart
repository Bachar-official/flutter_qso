import 'package:flutter/material.dart';

@immutable
class ProfileState {
  final String callsign;
  final String locale;
  final String theme;

  const ProfileState(
      {required this.callsign, required this.locale, required this.theme});

  const ProfileState.initial()
      : callsign = '',
        locale = 'en',
        theme = 'Light';

  ProfileState copyWith({String? callsign, String? locale, String? theme}) =>
      ProfileState(
          callsign: callsign ?? this.callsign,
          locale: locale ?? this.locale,
          theme: theme ?? this.theme);
}
