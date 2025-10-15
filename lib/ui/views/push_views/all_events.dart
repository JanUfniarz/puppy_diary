import 'package:flutter/material.dart';
import 'package:puppy_diary/logic/controllers/app_controller.dart';
import 'package:puppy_diary/logic/helpers/events_filter.dart';
import 'package:puppy_diary/types/entities/event.dart';
import 'package:puppy_diary/ui/views/sheets/confirm_delete.dart';
import 'package:puppy_diary/ui/views/sheets/edit_event_sheet.dart';
import 'package:puppy_diary/ui/views/views.dart';
import 'package:puppy_diary/ui/widgets/buttons/switch_button.dart';
import 'package:puppy_diary/ui/widgets/elements/event_item.dart';
import 'package:puppy_diary/ui/widgets/elements/event_type_picker.dart';

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


  EventsFilter filter = EventsFilter();


  @override
  void initState() {
    events = List.of(widget.events)
      ..sort((x, y) => x.time.compareTo(y.time));

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


  Widget filterBar() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [

      SwitchButton(
          label: 'Not done',
          onChanged: (val) => setState(() => filter.onlyNotDone = val),
          initialValue: filter.onlyNotDone
      ),

      EventTypePicker(
          onChanged: (type) => setState(() => filter.typeFilter = type),
      ),

      SwitchButton(
          label: 'Future',
          onChanged: (val) => setState(() => filter.showFuture = val),
      ),

      SwitchButton(
          label: 'Past',
          onChanged: (val) => setState(() => filter.showPast = val),
      ),
    ],
  );


  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('All Events'),
      ),
      body: events.isEmpty ? emptyView : Column(
        children: [
          filterBar(),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) => filter.idsToShow(events).contains(events[index].id)
                  ? EventItem(
                    events[index],
                    actions: (

                      done: () => _switchDone(index),
                      edit: () => _edit(index),
                      delete: () => _delete(index)

                    )
                  ) : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
}