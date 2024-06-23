import 'package:flutter/material.dart';

class ResourcesView extends StatelessWidget {
  final String projectId;

  ResourcesView({required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
      ),
      body: ListView(
        children: [
          // List of resources
        ],
      ),
    );
  }
}
