import 'package:flutter/material.dart';
import '../models/task.dart';
import '../utils/custom_styles.dart';

class TaskForm extends StatefulWidget {
  final Task? task;
  final Function(Task) onSave;

  TaskForm({Key? key, this.task, required this.onSave}) : super(key: key);

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _assignedToController;
  late DateTime _dueDate;
  late String _priority;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _descriptionController = TextEditingController(text: widget.task?.description ?? '');
    _assignedToController = TextEditingController(text: widget.task?.assignedTo ?? '');
    _dueDate = widget.task?.dueDate ?? DateTime.now();
    _priority = widget.task?.priority ?? 'Medium';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _assignedToController,
              decoration: InputDecoration(labelText: 'Assigned To'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the name of the person assigned to this task';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            Row(
              children: <Widget>[
                Text('Due Date:', style: CustomStyles.subtitleStyle),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _dueDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null && pickedDate != _dueDate) {
                      setState(() {
                        _dueDate = pickedDate;
                      });
                    }
                  },
                  child: Text(_dueDate.toLocal().toString().split(' ')[0]),
                ),
              ],
            ),
            SizedBox(height: 12),
            DropdownButtonFormField(
              value: _priority,
              decoration: InputDecoration(labelText: 'Priority'),
              items: ['Low', 'Medium', 'High'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _priority = newValue!;
                });
              },
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSave(Task(
                    id: widget.task?.id ?? UniqueKey().toString(),
                    title: _titleController.text,
                    description: _descriptionController.text,
                    isCompleted: widget.task?.isCompleted ?? false,
                    assignedTo: _assignedToController.text,
                    dueDate: _dueDate,
                    priority: _priority,
                  ));
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save Task', style: CustomStyles.buttonStyle),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _assignedToController.dispose();
    super.dispose();
  }
}
