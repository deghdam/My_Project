import 'package:flutter_app/tools.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';


const String _urlBase="http://192.168.43.171:8000/api";
const String imagesUrl="http://192.168.43.171:8000/storage/images/";
  Map res;
Future<Map<String,dynamic>>  myHttpPost({String route,dynamic body})async{
  String token=await read('token');
   Map<String,dynamic> res={};
      final http.Response response = await http.post(
      _urlBase+'/'+route,
      headers: <String, String>{
        'Authorization':'Bearer $token',
        'Accept': 'application/json',
      },
        encoding: Encoding.getByName("utf-8"),
      body:body,
    );
    res["statusCode"]=response.statusCode;
    res["response"]=response.body;
   // print(res["statusCode"]);
    return res;
  }

Future<Map<String,dynamic>>  MHttpPost({String route,params,dynamic body})async{
  String token=await read('token');
  Map<String,dynamic> res={};
  final http.Response response = await http.post(
    _urlBase+'/'+route+'/${params}',
    headers: <String, String>{
      'Authorization':'Bearer $token',
      'Accept': 'application/json',
      // 'content-type': 'application/x-www-form-urlencoded' ,
    },
      encoding: Encoding.getByName("utf-8"),
    body:body,
  );

  res["statusCode"]=response.statusCode;
  res["response"]=response.body;
  return res;
}

Future<Map<String,dynamic>>  myHttpGET({String route,params})async{
  String token=await read('token');
  Map<String,dynamic> res={};
  final http.Response response = await http.get(
    _urlBase+'/'+route +'/'+params,
    headers: <String, String>{
      'Authorization':'Bearer $token',
      'Accept': 'application/json'
    },
  );
  res["statusCode"]=response.statusCode;
  res["response"]=response.body;
  return res;
}

Future<Map<String,dynamic>>  mHttpGET({String route,params})async{
  String token=await read('token');
  Map<String,dynamic> res={};
  final http.Response response = await http.get(
    _urlBase+'/'+route,  //+'/'+params,
    headers: <String, String>{
      'Authorization':'Bearer $token',
      'Accept': 'application/json'
    },
  );
  res["statusCode"]=response.statusCode;
  res["response"]=response.body;
  return res;
}

Future<Map<String,dynamic>>  HttpGET({String route,int params})async{
  String token=await read('token');
  Map<String,dynamic> res={};
  final http.Response response = await http.get(
    _urlBase+'/'+route +'/'+'$params',
    headers: <String, String>{
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    },
  );
  res["statusCode"]=response.statusCode;
  res["response"]=response.body;
  return res;
}

uploadFile({File file,String type,String id}) async {
  int a=0;
try {
  String token = await read('token');
  var stream = http.ByteStream.fromBytes(file.readAsBytesSync());
  // get file length
  var length = await file.length(); //imageFile is your image file
  Map<String, String> headers = {
    "Accept": "application/json",
    "Authorization": "Bearer " + token
  }; // ignore this headers if there is no authentication

  // string to uri
  var uri = Uri.parse(_urlBase + '/upload');

  // create multipart request
  var request = new http.MultipartRequest("POST", uri);

  // multipart that takes file
  var multipartFileSign = new http.MultipartFile(
      '${type}_${id}', stream, length,
      filename: basename(file.path));

  // add file to multipart
  request.files.add(multipartFileSign);

  //add headers
  request.headers.addAll(headers);

  //adding params
  request.fields['type'] = '$type';
  request.fields['id'] = '$id';

  // send
  var response = await request.send();
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
    print(a);
    a++;
  });
  // listen for response
  if ((response.statusCode) == 200) {
    return true;
  }
  else
    return false;
}
catch (e){
  print(e);
  return false;
}

}