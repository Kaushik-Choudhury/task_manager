import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/home_view_model.dart';
import '../widgets/task_tile.dart';

class TasksView extends StatelessWidget {
  final String projectId;

  const TasksView({Key? key, required this.projectId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: ListView.builder(
        itemCount: homeViewModel.projects
            .firstWhere((project) => project.id == projectId)
            .tasks
            .length,
        itemBuilder: (context, index) {
          final project = homeViewModel.projects
              .firstWhere((project) => project.id == projectId);
          final task = project.tasks[index];
          return TaskTile(
            task: task,
            onTaskToggle: (task) {
              homeViewModel.toggleTaskCompletion(projectId, task.id);
            },
            onTaskDelete: (task) {
              homeViewModel.deleteTask(projectId, task.id);
            },
            onTaskEdit: (task) {
              homeViewModel.editTask(projectId, task);
            },
          );
        },
      ),
    );
  }
}
