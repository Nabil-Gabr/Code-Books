import 'package:dio/dio.dart'; 
 
abstract class Failure { 
  final String errMessag; 
 
  Failure(this.errMessag); 
} 
 
class ServerFailuer extends Failure { 
  ServerFailuer(super.errMessag); 
 
factory  ServerFailuer.fromDioExeption(DioException dioExeption) { 
     
    switch (dioExeption.type) { 
      //الايرور بيرجع على هيئة Enum //=> تتعامل معاها بسهولة باستخدم سويتش 
 
      case DioExceptionType.connectionTimeout: 
        return ServerFailuer("connection Timeout with Api Sever"); 
 
      case DioExceptionType.sendTimeout: 
      return ServerFailuer("send Timeout with Api Server"); 
      case DioExceptionType.receiveTimeout: 
      return ServerFailuer("receive Timeout with Api Server"); 
      case DioExceptionType.badCertificate: 
      return ServerFailuer("Connection Error: Untrusted server certificate. Please try again later."); 
      case DioExceptionType.badResponse: 
      return ServerFailuer.fromResponse(dioExeption.response!.statusCode!,dioExeption.response!.data); 
      case DioExceptionType.cancel: 
      return ServerFailuer("Oops The Request was canceld,try again"); 
      case DioExceptionType.connectionError: 
      //هنا لو مكنش مفيش اتصال بالنت ==> error of type SocketExeption 
       return ServerFailuer("conect to the internet and try again"); 
 
      case DioExceptionType.unknown: 
        return ServerFailuer("Ooops UnExepected Error"); 
        default: 
        return ServerFailuer("Ooops UnExepected Error"); 
 
//كدا انت بتنهدل كل حاجة 
      //هنا لو الايرور مش معروف 
 
           
    } 
  } 
  factory ServerFailuer.fromResponse( int statusCode , dynamic response){ 
    if(statusCode== 400 || statusCode== 400  ){ 
      return ServerFailuer(response["error"]["message"]); 
    }else if(statusCode == 500 ){ 
      return ServerFailuer("There Was an Error In the Server,please try again"); 
    }else if(statusCode == 404 ){ 
      return ServerFailuer("Method not Found,Try again"); 
    } 
    else{ 
       return ServerFailuer("Ooops UnExepected Error"); 
    } 
  } 
}