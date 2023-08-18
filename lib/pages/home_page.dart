import 'package:flutter/material.dart';
import 'package:todo_tutorial/constants/custom_colors.dart';
import 'package:todo_tutorial/widgets/todo_item.dart';

import '../models/todo.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _searchToDo = [];

  @override
  void initState() {
    _searchToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _customAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                _searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50, 
                          bottom: 20),
                        child: Text(
                          'All To-Do Events', 
                          style: TextStyle(
                            fontSize: 25, 
                            fontWeight: FontWeight.w500)),
                      ),

                      for (ToDo todoo in _searchToDo.reversed)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _changeToDo,
                          onDeleteItem: _deleteToDoItem,  
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      boxShadow: [BoxShadow(
                        color: greyColor, 
                        blurRadius: 10, 
                        spreadRadius: 0
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add a goal',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pinkColor,
                      minimumSize: Size(60, 60),
                      elevation: 10 
                    ),
                    child: Text('+', style: TextStyle(fontSize: 40),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _changeToDo(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
      id: DateTime.now().millisecondsSinceEpoch.toString(), 
      todoText: toDo)
      );
    });
    _todoController.clear();    
  }

  void _runFilter(String enterKeyword) {
    List<ToDo> results = [];
    if (enterKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
      .where((item) => item.todoText!
      .toLowerCase()
      .contains(enterKeyword
      .toLowerCase()))
      .toList();
    }
    setState(() {
      _searchToDo = results;
    });
  }

  Container _searchBox() {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20)
            ),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search, 
                  color: blackColor, 
                  size: 20,
                ),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 20, 
                  minWidth: 25
                ),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(color: greyColor)
              ),
            ),
          );
  }

  AppBar _customAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // to set the duck to the end of the app bar
        children: [
          Icon(Icons.menu, color: blackColor),
          Container(
            height: 40, // duck.png height 
            width: 40,  // duck.png widht
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/duck.png'),
            ),
          ),
        ],
      ),
    );
  }
}