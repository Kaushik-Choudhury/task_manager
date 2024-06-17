import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function onTaskToggle;
  final Function onTaskDelete;
  final Function onTaskEdit;

  TaskTile({
    required this.task,
    required this.onTaskToggle,
    required this.onTaskDelete,
    required this.onTaskEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title, style: TextStyle(fontSize: 18, color: Colors.white)),
      subtitle: Text(
        task.description,
        style: TextStyle(color: Colors.grey),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue),
            onPressed: () => onTaskEdit(),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => onTaskDelete(),
          ),
          Checkbox(
            value: task.isCompleted,
            onChanged: (bool? value) {
              onTaskToggle();
            },
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
