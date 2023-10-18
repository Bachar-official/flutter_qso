import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? validateEmpty(String? value, AppLocalizations localization) {
  if (value == null || value.isEmpty) {
    return localization.emptyField;
  }
  return null;
}

String? validateCallsign(String? value, AppLocalizations localization) {
  RegExp pattern = RegExp(r'^[A-Za-z0-9/-]+$');
  if (value == null || value.isEmpty) {
    return localization.emptyField;
  }
  if (value.length < 3) {
    return localization.minCallsignLength;
  }
  if (value.length > 15) {
    return localization.maxCallsignLength;
  }
  if (!pattern.hasMatch(value)) {
    return localization.wrongFormat;
  }
  return null;
}

String? validateRS(String? value, AppLocalizations localization) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (int.tryParse(value) == null) {
    return localization.onlyDigit;
  }
  if (value.length != 2 && value.length != 3) {
    return localization.onlyDigit;
  }
  if (int.parse(value[0]) < 1 || int.parse(value[0]) > 5) {
    return localization.readabilityReq;
  }
  if (int.parse(value[1]) < 1 || int.parse(value[1]) > 9) {
    return localization.strengthReq;
  }
  if (value.length == 3) {
    if (int.parse(value[2]) < 1 || int.parse(value[2]) > 9) {
      return localization.toneReq;
    }
  }
  return null;
}
