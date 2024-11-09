import 'package:dio/dio.dart';
import 'package:to_do_list/Models/to_do_model.dart';

class ToDoService
{
  static Dio dio = Dio();

  static Map PostData = {
    "todo" : '',
    "completed": true ,
    "userId" : 13
};

  static Future<ToDoModel> getData () async
  {
    try
        {
          Response response = await dio.get("https://dummyjson.com/todos/user/13");
          if(response.statusCode==200)
          {
            return ToDoModel.ConverFromJson(response.data);
          }
          else
          {
            throw Exception("Code Not 200");
          }
        }
        catch(e)
    {
      throw Exception(e);
    }
  }

  static Future<void> addData ({required String NewTask}) async
  {
    PostData['todo']=NewTask;
    Response response = await dio.post(
        "https://jsonplaceholder.typicode.com/posts",
        data: PostData
    );
  }
}