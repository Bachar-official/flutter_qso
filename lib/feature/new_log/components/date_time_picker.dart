import 'package:flutter/material.dart';

class DateTimeField extends StatefulWidget {
  final DateTime? value;
  final void Function(DateTime?) onSetDateTime;
  final TextEditingController dateRangeController;
  final String hintText;
  final DateTime firstDate;

  const DateTimeField(
      {Key? key,
      required this.onSetDateTime,
      required this.dateRangeController,
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
    dateTime = dateTime.copyWith(hour: timeOfDay.hour, minute: timeOfDay.minute);
    widget.dateRangeController.value = TextEditingValue(text: dateTime.toString());
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
            controller: widget.dateRangeController,
            onTap: () => showDatePicker(
              context: context,
              initialEntryMode: DatePickerEntryMode.inputOnly,
              lastDate: DateTime.now(),
              firstDate: widget.firstDate,
              initialDate: DateTime.now(),
            ).then((value) {
              setDate(value);
              showTimePicker(context: context,
                  initialEntryMode: TimePickerEntryMode.input,
                  initialTime: const TimeOfDay(hour: 0, minute: 0)).then((time) {
                  setTime(time);
              });
              submit();
            }),
          ),
        ),
      ],
    );
  }
}
