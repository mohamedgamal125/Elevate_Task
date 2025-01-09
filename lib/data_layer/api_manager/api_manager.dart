
import 'package:dio/dio.dart';
import 'package:elevate_task/utils/app_const/app_strings.dart';

class ApiManager{

  late Dio dio;

  ApiManager(){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true
    );
    dio=Dio(options);
  }

  Future<List<dynamic>> getAllProducts()async{

    try{
      Response response = await dio.get("products");
      print(response.data);
      return response.data??[];
    }catch(e)
    {
      print(e.toString());
      return [];
    }
  }
}