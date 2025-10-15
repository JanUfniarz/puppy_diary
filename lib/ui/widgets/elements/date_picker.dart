import 'package:flutter/material.dart';
import 'package:puppy_diary/ui/helpers/value_wrapper.dart';

enum DatePickerScope {
  past,
  future,
  both
}

class DatePicker extends StatefulWidget {
  const DatePicker(this.selectedDate, {
    this.scope = DatePickerScope.both,
    super.key,
  });

  final DatePickerScope scope;
  final ValueWrapper<DateTime> selectedDate;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  Future<void> _selectDate(BuildContext context) async {
    (DateTime, DateTime) range = switch (widget.scope) {
      DatePickerScope.past => (DateTime(2000), DateTime.now()),
      DatePickerScope.future => (DateTime.now(), DateTime(2101)),
      DatePickerScope.both => (DateTime(2000), DateTime(2101)),
    };

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate.value,
      firstDate: range.$1,
      lastDate: range.$2,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    if (picked != null && picked != widget.selectedDate.value) {
      setState(() {
        widget.selectedDate.value = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) => OutlinedButton(
    onPressed: () => _selectDate(context),
    child: Text(
      '${widget.selectedDate.value.day}'
          '/${widget.selectedDate.value.month}'
          '/${widget.selectedDate.value.year}',
    ),
  );
}