// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simpleapp/constants/colors.dart';

import '../model/todo.dart';
import '../widgets/todo_item.dart';
import 'add_new_task.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();


  void _addToDoItem(String todo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().microsecondsSinceEpoch.toString(), todoText: todo));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Container(
                    color: Colors.lightGreen,
                    height: 130,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Image.asset(
                          'assets/images/cup.png',
                          width: 100,
                          height: 70,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 45),
                            Text("Go Pro (No Ads)",
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 139, 0.747),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text("No fuss, no ads, for only \$1 a month",
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 139, 0.747),
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal))
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              alignment: Alignment.topLeft,
                              color: Color.fromRGBO(0, 0, 139, 0.747),
                              height: 70,
                              width: 60,
                              child: Center(
                                child: Text(
                                  "\$1",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 235, 208, 57),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        child: Text(""),
                      ),
                      for (ToDo todoo in todosList)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onEditItem: () {},
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              child: FloatingActionButton(
                onPressed: () async {
                  final newTask = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddNewTaskPage()),
                  );
                  if (newTask != null) {
                    setState(() {
                      _addToDoItem(newTask);
                    });
                  }
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleEditItem(ToDo todo) {
    setState(() {});
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: darkBlue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 20),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/images/avatar.jpeg')),
          ),
          SizedBox(width: 30),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Hello, ONUR",
                style: TextStyle(color: Colors.white, fontSize: 13)),
            Text("onursozerr@gmail.com",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ]),
        ],
      ),
    );
  }
}
