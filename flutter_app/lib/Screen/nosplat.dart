import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/Plat.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:flutter_app/Screen/lastscreencat.dart';
import 'package:flutter_app/Screen/panier.dar.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/categorie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';



class NosPlat extends StatefulWidget {
  int id; // id restaurant
  NosPlat({this.id});

  @override
  _NosPlatState createState() => _NosPlatState();
}

class _NosPlatState extends State<NosPlat> {
  String email;
  @override
  Widget build(BuildContext context) {
    //  print(widget.id);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Nos Plat',
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
          future: FetchPlatResto(id : widget.id),
          builder: (context, snapshat) {
            if (snapshat.hasData ){
              return Container(
               // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,0.0),
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
                                builder: (_) => LastScreenCat (
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
                                    children: [
                                      Container(
                                        width: 150,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              categorie.raiting +'⭐',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              categorie.prix + ' DA',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              categorie.nresto,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                // fontWeight: FontWeight.bold,
                                                //letterSpacing: 1.2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          RawMaterialButton(
                                            onPressed: ()  async {
                                              // String val = categorie.id;
                                              final prefs = await SharedPreferences.getInstance();
                                              final key = 'email';
                                              email = prefs.getString(key);
                                              //print(email);
                                              var result = await AutGestfavori(
                                                email: email ,
                                                id_plat: categorie.id,
                                              );

                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.black45,
                                            padding: EdgeInsets.all(7.0),
                                            shape: CircleBorder(),
                                            child: Icon(
                                              Icons.favorite,
                                              size: 35.0,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          RawMaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => PanierScreen(
                                                        categorie: categorie,
                                                      )));
                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.black45,
                                            padding: EdgeInsets.all(7.0),
                                            shape: CircleBorder(),
                                            child: Icon(
                                              Icons.shopping_cart_rounded,
                                              size: 35.0,
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
            else return Container();
          },
        ),
      ),
    );
  }
}