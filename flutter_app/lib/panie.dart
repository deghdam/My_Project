import 'package:flutter_app/model/categorie_model.dart';
import 'package:flutter_app/mysqlite.dart';
import 'package:sqflite/sqflite.dart';

const tablename ='panier';
class PanierMethode{
  static AddPlat(Categorie plat)async{
    Database _db = await SQLite.getdb();
    //
    String sql = "select * from $tablename where id  = ${plat.id}";
    List<Categorie> result = [];
    List<Map<String, dynamic>> resultquery = await _db.rawQuery(sql);
    Map<String, dynamic> platmap = new Map();
    if(resultquery.length == 0) {
      platmap["id"] = plat.id;
      platmap["name"] = plat.name;
      platmap["prix"] = plat.prix;
      platmap["imageUrl"] = plat.imageUrl;
      platmap["ingredien"] = plat.ingredien;
      platmap["nresto"] = plat.nresto;
      platmap["id_resto"] = plat.id_resto;
      platmap["raiting"] = plat.raiting;
      platmap["type"] = plat.type;
      platmap["quantite"] = 1;
      int result = await _db.insert(tablename, platmap);
      return result;
    }else{
      platmap['quantite'] = resultquery[0]['quantite']+1;
      int result = await _db.update(tablename, platmap,where: 'id = ?', whereArgs: [plat.id]);
      return result;
    }
  }
  static deletePlat(id)async{
    Database _db = await SQLite.getdb();
    int result = await _db.delete(tablename,where: 'id = ?', whereArgs: [id]);
    return result;
  }



 static Future<List<Categorie>> GetPlat() async {
    Database _db = await SQLite.getdb();
    String sql = "SELECT * FROM $tablename";
    List<Categorie> result = [];
    List<Map<String, dynamic>> resultquery = await _db.rawQuery(sql);
    for (var i = 0; i <= resultquery.length - 1; i++) {
      result.add(new Categorie(
        id: resultquery[i]["id"].toString(),
        imageUrl: resultquery[i]["imageUrl"],
        prix: resultquery[i]["prix"].toString(),
        ingredien: resultquery[i]["ingredien"],
        raiting: resultquery[i]["raiting"],
        nresto: resultquery[i]["nresto"],
        id_resto: resultquery[i]["id_resto"],
        name: resultquery[i]["name"],
        type: resultquery[i]["type"],
        quantite: resultquery[i]["quantite"].toString()
        ,

      ));
    }
    return result;
  }
}