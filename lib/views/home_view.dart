import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/view_models/home_view_model.dart';
import 'project_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: ListView.builder(
        itemCount: homeViewModel.projects.length,
        itemBuilder: (context, index) {
          final project = homeViewModel.projects[index];
          return ListTile(
            title: Text(project.name),
            subtitle: Text(project.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectView(project: project),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open a dialog to add a new project
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
