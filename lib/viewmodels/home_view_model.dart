import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../models/task.dart';
import '../service_locator.dart';

class HomeViewModel extends ChangeNotifier {
  FirebaseService _firebaseService = locator<FirebaseService>();
  List<Task> tasks = [];

  HomeViewModel() {
    _firebaseService.getTasks().listen((tasks) {
      this.tasks = tasks;
      notifyListeners();
    });
  }

  void addTask(String title) {
    final newTask = Task(id: '', title: title);
    _firebaseService.addTask(newTask);
  }

  void toggleTaskCompletion(Task task) {
    task.isCompleted = !task.isCompleted;
    _firebaseService.updateTask(task);
  }

  void deleteTask(String id) {
    _firebaseService.deleteTask(id);
  }
}
