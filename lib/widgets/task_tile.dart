import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function onTaskToggle;
  final Function onTaskDelete;

  const TaskTile({
    required this.task,
    required this.onTaskToggle,
    required this.onTaskDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (value) => onTaskToggle(),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => onTaskDelete(),
      ),
    );
  }
}
