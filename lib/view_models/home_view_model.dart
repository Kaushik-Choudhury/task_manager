import 'package:flutter/material.dart';
import '../models/project.dart';
import '../models/task.dart';

class HomeViewModel extends ChangeNotifier {
  List<Project> projects = [];

  // Method to toggle task completion
  void toggleTaskCompletion(String projectId, String taskId) {
    final project = projects.firstWhere((project) => project.id == projectId);
    final task = project.tasks.firstWhere((task) => task.id == taskId);
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  // Method to delete a task
  void deleteTask(String projectId, String taskId) {
    final project = projects.firstWhere((project) => project.id == projectId);
    project.tasks.removeWhere((task) => task.id == taskId);
    notifyListeners();
  }

  // Method to edit a task
  void editTask(String projectId, Task updatedTask) {
    final project = projects.firstWhere((project) => project.id == projectId);
    final taskIndex = project.tasks.indexWhere((task) => task.id == updatedTask.id);
    if (taskIndex != -1) {
      project.tasks[taskIndex] = updatedTask;
      notifyListeners();
    }
  }
}
