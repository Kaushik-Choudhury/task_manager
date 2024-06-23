import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function(Task) onTaskToggle;
  final Function(Task) onTaskDelete;
  final Function(Task) onTaskEdit;

  TaskTile({
    Key? key,
    required this.task,
    required this.onTaskToggle,
    required this.onTaskDelete,
    required this.onTaskEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text('Assigned to: ${task.assignedTo}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
            value: task.isCompleted,
            onChanged: (value) {
              onTaskToggle(task);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              onTaskEdit(task);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              onTaskDelete(task);
            },
          ),
        ],
      ),
    );
  }
}
