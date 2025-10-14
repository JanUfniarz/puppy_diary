import 'package:flutter/material.dart';
import 'package:puppy_diary/logic/controllers/app_controller.dart';
import 'package:puppy_diary/types/data_types/core_types.dart';
import 'package:puppy_diary/ui/views/views.dart';
import 'package:puppy_diary/ui/widgets/elements/event_item.dart';
import 'package:puppy_diary/ui/views/sheets/confirm_delete.dart';

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


  _switchDone(int index) {
    var e = events[index];
    setState(() {
      events[index] = (
        id: e.id, time: e.time, done: !e.done,
        type: e.type, note: e.note
      );
    });
    AppController.instance.update(events[index]);
  }


  _delete(Event event) {
    setState(() => events.remove(event));
    AppController.instance.delete(event);
  }


  Widget get emptyView => const Center(
    child: Text('Your dog has no events.'),
  );


  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('All Events'),
      ),
      body: events.isEmpty ? emptyView : ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) => EventItem(
            events[index],
            actions: (

              done: () => _switchDone(index),

              edit: () {},

              delete: () => confirmDeleteSheet(context)
                  .then((isConfirmed) {
                    if (isConfirmed ?? false) _delete(events[index]);
                  })

            )
        ),
      ),
    );
}

typedef AllEventsVR = Never?;