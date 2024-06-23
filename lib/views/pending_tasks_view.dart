import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/view_models/home_view_model.dart';
import 'package:task_manager/widgets/task_tile.dart';

class PendingTasksView extends StatelessWidget {
  final String projectId;

  PendingTasksView({required this.projectId});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Tasks'),
      ),
      body: ListView.builder(
        itemCount: homeViewModel.projects.firstWhere((project) => project.id == projectId).tasks.length,
        itemBuilder: (context, index) {
          final task = homeViewModel.projects.firstWhere((project) => project.id == projectId).tasks[index];
          if (!task.isCompleted) {
            return TaskTile(task: task);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
