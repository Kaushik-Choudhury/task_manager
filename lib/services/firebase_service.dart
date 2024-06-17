import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirebaseService {
  final CollectionReference _tasksCollection = FirebaseFirestore.instance.collection('tasks');

  Stream<List<Task>> getTasks() {
    return _tasksCollection.snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Task.fromSnapshot(doc)).toList()
    );
  }

  Stream<List<Task>> getTasksByUser(String userId) {
    return _tasksCollection.where('assignedTo', isEqualTo: userId).snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Task.fromSnapshot(doc)).toList()
    );
  }

  Stream<List<Task>> getTasksByCategory(String category) {
    return _tasksCollection.where('category', isEqualTo: category).snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Task.fromSnapshot(doc)).toList()
    );
  }

  Future<void> addTask(Task task) async {
    try {
      await _tasksCollection.add(task.toMap());
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _tasksCollection.doc(task.id).update(task.toMap());
    } catch (e) {
      print('Error updating task: $e');
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await _tasksCollection.doc(id).delete();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }
}
