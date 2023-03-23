import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final Widget field;
  final String title;

  const ReportCard(
      {Key? key,
      required this.field,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title),
            field,
          ],
        ),
      ),
    );
  }
}
