import 'package:flutter/material.dart';
import 'package:puppy_diary/types/enums/event_type.dart';

class EventTypePicker extends StatelessWidget {
  final EventType? value;
  final void Function(EventType?) onChanged;

  const EventTypePicker({
    this.value,
    required this.onChanged,
    super.key,
  });


  List<DropdownMenuItem<EventType>> get _menuItems => EventType.values
      .map((type) =>
      DropdownMenuItem(
          value: type,
          child: Text(type.label)
      )
  ).toList()..insert(0,
      const DropdownMenuItem(
          value: null,
          child: Text('No Type')
      )
  );

  @override
  Widget build(BuildContext context) => DropdownButton(
      value: value,
      items: _menuItems,
      onChanged: (type) => onChanged(type)
  );
}

