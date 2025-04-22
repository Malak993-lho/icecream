import 'package:flutter/material.dart';
import 'package:senior_project/core/widgets/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = []; // List to store tasks

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners(); // Notify UI to update
  }
}
