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

Future<Map<String,dynamic>> SignupClient({String email,String password,String adress,String phone,String nom,String prenom,String passwordconf,String laltitude,String longitude})async{
 Map<String,dynamic> res= await myHttpPost(route: 'client/register',body: {
  'email': email,
  'password': password,
  'phone':phone,
  'firstname': prenom,
  'lastname': nom,
  'password_confirmation':passwordconf,
  'latitude' :laltitude,
  'longitude' :longitude,
  'delivery_adress':adress,


 });
 //print(res["statusCode"]);
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
 //  print(res['statusCode']);
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
 //print(res["statusCode"]);
 return res;
}
Future<Map<String,dynamic>> Deconnexionclient()async{
 Map<String,dynamic> res= await myHttpPost(route: 'client/logout',body: {});
 //print(res["statusCode"]);
 return res;
}

Future<Map<String,dynamic>> Modifierplat({String ingrediant,String prix,String nameplat,String id})async{
 Map<String,dynamic> res= await MHttpPost(route: 'plat/update' ,params: id  ,body: {
  // 'email_gestionnaire': email,
  'name': nameplat,
  'ingredients':ingrediant,
  'price': prix,
 });
 //print(res["statusCode"]);
 return res;
}
Future<Map<String,dynamic>> ModifierCompte({String name,String prenom,String password,String confirmpassword,String phone,String email})async{
 Map<String,dynamic> res= await MHttpPost(route: 'client/update' ,params: email  ,body: {
  // 'email_gestionnaire': email,
  'firstname':prenom,
  'lastname': name,
  'oldpassword':confirmpassword,
  'password':password,
  'phone':phone
 });
 //print(res["statusCode"]);
 return res;
}
Future<Map<String,dynamic>> ModifierCompteGest({String name,String prenom,String password,String confirmpassword,String phone,String email})async{
 Map<String,dynamic> res= await MHttpPost(route: 'gestionnaire/update' ,params: email  ,body: {
  // 'email_gestionnaire': email,
  'firstname':prenom,
  'lastname': name,
  'oldpassword':confirmpassword,
  'password':password,
  'phone':phone
 });
// print(res["statusCode"]);
 return res;
}
Future<Map<String,dynamic>> psotRaitingresto({String id,String email,String rating})async{
 Map<String,dynamic> res= await myHttpPost(route: 'rating_restaurant/store',body: {
  // 'email_gestionnaire': email,
  'email_client':email,
  'id_restaurant': id,
  'rating':rating,
 });
// print(res["statusCode"]);
 return res;
}
Future<Map<String,dynamic>> psotRaitinplat({String id,String email,String rating})async{
 Map<String,dynamic> res= await myHttpPost(route: 'rating_plat/store',body: {
  // 'email_gestionnaire': email,
  'email_client':email,
  'id_plat': id,
  'rating':rating,
 });
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
 //print(res["statusCode"]);
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

Future<Map<String,dynamic>> Commander({String email,String time,String id_plat,String id_restaurant,String adress,String methode,String adresse,String quantite,String latitude,String longitude})async{
 Map<String,dynamic> res= await myHttpPost(route: 'commande/store',body: {
  'email_client': email,
  'date': time,
  'id_restaurant': id_restaurant,
  'plat_id': id_plat,
  'delivery_adress': adresse,
  'payment_method':methode,
  'quantité':quantite,
  'longitude':longitude,
  'latitude':latitude,
  'adress':adress,
 });
 // print(res["statusCode"]);
 return res;
}
Future<Map<String,dynamic>> AnnulerCommander({String id_commande})async{
 Map<String,dynamic> res= await MHttpPost(route: 'commande/annuler',params: id_commande,body: {});
 //print( res["statusCode"]);
 return res;
}