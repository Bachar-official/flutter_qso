import 'package:flutter/material.dart';
import 'package:flutter_qso/app/routing.dart';
import 'package:flutter_qso/data/entity/qso.dart';
import 'package:flutter_qso/data/utils/format_qso.dart';
import 'package:flutter_qso/feature/log/components/report.dart';

import 'text_icon.dart';

class LogCard extends StatelessWidget {
  final QSO qso;

  const LogCard({Key? key, required this.qso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.viewQsoScreen, arguments: qso);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    formatQSODate(qso.qsoDate),
                  ),
                  Text(
                    formatQSOTime(qso.timeOn),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Report(isSent: true, report: qso.rstSent),
                  Text(qso.call, style: const TextStyle(fontSize: 20),),
                  Report(isSent: false, report: qso.rstRcvd),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextIcon(
                      icon: const Icon(Icons.radio),
                      text:
                          '${qso.band.toString().toUpperCase()}, ${qso.mode.toString().toUpperCase()}'),
                  TextIcon(icon: const Icon(Icons.location_city), text: qso.qth),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
