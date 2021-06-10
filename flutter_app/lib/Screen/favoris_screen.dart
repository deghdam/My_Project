import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/Plat.dart';
import 'package:flutter_app/Screen/home_screen.dart';
import 'package:flutter_app/Screen/lastscreencat.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/categorie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FavorisScreen extends StatefulWidget {
  String email;
   FavorisScreen({this.email});

  @override
  _FavorisScreenState createState() => _FavorisScreenState();
}

class _FavorisScreenState extends State<FavorisScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        title: Text(
           'Mes Favois',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.yellow.shade700,
          ),
        ),
        iconTheme: IconThemeData(
            color: Colors.yellow.shade700
        ),
        backgroundColor: Color(0x44000000),
        elevation: 1,
        actions: [

          Icon(
            Icons.search,
            size:35.0,
            color: Colors.yellow.shade700,
          ),

          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(
                    builder: (_) =>HomeScreen()
                )),
            child: Image(
                fit: BoxFit.cover,
                width: 100,
                image:AssetImage(
                  'assets/Logo.png',
                ) ),
          ),


        ],
        bottomOpacity:1.0,
      ),

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Background.png"),
                fit: BoxFit.cover
            )),
        child:  FutureBuilder <List<Categorie>>(
          future:FetchPlatFavoris(email: widget.email) ,
          builder: (context, snapchat) {
            if (snapchat.hasData)
              {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:snapchat.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Categorie categorie = snapchat.data[index];
                    return GestureDetector(
                      onTap: () {

                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (_) => LastScreenCat(
                                  categorie : categorie,
                                  value: index,
                                )
                            )
                        );

                      },
                      child: Container(

                        margin: EdgeInsets.all(10.0),
                        child: Container(
                          //width: 250.0,
                          //height: 200,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              Hero(
                                tag : categorie.imageUrl,
                                child: ClipRRect(
                                  //borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                    imagesUrl + categorie.imageUrl,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Container(
                                width: 390,
                                height: 70,
                                decoration: BoxDecoration(
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
                                width: 340,
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12.withOpacity(0.4),
                                          blurRadius: 8.0,
                                          spreadRadius: 50.0,
                                          offset: Offset(
                                            2.0,
                                            2.0,
                                          ),
                                        )
                                      ]
                                  ),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [


                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
                                            child: Text(
                                              categorie.nresto,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22.0,
                                                // fontWeight: FontWeight.bold,
                                              //  letterSpacing: 1.2,
                                              ),
                                            ),
                                          ),

                                        ],

                                      ),

                                      RawMaterialButton(
                                        onPressed: () {},
                                        elevation: 2.0,
                                        fillColor: Colors.orange[400],
                                        padding: EdgeInsets.all(7.0),
                                        shape: CircleBorder(),
                                        child: Icon(Icons.favorite,
                                          size: 35.0,
                                          color: Colors.white,),
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

                );
              }

            else return Container();
          },
        )
      ),



    );
  }
}
