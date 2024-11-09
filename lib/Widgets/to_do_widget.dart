import 'package:flutter/material.dart';

class ToDoWidget extends StatelessWidget {
  String todo ;
  ToDoWidget({super.key,required this.todo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            todo.isNotEmpty?Text(todo):Text("Task Not Found"),
          ],
        ),
      ),
    );
  }
}
