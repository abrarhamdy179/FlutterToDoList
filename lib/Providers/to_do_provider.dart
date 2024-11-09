import 'package:flutter/material.dart';

import '../Models/to_do_model.dart';
import '../Services/to_do_service.dart';

class ToDoProvider extends ChangeNotifier
{
  ToDoModel? toDoModel ;
  Future<void> getToDoService () async
  {
    toDoModel = await ToDoService.getData();
    notifyListeners();
  }

  Future<void> AddTask (String newTask) async
  {
    await ToDoService.addData(NewTask: newTask);
    toDoModel?.todos.add({"todo":newTask});
    notifyListeners();
  }
}