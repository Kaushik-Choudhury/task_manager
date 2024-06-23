import 'package:flutter/material.dart';

class ActivityView extends StatelessWidget {
  final String projectId;

  ActivityView({required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity'),
      ),
      body: ListView(
        children: [
          // List of activities
        ],
      ),
    );
  }
}
