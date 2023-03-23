import 'package:flutter/material.dart';

class DateTimeField extends StatefulWidget {
  final DateTime? value;
  final void Function(DateTime?) onSetDateTime;
  final String hintText;
  final DateTime firstDate;

  const DateTimeField(
      {Key? key,
      required this.onSetDateTime,
      required this.hintText,
      required this.firstDate,
      this.value})
      : super(key: key);

  @override
  State<DateTimeField> createState() => _DateTimeFieldState();
}

class _DateTimeFieldState extends State<DateTimeField> {
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.fromDateTime(DateTime.now());
  TextEditingController dateRangeController = TextEditingController(text: '');

  void setDate(DateTime? date) {
    if (date != null) {
      dateTime = date;
      setState(() {});
    }
  }

  void setTime(TimeOfDay? time) {
    if (time != null) {
      timeOfDay = time;
      setState(() {});
    }
  }

  void submit() {
    dateTime =
        dateTime.copyWith(hour: timeOfDay.hour, minute: timeOfDay.minute);
    dateRangeController.value = TextEditingValue(text: dateTime.toString());
    setState(() {});
    widget.onSetDateTime(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
            ),
            controller: dateRangeController,
            onTap: () async {
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: widget.firstDate,
                lastDate: DateTime.now(),
              );
              TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: 0, minute: 0),
              );
              setDate(date);
              setTime(time);
              submit();
            },
          ),
        ),
      ],
    );
  }
}
