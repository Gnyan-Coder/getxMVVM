import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:getxmvvm/data/app_exception.dart';
import 'package:getxmvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
class NetworkApiServices extends BaseApiServices{


  @override
  Future getApi(String url) async{
    if(kDebugMode){
      print("Url: $url");
    }
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson=returnResponse(response);
    }on SocketException{
      throw InternetException();
    }on RequestTimeOut{
      throw RequestTimeOut();
    }
    return responseJson;

  }

  @override
  Future postApi(var data,String url) async{
    if(kDebugMode){
      print("Url: $url");
      print("Data: $data");
    }
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),body: jsonEncode(data)).timeout(const Duration(seconds: 10));
      responseJson=returnResponse(response);
    }on SocketException{
      throw InternetException();
    }on RequestTimeOut{
      throw RequestTimeOut();
    }
    if(kDebugMode){
      print('response data : $responseJson');
    }
    return responseJson;

  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException();
      default:
        throw FetchDataException();
    }
  }



}