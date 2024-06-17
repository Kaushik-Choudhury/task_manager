import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';

class HomeViewModel extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Task> _tasks = [];
  int _selectedIndex = 0;

  List<Task> get tasks => _tasks;
  int get selectedIndex => _selectedIndex;

  HomeViewModel() {
    _loadTasks();
  }

  void _loadTasks() async {
    final snapshot = await _db.collection('tasks').get();
    _tasks = snapshot.docs.map((doc) => Task.fromMap(doc.data())).toList();
    notifyListeners();
  }

  void addTask(Task task) async {
    await _db.collection('tasks').add(task.toMap());
    _loadTasks();
  }

  void deleteTask(String id) async {
    await _db.collection('tasks').doc(id).delete();
    _loadTasks();
  }

  void toggleTaskCompletion(Task task) async {
    task.isCompleted = !task.isCompleted;
    await _db.collection('tasks').doc(task.id).update(task.toMap());
    _loadTasks();
  }

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
