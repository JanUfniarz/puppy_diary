import 'package:flutter/material.dart';
import 'package:puppy_diary/logic/functions/date_time_functions.dart';
import 'package:puppy_diary/types/entities/event.dart';
import 'package:puppy_diary/ui/widgets/buttons/delete_button.dart';
import 'package:puppy_diary/ui/widgets/decorators/outlined_card.dart';

class EventItem extends StatefulWidget {
  final Event event;
  final ({
  void Function() done,
  void Function() edit,
  void Function() delete
  }) actions;

  const EventItem(this.event, {super.key, required this.actions});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool _isExpanded = false;


  List<Widget> actionButtons() => [

    FilledButton.icon(
        onPressed: widget.actions.edit,
        icon: const Icon(Icons.edit),
        label: const Text('Edit')
    ),

    DeleteButton(
        onPressed: widget.actions.delete
    ),
  ];


  @override
  Widget build(BuildContext context) {


    ListTile info = ListTile(
        leading: Icon(widget.event.type.icon),

        title: Text(
            widget.event.type.label,
            style: Theme.of(context).textTheme.titleMedium
        ),

        subtitle: Text(userFormat(widget.event.time)),

        trailing: InkWell(
          onTap: widget.actions.done,
          child: widget.event.done
              ? const Icon(Icons.check_box)
              : const Icon(Icons.check_box_outline_blank),
        )
    );


    return InkWell(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: Column(
        children: [

          info,

          if (_isExpanded && widget.event.note.isNotEmpty) Padding(
            padding: const EdgeInsets.all(4),
            child: OutlinedCard(
              child: Text(widget.event.note),
            ),
          ),

          if (_isExpanded) Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: actionButtons(),
            ),
          ),
        ],
      ),
    );
  }
}