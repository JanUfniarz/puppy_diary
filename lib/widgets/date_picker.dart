import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker(this.selectedDate, {super.key});

  final String restorationId = 'Birth Date';
  final RestorableDateTime selectedDate;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerState extends State<DatePicker>
    with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) => navigator.restorablePush(
        _datePickerRoute,
        arguments: widget.selectedDate.value.millisecondsSinceEpoch,
      ),
  );

  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) => DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) => DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime.now(),
        ),
    );

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(widget.selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        widget.selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${widget.selectedDate.value.day}'
                  '/${widget.selectedDate.value.month}'
                  '/${widget.selectedDate.value.year}'
          ),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) => OutlinedButton(
      onPressed: () => setState(() {
          _restorableDatePickerRouteFuture.present();
        }),
      child: Text(
        '${widget.selectedDate.value.day}'
            '/${widget.selectedDate.value.month}'
            '/${widget.selectedDate.value.year}',
      ),
    );
}