// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simpleapp/constants/colors.dart';

import '../model/todo.dart';
import '../screens/edit_task.dart';

class ToDoItem extends StatefulWidget {
  final ToDo todo;
  final onToDoChanged;
  final onEditItem;

  const ToDoItem(
      {super.key, required this.todo, this.onToDoChanged, this.onEditItem});

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Material(
        elevation: 3.0,
        shadowColor: Colors.black,
        child: ListTile(
          onTap: () {
            widget.onToDoChanged(widget.todo);
            print("Clicked on tile");
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: Icon(
              widget.todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: darkBlue),
          title: Text(
            widget.todo.todoText!,
            style: TextStyle(
              fontSize: 16,
              color: darkBlue,
              decoration: widget.todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                          side: BorderSide(color: darkBlue)))),
              onPressed: () async {
                final updatedTask = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditTaskPage(originalTask: widget.todo.todoText!),
                  ),
                );
                if (updatedTask != null) {
                  print('Updated task: $updatedTask');
                  setState(() {
                    widget.todo.todoText = updatedTask;
                  });
                  
                }
                print("Clicked edit");
              },
              child: Text(
                "Edit",
                style: TextStyle(
                  fontSize: 14,
                  color: darkBlue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
