import 'package:flutter/material.dart';

class TeamMembersView extends StatelessWidget {
  final String projectId;

  TeamMembersView({required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Members'),
      ),
      body: ListView(
        children: [
          // List of team members
        ],
      ),
    );
  }
}
