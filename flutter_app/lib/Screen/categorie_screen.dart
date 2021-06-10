import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:flutter_app/Providers/Plat.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/categorie_model.dart';
import 'file:///F:/app/flutter_app/lib/Widget/categorie_Carousel.dart';
import 'package:flutter_app/Screen/lastscreencat.dart';
import 'package:flutter_app/Screen/panier.dar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategorieScreen extends StatefulWidget {
  final Categorie categorie;
  String reponse;
  int value;

  CategorieScreen({this.categorie, this.value,this.reponse});

  @override
  _CategorieScreenState createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  int value;

  String email;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            widget.categorie.type,
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
            Icon(
              Icons.search,
              size: 35.0,
              color: Colors.yellow.shade700,
            ),
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
                    image: AssetImage("assets/Background.png"),
                    fit: BoxFit.cover)),
            child: FutureBuilder<List<Categorie>>(
              future: FetchPlat(categorie: widget.categorie.type.toLowerCase()),
              initialData: null,
              builder: (context, snapchat) {
                if (snapchat.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapchat.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildlistitem(snapchat.data[index]);
                    },
                  );
                }
                else return Container();
              },
            )));
  }

  buildlistitem(Categorie categorie) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => LastScreenCat(
                    categorie: categorie,
                    value: value,
                  ))),
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Hero(
                tag:categorie.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child:
                  Image.network(
                    imagesUrl + categorie.imageUrl,
                    height: 200,
                    width: 390,
                    fit: BoxFit.cover,
                  ),

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
                             // print (result['statusCode']);

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
                                            value: value,
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
  }



}
