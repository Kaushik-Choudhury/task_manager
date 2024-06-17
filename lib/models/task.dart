import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String title;
  String description;
  String category;
  String assignedTo;
  bool isCompleted;
  DateTime dueDate;
  String priority;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    this.category = 'General',
    this.assignedTo = '',
    this.isCompleted = false,
    required this.dueDate,
    this.priority = 'Medium',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'assignedTo': assignedTo,
      'isCompleted': isCompleted,
      'dueDate': dueDate.toIso8601String(),
      'priority': priority,
    };
  }

  static Task fromMap(Map<String, dynamic> map, String id) {
    return Task(
      id: id,
      title: map['title'],
      description: map['description'],
      category: map['category'],
      assignedTo: map['assignedTo'],
      isCompleted: map['isCompleted'],
      dueDate: DateTime.parse(map['dueDate']),
      priority: map['priority'],
    );
  }

  static Task fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Task.fromMap(data, snapshot.id);
  }
}
