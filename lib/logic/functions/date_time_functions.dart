import 'package:intl/intl.dart';

String userFormat(DateTime time) => DateFormat.yMMMd().format(time);

DateTime today() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

DateTime tomorrow() => today().add(const Duration(days: 1));