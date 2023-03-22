import 'package:flutter_qso/feature/profile/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileStateHolder extends StateNotifier<ProfileState> {
  ProfileStateHolder() : super(const ProfileState.initial());

  ProfileState get profileState => state;

  void setCallsign(String callsign) {
    state = state.copyWith(callsign: callsign);
  }

  void setLocale(String locale) {
    state = state.copyWith(locale: locale);
  }
}