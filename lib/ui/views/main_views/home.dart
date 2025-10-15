import 'package:flutter/material.dart';
import 'package:puppy_diary/logic/helpers/dog_data.dart';
import 'package:puppy_diary/types/data_types/function_types.dart';
import 'package:puppy_diary/ui/views/push_views/add_event.dart';
import 'package:puppy_diary/ui/views/push_views/all_events.dart';
import 'package:puppy_diary/ui/widgets/components/next_event_card.dart';

AppViewBuilder homeView = (context, controller) => ListView(
  children: <Widget>[


    ElevatedButton(
        onPressed: () => controller.test(),
        child: const Icon(Icons.data_object)
    ),


    if (controller.dog != null) NextEventCard(
        controller.dog!.nextEvent,

        onAllEventsPressed: () => pushAllEventsView(context, controller.dog!.eventHistory)
            .then((_) => controller.loadData()),

        onAddEventPressed: () => pushAddEventView(context)
            .then((val) {
              if (val != null) controller.addEvent(val);
            })
    )


  ].map((el) => Padding(
    padding: const EdgeInsets.all(8),
    child: el,
  )).toList(),
);