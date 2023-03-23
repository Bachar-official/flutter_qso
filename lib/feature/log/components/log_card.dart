import 'package:flutter/material.dart';
import 'package:flutter_qso/data/entity/qso.dart';

class LogCard extends StatelessWidget {
  final QSO qso;
  const LogCard({Key? key, required this.qso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Text(qso.qsoDate)
            ],
          )
        ],
      ),
    );
  }
}
