import 'package:flutter/material.dart';
import 'package:puppy_diary/logic/controllers/app_controller.dart';
import 'package:puppy_diary/types/entities/event.dart';
import 'package:puppy_diary/ui/views/sheets/edit_event_sheet.dart';
import 'package:puppy_diary/ui/views/views.dart';
import 'package:puppy_diary/ui/widgets/elements/event_item.dart';
import 'package:puppy_diary/ui/views/sheets/confirm_delete.dart';

Future<void> pushAllEventsView(
    BuildContext context,
    List<Event> events
) => pushView<void>(
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
      events[index] = Event.from(e)
        ..done = !e.done;
    });
    AppController.instance.update(events[index]);
  }


  _delete(int index) => confirmDeleteSheet(context)
      .then((isConfirmed) {
        if (isConfirmed ?? false) {
          var event = events.removeAt(index);
          setState(() {});
          AppController.instance.delete(event);
        }
      }
  );


  _edit(int index) => editEventSheet(context, events[index])
      .then((editedEvent) {
        if (editedEvent != null) {
          setState(() => events[index] = editedEvent);
          AppController.instance.update(editedEvent);
        }
      }
  );


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
              edit: () => _edit(index),
              delete: () => _delete(index)

            )
        ),
      ),
    );
}