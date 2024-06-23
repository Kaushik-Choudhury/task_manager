import 'package:flutter/material.dart';
import 'package:task_manager/models/project.dart';
import 'tasks_view.dart';
import 'team_members_view.dart';
import 'resources_view.dart';
import 'conditions_view.dart';
import 'pending_tasks_view.dart';
import 'activity_view.dart';

class ProjectView extends StatelessWidget {
  final Project project;

  ProjectView({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Tasks with Employee Assigned'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TasksView(projectId: project.id),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Team Members Info'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeamMembersView(projectId: project.id),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Resources'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResourcesView(projectId: project.id),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Conditions & Requirements'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConditionsView(projectId: project.id),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Pending Tasks'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PendingTasksView(projectId: project.id),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Activity'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActivityView(projectId: project.id),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
