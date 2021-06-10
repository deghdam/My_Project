import 'package:flutter_app/http.dart';
import 'dart:convert';

import 'package:flutter_app/model/categorie_model.dart';

Future<List<Categorie>> FetchPlat({String categorie}) async {
  List<Categorie> list = [];
  Map<String, dynamic> _res = await myHttpGET(route: 'plat', params: categorie);

  if (_res['statusCode'] == 200) {
    //print(_res['response']);
    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Categorie(
        imageUrl: e["picture"]??'',
        name: e["name"]??'',
        prix: e["price"]??'',
        nresto: e["restaurant_name"]??'',
        raiting: e["AVG(rating)"]??'',
        ingredien: e["ingredients"]??'',
        id: e["id"].toString()??''
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


  if (_res['statusCode'] == 200) {
    // print(_res['response']);
    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Categorie(
        imageUrl: e["picture"]??'',
        name: e["name"]??'',
        prix: e["price"]??'',
        nresto: e["restaurant_name"]??'',
        raiting: e["AVG(rating)"]??'',
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


  if (_res['statusCode'] == 200) {
    // print(_res['response']);
    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Categorie(
        imageUrl: e["picture"]??'',
        name: e["name"]??'',
        prix: e["price"]??'',
        nresto: e["restaurant_name"]??'',
        raiting: e["AVG(rating)"]??'',
        ingredien: e["ingredients"]??'',
        id: e["id"].toString(),
      ));
    }
    ;
  };
  return list;
}

Future<List<Categorie>> FetchPlatFavoris({String email}) async {
  List<Categorie> list = [];
  Map<String, dynamic> _res = await myHttpGET(route: 'favori', params: email);

  if (_res['statusCode'] == 200) {
    //print(_res['response']);
    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Categorie(
        imageUrl: e["picture"]??'',
        name: e["name_plat"]??'',
        prix: e["price"]??'',
        nresto: e["name_restaurant"]??'',
        raiting: e["AVG(rating)"]??'',
        ingredien: e["ingredients"]??'',
      ));
    }
    ;
  };
  return list;
}
