import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Task>> getTasks() async {
    final snapshot = await _db.collection('tasks').get();
    return snapshot.docs.map((doc) => Task.fromMap(doc.data())).toList();
  }

  Future<void> addTask(Task task) async {
    await _db.collection('tasks').add(task.toMap());
  }

  Future<void> deleteTask(String id) async {
    await _db.collection('tasks').doc(id).delete();
  }

  Future<void> updateTask(Task task) async {
    await _db.collection('tasks').doc(task.id).update(task.toMap());
  }

  Future<List<Task>> searchTasks(String query) async {
    final snapshot = await _db
        .collection('tasks')
        .where('title', isGreaterThanOrEqualTo: query)
        .where('title', isLessThan: query + 'z')
        .get();
    
    return snapshot.docs.map((doc) => Task.fromMap(doc.data())).toList();
  }
}
