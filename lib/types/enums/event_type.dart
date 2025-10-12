import 'package:flutter/material.dart';

enum EventType {
  controlWet, ticksPill, wormPill, vaccination, other;

  static EventType fromString(String val) => EventType.values.firstWhere(
          (el) => el.toString() == val
  );

  IconData get icon => switch (this) {
    EventType.controlWet => Icons.medical_services_outlined,
    EventType.ticksPill => Icons.bug_report_outlined,
    EventType.wormPill => Icons.earbuds,
    EventType.vaccination => Icons.vaccines_outlined,
    EventType.other => Icons.event_outlined,
  };

  String get label => switch (this) {
    EventType.controlWet => 'Wet control',
    EventType.ticksPill => 'Ticks pill',
    EventType.wormPill => 'Worm pill',
    EventType.vaccination => 'Vaccination',
    EventType.other => 'Other',
  };
}