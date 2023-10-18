import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum FieldType {
  text,
  dropdown,
}

class QsoField {
  final String name;
  final FieldType type;
  final void Function(String?, AppLocalizations)? validator;

  const QsoField(
      {required this.name, required this.type, required this.validator});
}
