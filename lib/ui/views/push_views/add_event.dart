import 'package:flutter/material.dart';
import 'package:puppy_diary/types/data_types/utility_types.dart';
import 'package:puppy_diary/types/enums/event_type.dart';
import 'package:puppy_diary/ui/form.dart';
import 'package:puppy_diary/ui/style/icon_theme.dart';
import 'package:puppy_diary/ui/views/views.dart';
import 'package:puppy_diary/ui/widgets/date_picker.dart';

Future<AddEventViewResult?> pushAddEventView(
    BuildContext context
) => pushView<AddEventViewResult>(
    context,
    (_) => _AddEventView()
);


class _AddEventView extends StatefulWidget  {

  @override
  State<_AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<_AddEventView> with FormElements {

  EventType selectedType = EventType.controlWet;
  RestorableDateTime selectedDate = RestorableDateTime(DateTime.now());
  String note = '';



  List<DropdownMenuItem<EventType>> menuItems = EventType.values
      .map((type) =>
          DropdownMenuItem(
              value: type,
              child: Text(type.label)
          )
      ).toList();




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
          child: DropdownButton<EventType>(
            items: menuItems,
            onChanged: (type) => setState(() {
              if (type != null) selectedType = type;
            }),
            value: selectedType,
          ),
        ),
        (
          label: 'Date',
          child: DatePicker(selectedDate),
        )
      ]),


      ...textInputList(context, [
        (
          label: 'Note',
          onChanged: (text) => setState(() => note = text),
        )
      ]),


      ElevatedButton(
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