import 'package:flutter_app/http.dart';
import 'dart:convert';

Future<Map<String,dynamic>> AutClient({String email,password})async{
 Map<String,dynamic> res= await myHttpPost(route: 'client/login',body: {
  'email': email,
  'password': password,
 });
 return res;
}

Future<Map<String,dynamic>> AutGest({String email,password})async{
 Map<String,dynamic> res= await myHttpPost(route: 'gestionnaire/login',body:{
  'email': email,
  'password': password,
 });
 return res;
}

Future<Map<String,dynamic>> AutGestfavori({String email, String id_plat})async{
 Map<String,dynamic> res= await myHttpPost(route: 'favori/store',body:{
  'email_client': email,
  'id_plat': id_plat,
 });
 return res;
}

Future<Map<String,dynamic>> SignupClient({String email,String password,String phone,String nom,String prenom,String passwordconf})async{
 Map<String,dynamic> res= await myHttpPost(route: 'client/register',body: {
  'email': email,
  'password': password,
  'phone':phone,
  'firstname': prenom,
  'lastname': nom,
  'password_confirmation':passwordconf,
 });
 return res;
}
Future<Map<String,dynamic>> SignupGest({String email,password, phonegest,phoneresto, nom,prenom, passwordconf,adress,nomresto,horaire})async{
 Map<String,dynamic> res= await myHttpPost(route: 'gestionnaire/register',body: {
  'email': email,
  'password': password,
  'gestionnairephone':phonegest,
  'firstname': prenom,
  'lastname': nom,
  'password_confirmation':passwordconf,
  'name': nomresto,
  'workhours':horaire,
  'restaurantphone':phoneresto,
  'adress':adress,
 });
 //   print(res['statusCode']);
 return res;
}

Future<Map<String,dynamic>> Modifierresto({String phone,String horaire,String nomresto,String adresse,int id})async{
 Map<String,dynamic> res= await MHttpPost(route: 'restaurant/update' ,params: id  ,body: {
 // 'email_gestionnaire': email,
  'workhours': horaire,
  'phone':phone,
  'name': nomresto,
  'adress':adresse,
 });
 print(res["statusCode"]);
 return res;
}

Future<Map<String,dynamic>> Modifierplat({String ingrediant,String prix,String nameplat,String id})async{
 Map<String,dynamic> res= await MHttpPost(route: 'plat/update' ,params: id  ,body: {
  // 'email_gestionnaire': email,
  'name': nameplat,
  'ingredients':ingrediant,
  'price': prix,
 });
 print(res["statusCode"]);
 return res;
}

Future<Map<String,dynamic>> Ajouterplat({String ingrediant,String prix,String nameplat,String id,String categorie})async{
 Map<String,dynamic> res= await myHttpPost(route: 'plat/store' ,body: {
  // 'email_gestionnaire': email,
  'name': nameplat,
  'ingredients':ingrediant,
  'price': prix,
  'name_categorie':categorie,
  'id_restaurant':id,

 });
 print(res["statusCode"]);
 return res;
}

Future<Map<String,dynamic>> ApprouverCommande({String id})async{
 Map<String,dynamic> res= await MHttpPost(route: 'commande/accept' ,params: id  ,body: {});
 //print(res["statusCode"]);
 return res;
}

Future<Map<String,dynamic>> RefuserCommande({String id})async{
 Map<String,dynamic> res= await MHttpPost(route: 'commande/refuser' ,params: id  ,body: {});
// print(res["statusCode"]);
 return res;
}