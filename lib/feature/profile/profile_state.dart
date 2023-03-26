import 'package:flutter/material.dart';
import 'package:flutter_qso/data/constants/band.dart';
import 'package:flutter_qso/data/constants/mode.dart';

@immutable
class ProfileState {
  final String callsign;
  final String locale;
  final String theme;
  final Mode mode;
  final Band band;

  const ProfileState(
      {required this.callsign,
      required this.locale,
      required this.theme,
      required this.mode,
      required this.band});

  const ProfileState.initial()
      : callsign = '',
        locale = 'en',
        theme = 'Light',
        mode = Mode.fm,
        band = Band.b2m;

  ProfileState copyWith(
          {String? callsign,
          String? locale,
          String? theme,
          Mode? mode,
          Band? band}) =>
      ProfileState(
          callsign: callsign ?? this.callsign,
          locale: locale ?? this.locale,
          theme: theme ?? this.theme,
          mode: mode ?? this.mode,
          band: band ?? this.band);
}
