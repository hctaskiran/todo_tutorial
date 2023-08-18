import 'package:flutter/material.dart';
import 'package:todo_tutorial/constants/custom_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: blackColor),
            Container(
              height: 40, 
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/duck.png'),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}