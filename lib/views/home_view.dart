import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/home_view_model.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/task_tile.dart';
import '../widgets/task_form.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authViewModel.signOut();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: homeViewModel.tasks.length,
        itemBuilder: (context, index) {
          final task = homeViewModel.tasks[index];
          return TaskTile(
            task: task,
            onTaskToggle: () {
              homeViewModel.toggleTaskCompletion(task);
            },
            onTaskDelete: () {
              homeViewModel.deleteTask(task.id);
            },
            onTaskEdit: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return TaskForm(
                    task: task,
                    onSave: (updatedTask) {
                      homeViewModel.addTask(updatedTask);
                    },
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return TaskForm(
                onSave: (newTask) {
                  homeViewModel.addTask(newTask);
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
