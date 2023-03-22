import 'package:flutter/material.dart';

@immutable
class HomeState {
  final String callsign;
  final String locale;
  final int pageNumber;

  const HomeState(
      {required this.callsign, required this.locale, required this.pageNumber});

  const HomeState.initial()
      : callsign = '',
        locale = 'en',
        pageNumber = 0;

  HomeState copyWith({String? callsign, String? locale, int? pageNumber}) =>
      HomeState(
          callsign: callsign ?? this.callsign,
          locale: locale ?? this.locale,
          pageNumber: pageNumber ?? this.pageNumber);
}
