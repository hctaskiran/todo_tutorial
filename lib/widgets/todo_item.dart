import 'package:flutter/material.dart';
import 'package:todo_tutorial/constants/custom_colors.dart';

import '../models/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.todo, required this.onToDoChanged, required this.onDeleteItem});

  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap:() {
          onToDoChanged(todo);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        tileColor: whiteColor,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank, 
          color: cyanColor
        ),
        title: Text(
          todo.todoText!, 
          style: TextStyle(
            fontSize: 16, 
            color: blackColor,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: redColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              onDeleteItem(todo.id);
            }, 
            icon: Icon(Icons.delete_forever),
            iconSize: 20,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}