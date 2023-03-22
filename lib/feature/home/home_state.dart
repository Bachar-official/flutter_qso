import 'package:flutter/material.dart';

@immutable
class HomeState {
  final int pageNumber;

  const HomeState({required this.pageNumber});

  const HomeState.initial() : pageNumber = 0;

  HomeState copyWith({String? callsign, String? locale, int? pageNumber}) =>
      HomeState(pageNumber: pageNumber ?? this.pageNumber);
}
