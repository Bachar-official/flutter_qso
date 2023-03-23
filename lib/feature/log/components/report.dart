import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  const Report({Key? key, required this.isSent, required this.report})
      : super(key: key);
  final String report;
  final bool isSent;

  @override
  Widget build(BuildContext context) {
    if (report.isEmpty) {
      return const SizedBox.shrink();
    }
    if (isSent) {
      return Row(
        children: [
          Text(
            report,
            style: TextStyle(
              color: _getReportColor(report),
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: _getReportColor(report),
          ),
        ],
      );
    }
    return Row(
      children: [
        Icon(
          Icons.arrow_forward,
          color: _getReportColor(report),
        ),
        Text(
          report,
          style: TextStyle(
            color: _getReportColor(report),
          ),
        ),
      ],
    );
  }
}

Color _getReportColor(String report) {
  int readability = int.parse(report[0]);
  int strength = int.parse(report[1]);

  if (readability < 3 || strength < 5) {
    return Colors.red;
  }
  if (readability > 4 || strength > 8) {
    return Colors.green;
  }
  return Colors.yellow;
}
