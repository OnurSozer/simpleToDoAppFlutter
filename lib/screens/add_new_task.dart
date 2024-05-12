import 'package:flutter/material.dart';
import 'package:simpleapp/constants/colors.dart';

import '../model/todo.dart';

class AddNewTaskPage extends StatefulWidget {
  @override
  State<AddNewTaskPage> createState() => _AddNewTaskPageState();
}

class _AddNewTaskPageState extends State<AddNewTaskPage> {
  final _todoController = TextEditingController();

  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Text('Add New Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Task Name"),
            SizedBox(height: 10),
            TextField(
              controller: _todoController,
              decoration: InputDecoration(
                hintText: 'Enter your task',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                String newTask = _todoController.text;
                Navigator.pop(context, newTask);
              },
              style: ElevatedButton.styleFrom(
                primary: darkBlue,
                fixedSize: Size(200, 50),
              ),
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
