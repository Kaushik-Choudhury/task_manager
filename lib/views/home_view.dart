import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_view_model.dart';
import '../widgets/task_tile.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Task Manager'),
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, model, child) {
            return ListView.builder(
              itemCount: model.tasks.length,
              itemBuilder: (context, index) {
                final task = model.tasks[index];
                return TaskTile(
                  task: task,
                  onTaskToggle: () => model.toggleTaskCompletion(task),
                  onTaskDelete: () => model.deleteTask(task.id),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddTaskDialog(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'Enter task title'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                Provider.of<HomeViewModel>(context, listen: false).addTask(taskController.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
