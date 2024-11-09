class ToDoModel
{
  List<dynamic>todos;
  ToDoModel({required this.todos});
  factory ToDoModel.ConverFromJson (Map<String,dynamic>jsonData)
  {
    return ToDoModel(todos: jsonData['todos']);
  }
}