import 'package:flutter/material.dart';
import 'package:simpleapp/constants/colors.dart';

class EditTaskPage extends StatefulWidget {
  final String originalTask;

  EditTaskPage({required this.originalTask});

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.originalTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Text('Edit Task'),
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
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter your task',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                String updatedTask = _controller.text;
                Navigator.pop(context, updatedTask);
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
