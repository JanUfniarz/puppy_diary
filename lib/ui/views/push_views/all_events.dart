import 'package:flutter/material.dart';
import 'package:puppy_diary/logic/controllers/app_controller.dart';
import 'package:puppy_diary/types/data_types/core_types.dart';
import 'package:puppy_diary/ui/views/views.dart';
import 'package:puppy_diary/ui/widgets/event_item.dart';

Future<AllEventsVR> pushAllEventsView(
    BuildContext context,
    List<Event> events
) => pushView<AllEventsVR>(
    context, (_) => _AllEventsView(events)
);



class _AllEventsView extends StatefulWidget {

  final List<Event> events;

  const _AllEventsView(this.events);

  @override
  State<_AllEventsView> createState() => _AllEventsViewState();
}

class _AllEventsViewState extends State<_AllEventsView> {

  late List<Event> events;


  @override
  void initState() {
    events = List.of(widget.events);
    super.initState();
  }


  void save(Event event) => AppController.instance.update(event);


  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('All Events'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) => EventItem(
            events[index],
            actions: (
              done: () {
                var e = events[index];
                setState(() {
                  events[index] = (
                    id: e.id, time: e.time, done: !e.done,
                    type: e.type, note: e.note
                  );
                });
                save(events[index]);
              },
              edit: () {},
              delete: () {}
            )
        ),
      ),
    );
}

typedef AllEventsVR = Never?;