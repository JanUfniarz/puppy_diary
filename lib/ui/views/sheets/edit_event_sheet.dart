import 'package:flutter/material.dart';
import 'package:puppy_diary/types/entities/event.dart';
import 'package:puppy_diary/types/enums/event_type.dart';
import 'package:puppy_diary/ui/helpers/form.dart';
import 'package:puppy_diary/ui/helpers/value_wrapper.dart';
import 'package:puppy_diary/ui/views/sheets/bottom_sheet.dart';
import 'package:puppy_diary/ui/widgets/buttons/save_button.dart';
import 'package:puppy_diary/ui/widgets/elements/big_text_field.dart';
import 'package:puppy_diary/ui/widgets/elements/date_picker.dart';
import 'package:puppy_diary/ui/widgets/elements/event_type_picker.dart';

Future<Event?> editEventSheet(
  BuildContext context,
  Event event,
) =>
    bottomSheet<Event>(
        context,
        _EditEventSheetContent(
          event: event,
          onSave: (event) => Navigator.pop(context, event),
        )
    );



class _EditEventSheetContent extends StatefulWidget {
  final Event event;
  final void Function(Event) onSave;

  const _EditEventSheetContent({required this.event, required this.onSave});

  @override
  State<_EditEventSheetContent> createState() => _EditEventSheetContentState();
}



class _EditEventSheetContentState extends State<_EditEventSheetContent>
    with FormElements, SingleTickerProviderStateMixin {
  late final TabController _tabController;


  late ValueWrapper<DateTime> newTime = ValueWrapper(widget.event.time);
  late EventType newType = widget.event.type;
  late String newNote = widget.event.note;

  Event get newEvent => Event.from(widget.event)
    ..time = newTime.value
    ..type = newType
    ..note = newNote;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Data'),
            Tab(text: 'Note'),
          ],
        ),

        SizedBox(
          height: 180,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildDataTab(),
              _buildNoteTab(),
            ],
          ),
        ),

        SaveButton(
            onPressed: () => widget.onSave(newEvent),
        ),
      ],
    );


  Widget _buildDataTab() => elementsArrangement(inputList(context, [
    (
      label: 'New Event Type',
      child: EventTypePicker(
          value: newType,
          onChanged: (type) => setState(() => newType = type ?? EventType.other)
      ),
    ),
    (
      label: 'New Date',
      child: DatePicker(newTime),
    )
  ]));


  Widget _buildNoteTab() => elementsArrangement([
      BigTextField(
        initialValue: widget.event.note,
        onChanged: (value) => widget.event.note = value,
        label: 'Note',
      ),
    ]);
}