enum EventType {
  controlWet, ticksPill, wormPill, vaccination;

  static EventType fromString(String val) => EventType.values.firstWhere(
          (el) => el.toString() == "EventType.$val"
  );
}