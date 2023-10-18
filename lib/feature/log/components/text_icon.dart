import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextIcon extends StatelessWidget {
  final Widget icon;
  final String text;

  const TextIcon({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(
          text.isEmpty ? AppLocalizations.of(context).unknown : ' $text',
        ),
      ],
    );
  }
}
