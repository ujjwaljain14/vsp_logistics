import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices{

  @override
  Future getApi(String url, Map<String, String> header,) async{
    dynamic responseJson;
    try{
      final response = await http.get(
          Uri.parse(url),
          headers: header,
      ).timeout(const Duration(seconds: 8));
      responseJson = returnResponse(response);
    }on SocketException catch(e){
      print('------------------');
      print(url);
      print(e.message);
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }on NoSuchMethodError{
      throw BackendException('');
    }on TimeoutException{
      throw RequestTimeOut('');
    }catch (e){
      throw BackendException(e.toString());
    }
    return responseJson;
  }

  @override
  Future postApi(String url, Map<String,String> header, Map body) async{
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body:body,
      );
          // .timeout(const Duration(seconds: 6));
      print('Status Code------------------> ${response.statusCode}');
      responseJson = returnResponse(response);
      return responseJson;
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut('');
    }
    catch(e){
      rethrow;
    }
  }

  @override
  Future deleteApi(String url, Map<String,String> header, Map body) async{
    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: header,
        body:body,
      );
          // .timeout(const Duration(seconds: 5));
      responseJson = returnResponse(response);
      return responseJson;
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut('');
    }
    catch(e){
      rethrow;
    }
  }

  @override
  Future putApi(String url, Map<String,String> header, Map body) async{
    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: header,
        body: body,
      );
          // .timeout(const Duration(seconds: 5));
      responseJson = returnResponse(response);
      return responseJson;
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut('');
    }
    catch(e){
      rethrow;
    }
  }

  dynamic returnResponse(http.Response response){
    dynamic responseJson = jsonDecode(response.body);
    print(response.body);
    print(response.statusCode);
    switch(response.statusCode){
      case 200:
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString(), responseJson['message']);
      case 401:
        throw UnauthorizedRequestException(response.statusCode.toString(), responseJson['message']);
      case 403:
        throw UnauthorizedRequestException(response.statusCode.toString(), responseJson['message']);
      case 404:
        throw NotFoundException(response.statusCode.toString(), responseJson['message']);
      case 405:
        throw MethodNotAllowedException(response.statusCode.toString(), responseJson['message']);
      case 422:
        throw UnProcessableException(response.statusCode.toString(), responseJson['message']);
      case 429:
        throw TooManyRequestsException(response.statusCode.toString(), responseJson['message']);
      case 500:
        throw  InternalServerException(response.statusCode.toString(), responseJson['message']);
      case 502:
        throw BadGatewayException(response.statusCode.toString(), responseJson['message']);
      case 503:
        throw ServiceUnavailableException(response.statusCode.toString(), responseJson['message']);
      case 504:
        throw GatewayTimeoutException(response.statusCode.toString(), responseJson['message']);
      default:
        throw FetchDataException(response.statusCode.toString(), responseJson['message']);
    }
  }


}