import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirebaseService {
  final CollectionReference _tasksCollection = FirebaseFirestore.instance.collection('tasks');

  Stream<List<Task>> getTasks() {
    return _tasksCollection.snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Task.fromSnapshot(doc)).toList()
    );
  }

  Future<void> addTask(Task task) {
    return _tasksCollection.add(task.toMap());
  }

  Future<void> updateTask(Task task) {
    return _tasksCollection.doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String id) {
    return _tasksCollection.doc(id).delete();
  }
}
