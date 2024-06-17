import 'package:flutter/material.dart';
import '../models/task.dart';
import '../utils/custom_styles.dart';

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
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(task.title, style: CustomStyles.titleStyle),
        subtitle: Text(
          task.description,
          style: CustomStyles.subtitleStyle,
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
      ),
    );
  }
}
