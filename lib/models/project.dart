import 'task.dart';

class Project {
  String id;
  String name;
  List<Task> tasks;

  Project({
    required this.id,
    required this.name,
    required this.tasks,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tasks': tasks.map((task) => task.toMap()).toList(),
    };
  }

  static Project fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'],
      name: map['name'],
      tasks: List<Task>.from(map['tasks']?.map((task) => Task.fromMap(task)) ?? []),
    );
  }
}
