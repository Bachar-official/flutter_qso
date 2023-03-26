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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppLocalizations.of(context).qsoDate} : ${formatQSODate(qso.qsoDate)}, ${formatQSOTime(qso.timeOn)}',
            style: style,
          ),
          Text(
            '${AppLocalizations.of(context).band} : ${qso.band}',
            style: style,
          ),
          Text(
            '${AppLocalizations.of(context).mode} : ${qso.mode}',
            style: style,
          ),
          qso.rstSent.isNotEmpty
              ? Text(
                  '${AppLocalizations.of(context).rstSent} : ${qso.rstSent}',
                  style: style,
                )
              : emptyPlace,
          qso.rstRcvd.isNotEmpty
              ? Text(
                  '${AppLocalizations.of(context).rstRcvd} : ${qso.rstRcvd}',
                  style: style,
                )
              : emptyPlace,
          qso.name.isNotEmpty
              ? Text(
                  '${AppLocalizations.of(context).name} : ${qso.name}',
                  style: style,
                )
              : emptyPlace,
          qso.qth.isNotEmpty
              ? Text(
                  '${AppLocalizations.of(context).qth} : ${qso.qth}',
                  style: style,
                )
              : emptyPlace,
          qso.comment.isNotEmpty
              ? Text(
                  '${AppLocalizations.of(context).comment} : ${qso.comment}',
                  style: style,
                )
              : emptyPlace,
        ],
      ),
    );
  }
}

var emptyPlace = Container();
