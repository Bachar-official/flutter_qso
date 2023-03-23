import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? validateEmpty(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context).emptyField;
  }
  return null;
}

String? validateRS(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (int.tryParse(value) == null) {
    return AppLocalizations.of(context).onlyDigit;
  }
  if (value.length != 2) {
    return AppLocalizations.of(context).onlyDigit;
  }
  if (int.parse(value[0]) < 1 || int.parse(value[0]) > 5) {
    return AppLocalizations.of(context).readabilityReq;
  }
  if (int.parse(value[1]) < 1 || int.parse(value[1]) > 9) {
    return AppLocalizations.of(context).strengthReq;
  }
  return null;
}