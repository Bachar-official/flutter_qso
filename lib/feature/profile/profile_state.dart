import 'package:flutter/material.dart';

@immutable
class ProfileState {
  final String callsign;
  final String locale;

  const ProfileState({required this.callsign, required this.locale});

  const ProfileState.initial()
      : callsign = '',
        locale = 'en';

  ProfileState copyWith({String? callsign, String? locale}) => ProfileState(
      callsign: callsign ?? this.callsign, locale: locale ?? this.locale);
}
