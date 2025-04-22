import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  Map<DateTime, String> events = {};

  void addEvent(DateTime date, String title) {
    events[date] = title;
    notifyListeners();
  }

  void deleteEvent(DateTime date) {
    events.remove(date);
    notifyListeners();
  }
}
