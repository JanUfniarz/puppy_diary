import 'package:flutter/material.dart';
import 'package:puppy_diary/types/data_types/core_types.dart';
import 'package:puppy_diary/ui/style/icon_theme.dart';

class NextEventCard extends StatelessWidget {
  final IconData? icon;
  final String label;
  final String? date;
  final void Function()? onAllEventsPressed;
  final void Function() onAddEventPressed;
  final bool isEmpty;

  NextEventCard(Event? nextEvent, {
    required this.onAllEventsPressed,
    required this.onAddEventPressed,
    super.key,
  }) : icon = nextEvent?.type.icon,
       label = nextEvent?.type.label ?? 'No upcoming events',
       date = dateFormat(nextEvent?.time),
       isEmpty = nextEvent == null;


  static String dateFormat(DateTime? date) => "${date?.day}.${date?.month}.${date?.year}";



  @override
  Widget build(BuildContext context) {
    print("isEmpty: $isEmpty");
    var content = <Widget>[
      if (!isEmpty) Theme(
          data: ThemeData(iconTheme: mainIcon),
          child: Icon(icon!)
      ),

      Text('$label:',
        style: Theme.of(context).textTheme.bodyLarge,
      ),

      if (!isEmpty) Text(date!,
        style: Theme.of(context).textTheme.bodyLarge,
      )

    ];



    var buttons = <Widget>[

      if (!isEmpty) FilledButton(
          onPressed: onAllEventsPressed,
          child: const Row(
            children: [
              Icon(Icons.list_alt_outlined),
              Text('  All Events'),
            ],
          )
      ),

      ElevatedButton(
          onPressed: onAddEventPressed,
          child: const Row(
            children: [
              Icon(Icons.add),
              Text('  Add Event'),
            ],
          )
      )

    ];



    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: content,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 20
              ),
              child: Divider(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buttons,
            ),

          ],
        ),
      ),
    );
  }
}