import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/Screen/ajouter_plat.dart';
import 'package:flutter_app/Gestionnaire/Screen/modifier_plat.dart';
import 'package:flutter_app/Providers/Plat.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/categorie_model.dart';

import 'Mon_plat_lst_gest.dart';


class MesPlatGest extends StatefulWidget {
  int id; // id restaurant
   MesPlatGest({this.id});

  @override
  _MesPlatGestState createState() => _MesPlatGestState();
}

class _MesPlatGestState extends State<MesPlatGest> {
  @override
  Widget build(BuildContext context) {
  //  print(widget.id);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Mes Plat',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
            color: Colors.yellow.shade700,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.yellow.shade700),
        backgroundColor: Color(0x44000000),
        elevation: 0,
        actions: [
          Image(
              fit: BoxFit.cover,
              width: 100,
              image: AssetImage(
                'assets/Logo.png',
              )),
        ],
        bottomOpacity: 1.0,
      ),

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_gest.png"),
                fit: BoxFit.cover)),
        child: FutureBuilder<List<Categorie>>(
          future: FetchPlatGest(id : widget.id),
          //initialData: null,
          builder: (context, snapshat) {
            if (snapshat.hasData ){
              return Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,50.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshat.data.length,
                  itemBuilder: (BuildContext context, index) {
                    Categorie categorie = snapshat.data[index] ;
                    return GestureDetector(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MonPlatGest (
                                  categorie: categorie,
                                )));
                      },

                      child: Container(
                        margin: EdgeInsets.fromLTRB(13.0,5.0,13.0,5.0),
                        child: Container(
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child:
                                Image.network(
                                  imagesUrl + categorie.imageUrl,
                                  height: 200,
                                  width: 390,
                                  fit: BoxFit.cover,
                                ),

                              ),
                              Container(
                                width: 350,
                                height: 50,
                                decoration: BoxDecoration(
                                  //                   borderRadius:BorderRadius.circular(200) ,
                                    boxShadow: [

                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.5),
                                        blurRadius: 10.0,
                                        spreadRadius: 5.0,
                                        offset: Offset(
                                          2.0,
                                          0.0,
                                        ),
                                      )
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    categorie.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                height: 100.0,
                                left: 15.0,
                                width: 390,
                                //right: 15.0,
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12.withOpacity(0.5),
                                      blurRadius: 8.0,
                                      spreadRadius: 50.0,
                                      offset: Offset(
                                        2.0,
                                        2.0,
                                      ),
                                    )
                                  ]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 150,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              categorie.prix + ' DA',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          RawMaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => ModifierPlat(
                                                        categorie: categorie,
                                                      )));
                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.black45,
                                            padding: EdgeInsets.all(7.0),
                                            shape: CircleBorder(),
                                            child: Icon(
                                              Icons.edit,
                                              size: 30.0,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          RawMaterialButton(
                                            elevation: 2.0,
                                            fillColor: Colors.black45,
                                            padding: EdgeInsets.all(7.0),
                                            shape: CircleBorder(),
                                            child: Icon(
                                              Icons.delete,
                                              size: 30.0,
                                              color: Colors.white70,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
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

            }
            else return Container(child: Center(child: CircularProgressIndicator(color: Colors.white,),),);
          },
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AjouterPlat (id: widget.id,)
              ));

        },
        child: Icon(Icons.add,
        size: 35,
        color: Colors.white70,),
        backgroundColor: Colors.yellow.shade700,
      ) ,
    );
  }
}
