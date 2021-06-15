import 'package:flutter_app/http.dart';
import 'dart:convert';

import 'package:flutter_app/model/categorie_model.dart';
import 'package:flutter_app/model/personne.dart';

Future<List<Categorie>> FetchPlat({String categorie}) async {
  List<Categorie> list = [];
  Map<String, dynamic> _res = await myHttpGET(route: 'plat', params: categorie);
  if (_res['statusCode'] == 200) {

    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {

    list.add(Categorie(
        imageUrl: e["picture"]??'',
        name: e["name"]??'',
        prix: e["price"].toString()??'',
        nresto: e["restaurant_name"]??'',
        id_resto: e["id_restaurant"].toString()??'',
        raiting: e["AVG(rating)"].toString()??'',
        ingredien: e["ingredients"]??'',
        id: e["id"].toString()??'',
        quantite: '0'

    ));




    }
    ;
  };
  return list;
  // Categorie(
  //   imageUrl: 'assets/categorie/pizza.jpg',
  //   name: 'Pizza Végitarienne',
  //   prix: '350 DA',
  //   nresto: 'Idel' ,
  //   raiting:  '⭐⭐⭐⭐',
  //   ingredien: '1 pâte à pizza prête à dérouler , 150 g de dés (ou de lamelles) de jambon',
  //
  // ),
}

Future<List<Categorie>> FetchPlatGest ({int id}) async {
  List<Categorie> list = [];
  Map<String, dynamic> _res = await HttpGET(route: 'plat/restaurant', params: id);
// print('/////');
//   print(_res['statusCode']);

  if (_res['statusCode'] == 200) {
    // print(_res['response']);
    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Categorie(
        imageUrl: e["picture"]??'',
        name: e["name"]??'',
        prix: e["price"].toString()??'',
        nresto: e["restaurant_name"]??'',
        raiting: e["AVG(rating)"].toString()??'',
        ingredien: e["ingredients"]??'',
        id: e["id"].toString(),
      ));
    }
    ;
  };
  return list;
}
Future<List<Categorie>> FetchPlatResto ({int id}) async {
  List<Categorie> list = [];
  Map<String, dynamic> _res = await HttpGET(route: 'plat/restaurant', params: id);

// print(_res['statusCode']);
  if (_res['statusCode'] == 200) {
    // print(_res['response']);
    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Categorie(
        imageUrl: e["picture"]??'',
        name: e["name"]??'',
        prix: e["price"].toString()??'',
        nresto: e["restaurant_name"]??'',
        raiting: e["AVG(rating)"].toString()??'',
        ingredien: e["ingredients"]??'',
        id: e["id"].toString(),
      ));
    }
    ;
  };
  return list;
}
Future<List<Categorie>> Fetchcategorie () async {
  List<Categorie> list = [];
  Map<String, dynamic> _res = await mHttpGET(route: 'categories');

 //print(_res['statusCode']);
  if (_res['statusCode'] == 200) {
    // print(_res['response']);
    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Categorie(
        imageUrl: e["picture"]??'',
        name: e["name"]??'',
      ));
    };
  };
  return list;
}

Future<List<Categorie>> FetchPlatFavoris({String email}) async {
  List<Categorie> list = [];
  Map<String, dynamic> _res = await myHttpGET(route: 'favori', params: email);

  if (_res['statusCode'] == 200) {
    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Categorie(
        imageUrl: e["picture"]??'',
        name: e["name_plat"]??'',
        prix: e["price"].toString()??'',
        nresto: e["name_restaurant"]??'',
        raiting: e["AVG(rating)"].toString()??'',
        ingredien: e["ingredients"]??'',
      ));
    }
    ;
  };
  return list;
}
Future<List<Personne>> Fetchinfoclient({String email}) async {
  List<Personne> list = [];
  Map<String, dynamic> _res = await myHttpGET(route: 'client', params: email);
  //print('//////');
 // print(_res['statusCode']);
  if (_res['statusCode'] == 200) {
   // print(_res['response']);
    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Personne(
        nom: e["lastname"]??'',
        prenom: e["firstname"]??'',
        phone: e["phone"].toString()??'',
        email: e["email"]??'',
      ));
    }
    ;
  };
  return list;
}

Future<List<Personne>> FetchinfoGest({String email}) async {
  List<Personne> list = [];
  Map<String, dynamic> _res = await myHttpGET(route: 'gestionnaire', params: email);
  //print('//////');
  // print(_res['statusCode']);
  if (_res['statusCode'] == 200) {
    // print(_res['response']);
    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Personne(
        nom: e["lastname"]??'',
        prenom: e["firstname"]??'',
        phone: e["phone"].toString()??'',
        email: e["email"]??'',
      ));
    }
    ;
  };
  return list;
}
