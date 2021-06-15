import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/commande.dart';
import 'package:flutter_app/model/restaurent_model.dart';

Future<List<Restaurent>> FetchResto({int id}) async {
  List<Restaurent> list = [];
  Map<String, dynamic> _res = await mHttpGET(route: 'restaurant');
 // print(_res['statusCode']);

  if (_res['statusCode'] == 200) {
    //print(_res['response']);
    List<dynamic> _list = convert.json.decode(_res['response']);
    for (var e in _list) {
      list.add(Restaurent(
        imageUrl: e["picture"]??'',
        name: e["name"]??'',
        location : e["adress"]??'',
        Horaire: e["workhours"]??'',
        raiting: e["rating"].toString()??'',
       email: e["email_gestionnaire"]??'',
        phone: e["phone"]??'',
        id: e["id"]??'',
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

Future<List<Restaurent>> FetchMonResto({int id}) async {
  List<Restaurent> Rlist = [];
  Map<String, dynamic> _res = await HttpGET(route: 'restaurant',params: id);
 // print(_res['statusCode']);
  if (_res['statusCode'] == 200) {
    //print(_res['response']);
    List<dynamic> _list = convert.json.decode(_res['response']);
    // print(_list);
    for (var e in _list) {
      Rlist.add(Restaurent(
        imageUrl: e["picture"]??'',
        name: e["name"]??'',
        location : e["adress"]??'',
        Horaire: e["workhours"]??'',
        raiting: e["rating"].toString()??'',
        email: e["email_gestionnaire"]??'',
        phone: e["phone"]??'',
      ));
    };
  };
  return Rlist;

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

        Future<List<Commande>> FetchCommande({int id}) async {
       List<Commande> list = [];
        Map<String, dynamic> _res = await HttpGET(route: 'commande', params: id);

       if (_res['statusCode'] == 200) {
           // print(_res['response']);
         List<dynamic> _list = json.decode(_res['response']);
         for (var e in _list) {
          list.add(Commande(
            nom: e["lastname"] ?? '',
           prenom: e["firstname"] ?? '',
            date:  e["date"] ?? '',
            prix: e["price"].toString() ?? '',
            nomcommande: e["name"] ?? '',
            quantite : e["quantité"] ?? '',
            id: e["id"].toString() ?? '',
            longitude: e["longitude"].toString() ?? '',
            laltitude: e["latitude"].toString() ?? '',
            deliveryadress: e["adress"]?? '',

          ));
        };
  };
  return list;
 }

Future<List<Commande>> FetchHistCommande({int id}) async {
  List<Commande> list = [];
  Map<String, dynamic> _res = await HttpGET(route: 'commande/gestionnaire', params: id);

  if (_res['statusCode'] == 200) {
    // print(_res['response']);
    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Commande(
        nom: e["lastname"] ?? '',
        prenom: e["firstname"] ?? '',
        date:  e["date"] ?? '',
        prix: e["price"].toString() ?? '',
        deliveryadress: e["delivery_adress"] ?? '',
        nomcommande: e["name_plat"] ?? '',
        quantite : e["quantité"] ?? '',
        Etat:  e["state"] ?? '',

      ));
    };
  };
  return list;
}

Future<List<Commande>> FetchCommandeAttentClient({String email}) async {
  List<Commande> list = [];
  Map<String, dynamic> _res = await myHttpGET(route: 'commande/client/en_attente', params: email);

 //  print(_res['response']);

  if (_res['statusCode'] == 200) {

    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Commande(
       nomresto:e["name_restaurant"] ?? '',
        date:  e["date"] ?? '',
       // prix: e["price"].toString() ?? '',
       // deliveryadress: e["delivery_adress"] ?? '',
        nomcommande: e["name_plat"] ?? '',
        quantite : e["quantité"] ?? '',
        id: e["commande_id"].toString() ?? '',
        imageUrl: e["picture_plat"] ?? '',
        Etat: e["state"] ?? '',

      ));
    };
  };
 // print(_res['statusCode']);
  return list;
}

Future<List<Commande>> FetchCommandeHistoriqueClient({String email}) async {
  List<Commande> list = [];
  Map<String, dynamic> _res = await myHttpGET(route: 'commande/client', params: email);

   // print(_res['statusCode']);

  if (_res['statusCode'] == 200) {

    List<dynamic> _list = json.decode(_res['response']);
    for (var e in _list) {
      list.add(Commande(
        nomresto:e["name_restaurant"] ?? '',
        date:  e["date"] ?? '',
        // prix: e["price"].toString() ?? '',
        // deliveryadress: e["delivery_adress"] ?? '',
        nomcommande: e["name_plat"] ?? '',
        quantite : e["quantité"] ?? '',
        id: e["commande_id"].toString() ?? '',
        imageUrl: e["picture_plat"] ?? '',
        Etat: e["state"] ?? '',

      ));
    };
  };
  // print(_res['statusCode']);
  return list;
}

