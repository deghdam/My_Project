import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/Screen/categorie_gest.dart';
import 'package:flutter_app/Providers/Plat.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/categorie_model.dart';


class CategorieGVer extends StatelessWidget {
  const CategorieGVer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Categorie',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
            color: Colors.yellow.shade700,
          ),
        ),
        iconTheme: IconThemeData(
            color: Colors.yellow.shade700
        ),
        backgroundColor: Color(0x44000000),
        elevation: 0,
        actions: [

          Image(
              fit: BoxFit.cover,
              width: 100,
              image:AssetImage(
                'assets/Logo.png',
              ) ),


        ],
        bottomOpacity: 1.0,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_gest.png"),
                fit: BoxFit.cover
            )),
        child:FutureBuilder<List<Categorie>>(
          future:Fetchcategorie(),
          builder: (context, snapchat) {
            if(snapchat.hasData){
              return Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapchat.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Categorie categorie = snapchat.data[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(
                              builder: (_) => CategorieGest(
                                categorie : categorie,
                              )
                          )),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        child: Container(
//width: 250.0,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                                 ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child:Image.network(
                                    imagesUrl + categorie.imageUrl,
                                    height: 200,
                                    width: 390,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              Container(
                                width: 390,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.5),
                                        blurRadius: 8.0,
                                        spreadRadius: 3.0,
                                        offset: Offset(
                                          2.0,
                                          2.0,
                                        ),
                                      )
                                    ]
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20.0,10.0,0.0,0.0),
                                  child: Text(
                                    categorie.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    );
                  },
                ),
              );
            }else return Container();


          },
        )
      ),

    );;
  }
}
