import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/to_do_provider.dart';
import '../Widgets/add_task_widget.dart';
import '../Widgets/to_do_widget.dart';
class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("To Do List")),),
      body: Consumer<ToDoProvider>(builder: (context, value, child)
      {
        var obj = value.toDoModel;
        if(obj==null)
          {
            value.getToDoService();
            return Center(child: CircularProgressIndicator());
          }
        else
          {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ToDoWidget(
                  todo: obj.todos[index]['todo'] ?? '',
                );
              },
              itemCount: obj.todos.length,
            );
          }
      },),
      persistentFooterButtons: [
        FloatingActionButton(
            onPressed: (){
              showModalBottomSheet(
                  context: context,
                  builder: (context) => AddTaskWidget()
              );
            },
          child: Icon(Icons.add_box_outlined,size: 30,color: Colors.cyanAccent,),
        ),
      ],
    );
  }
}
