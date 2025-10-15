import 'package:flutter/material.dart';
import 'package:puppy_diary/types/data_types/view_results.dart';
import 'package:puppy_diary/types/enums/event_type.dart';
import 'package:puppy_diary/ui/helpers/form.dart';
import 'package:puppy_diary/ui/helpers/value_wrapper.dart';
import 'package:puppy_diary/ui/style/icon_theme.dart';
import 'package:puppy_diary/ui/views/views.dart';
import 'package:puppy_diary/ui/widgets/elements/big_text_field.dart';
import 'package:puppy_diary/ui/widgets/elements/date_picker.dart';
import 'package:puppy_diary/ui/widgets/elements/event_type_picker.dart';

Future<AddEventVR?> pushAddEventView(
    BuildContext context
) => pushView<AddEventVR>(
    context,
    (_) => _AddEventView()
);


class _AddEventView extends StatefulWidget  {

  @override
  State<_AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<_AddEventView> with FormElements {

  EventType selectedType = EventType.controlWet;
  ValueWrapper<DateTime> selectedDate = ValueWrapper(DateTime.now());
  String note = '';


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Add New Event')),
    body: elementsArrangement([


      Theme(
        data: ThemeData(iconTheme: mainIcon),
        child: Icon(
          selectedType.icon,
        ),
      ),


      ...inputList(context, [
        (
          label: 'Event Type',
          child: EventTypePicker(
              value: selectedType,
              onChanged: (type) => setState(
                      () => selectedType = type ?? EventType.other
              )
          ),
        ),
        (
          label: 'Date',
          child: DatePicker(selectedDate),
        )
      ]),


      BigTextField(
        label: 'Note',
        onChanged: (text) => setState(() => note = text),
      ),


      FilledButton(
          onPressed: () => Navigator.pop(
              context,
              (
                type: selectedType,
                time: selectedDate.value,
                note: note
              )
          ),
          child: const Text('Save')
      )

    ]),
  );

}