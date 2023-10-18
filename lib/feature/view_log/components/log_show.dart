import 'package:flutter/material.dart';
import 'package:flutter_qso/data/entity/qso.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_qso/data/utils/format_qso.dart';

class LogShow extends StatelessWidget {
  final QSO qso;
  final TextStyle style = const TextStyle(fontSize: 17);

  const LogShow({Key? key, required this.qso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${localization.qsoDate} : ${formatQSODate(qso.qsoDate)}, ${formatQSOTime(qso.timeOn)}',
            style: style,
          ),
          Text(
            '${localization.band} : ${qso.band}',
            style: style,
          ),
          Text(
            '${localization.mode} : ${qso.mode}',
            style: style,
          ),
          qso.rstSent.isNotEmpty
              ? Text(
                  '${localization.rstSent} : ${qso.rstSent}',
                  style: style,
                )
              : emptyPlace,
          qso.rstRcvd.isNotEmpty
              ? Text(
                  '${localization.rstRcvd} : ${qso.rstRcvd}',
                  style: style,
                )
              : emptyPlace,
          qso.name.isNotEmpty
              ? Text(
                  '${localization.name} : ${qso.name}',
                  style: style,
                )
              : emptyPlace,
          qso.qth.isNotEmpty
              ? Text(
                  '${localization.qth} : ${qso.qth}',
                  style: style,
                )
              : emptyPlace,
          qso.comment.isNotEmpty
              ? Text(
                  '${localization.comment} : ${qso.comment}',
                  style: style,
                )
              : emptyPlace,
        ],
      ),
    );
  }
}

var emptyPlace = Container();
