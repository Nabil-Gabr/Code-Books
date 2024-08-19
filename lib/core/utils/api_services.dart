import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio);

  final _baseUrl='https://www.googleapis.com/books/v1/';
  
  Future<Map<String,dynamic>>get({required String endPoint})async{
    
    var response= await dio.get('$_baseUrl$endPoint');
    return response.data;
    
  }
}

//done