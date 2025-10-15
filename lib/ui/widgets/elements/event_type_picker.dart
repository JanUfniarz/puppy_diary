import 'package:flutter/material.dart';
import 'package:puppy_diary/types/enums/event_type.dart';
import 'package:puppy_diary/ui/helpers/value_wrapper.dart';

class EventTypePicker extends StatefulWidget {
  final ValueWrapper<EventType> type;
  final VoidCallback? onTypeChanged;

  const EventTypePicker(this.type, {super.key, this.onTypeChanged});


  @override
  State<EventTypePicker> createState() => _EventTypePickerState();
}



class _EventTypePickerState extends State<EventTypePicker> {

  List<DropdownMenuItem<EventType>> get _menuItems => EventType.values
      .map((type) =>
      DropdownMenuItem(
          value: type,
          child: Text(type.label)
      )
  ).toList();


  @override
  Widget build(BuildContext context) => DropdownButton(
      value: widget.type.value,
      items: _menuItems,
      onChanged: (type) => setState(() {
        widget.onTypeChanged?.call();
        if (type != null) widget.type.value = type;
      })
  );
}

