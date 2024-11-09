import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Providers/to_do_provider.dart';
class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var poviderobj = Provider.of<ToDoProvider>(context,listen: false);
    TextEditingController taskTxt = TextEditingController();
    return Scaffold(
      body: Container(
        //width: MediaQuery.of(context).size.width*0.70,
        height:MediaQuery.of(context).size.height*0.65 ,
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text("Add Task"),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: taskTxt,
                decoration: InputDecoration(fillColor: Colors.cyanAccent,filled: true ),
              ),
            ),
            OutlinedButton(child: Text("Save"),
              onPressed: (){
              if(taskTxt.text.trim() != '')
                {
                  poviderobj.AddTask(taskTxt.text);
                }
              Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
