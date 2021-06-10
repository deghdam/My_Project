import 'dart:convert';
import 'package:flutter_app/model/restaurent_model.dart';
import 'package:http/http.dart' as http;


const String _urlBase="http://192.168.43.171:8000/api";
const String imagesUrl="http://192.168.43.171:8000/storage/images/";
  Map res;
Future<Map<String,dynamic>>  myHttpPost({String route,dynamic body})async{
   Map<String,dynamic> res={};
      final http.Response response = await http.post(
      _urlBase+'/'+route,
      headers: <String, String>{
        'Accept': 'application/json',
       // 'content-type': 'application/x-www-form-urlencoded' ,
      },

      body:body,
    );

    res["statusCode"]=response.statusCode;
    res["response"]=response.body;
    return res;
  }

Future<Map<String,dynamic>>  MHttpPost({String route,params,dynamic body})async{
  Map<String,dynamic> res={};
  final http.Response response = await http.post(
    _urlBase+'/'+route+'/'+ params,
    headers: <String, String>{
      'Accept': 'application/json',
      // 'content-type': 'application/x-www-form-urlencoded' ,
    },

    body:body,
  );

  res["statusCode"]=response.statusCode;
  res["response"]=response.body;
  return res;
}

Future<Map<String,dynamic>>  myHttpGET({String route,params})async{
  Map<String,dynamic> res={};
  final http.Response response = await http.get(
    _urlBase+'/'+route +'/'+params,
    headers: <String, String>{
      'Accept': 'application/json'
    },
  );
  res["statusCode"]=response.statusCode;
  res["response"]=response.body;
  return res;
}

Future<Map<String,dynamic>>  mHttpGET({String route,params})async{
  Map<String,dynamic> res={};
  final http.Response response = await http.get(
    _urlBase+'/'+route,  //+'/'+params,
    headers: <String, String>{
      'Accept': 'application/json'
    },
  );
  res["statusCode"]=response.statusCode;
  res["response"]=response.body;
  return res;
}

Future<Map<String,dynamic>>  HttpGET({String route,int params})async{
  Map<String,dynamic> res={};
  final http.Response response = await http.get(
    _urlBase+'/'+route +'/'+'$params',
    headers: <String, String>{
      'Accept': 'application/json'
    },
  );
  res["statusCode"]=response.statusCode;
  res["response"]=response.body;
  return res;
}