import 'package:flutter/material.dart';
import 'package:flutter_app/Screen/panier.dar.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/categorie_model.dart';
import 'package:flutter_app/panie.dart';
import 'package:toast/toast.dart';

class Panier extends StatefulWidget {
  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Mon Panier',
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
                    image: AssetImage("assets/Background.png"),
                    fit: BoxFit.cover
                )),

            child:FutureBuilder<List<Categorie>>(
              future: PanierMethode.GetPlat(),
              builder: (context,snapchat){
                if(snapchat.hasError){
                  return Container(child: Center(child: (Text('${snapchat.error}')),),);
                }
                if(snapchat.hasData){
               return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapchat.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildlistitem(snapchat.data[index]);
                  },
                );
                }else
                  return Container(child: Center(child: CircularProgressIndicator(color: Colors.white,),),);

              },
            )
            // ListView(
            //     children: [
            //       Container(
            //         margin: EdgeInsets.all(10.0),
            //         child: Container(
            //           width: 250.0,
            //           child: Stack(
            //             alignment: Alignment.topCenter,
            //             children: <Widget>[
            //               ClipRRect(
            //                 borderRadius: BorderRadius.circular(20.0),
            //                 child: Image(
            //                   height: 200.0,
            //                   width: 400.0,
            //                   image: AssetImage('assets/categorie/pizza/pizza1.jpg'),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //               Container(
            //                 width: 390,
            //                 height: 50,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(30),
            //                     boxShadow: [
            //                       BoxShadow(
            //                         color: Colors.black12.withOpacity(0.5),
            //                         blurRadius: 8.0,
            //                         spreadRadius: 2.0,
            //                         offset: Offset(
            //                           2.0,
            //                           2.0,
            //                         ),
            //                       )
            //                     ]
            //                 ),
            //                 child: Padding(
            //                   padding: const EdgeInsets.fromLTRB(20.0,10.0,0.0,0.0),
            //                   child: Text(
            //                     'Pizza Végétarienne',
            //                     style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 20.0,
            //                       // fontWeight: FontWeight.w500,
            //                       letterSpacing: 1.2,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               // Positioned(
            //               //   bottom: 5.0,
            //               //   height: 100.0,
            //               //   left: 15.0,
            //               //   width: 390,
            //               //   child: Container(
            //               //     decoration: BoxDecoration(
            //               //       borderRadius: BorderRadius.circular(20),
            //               //       boxShadow: [
            //               //         BoxShadow(
            //               //           color: Colors.black12.withOpacity(0.5),
            //               //           blurRadius: 8.0,
            //               //           spreadRadius: 50.0,
            //               //           offset: Offset(
            //               //             2.0,
            //               //             2.0,
            //               //           ),
            //               //         )
            //               //       ]
            //               //     ),
            //               //   ),
            //               // )
            //             ],
            //           ),
            //         ),
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           SizedBox(
            //             width: 150.0,
            //             height: 50.0,
            //             child: FlatButton(
            //                 shape: new RoundedRectangleBorder(
            //                     borderRadius: new BorderRadius.circular(30.0)
            //                 ),
            //                 child: const Text(
            //                   'Commander',
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 20.0
            //                   ),
            //                 ),
            //                 color: Colors.yellow[700],
            //                 onPressed: () {
            //                   Navigator.pushNamed(context, '/modifierProfil');
            //                 }
            //             ),
            //           ),
            //           SizedBox(
            //             width: 150.0,
            //             height: 50.0,
            //             child: FlatButton(
            //                 shape: new RoundedRectangleBorder(
            //                     borderRadius: new BorderRadius.circular(30.0)
            //                 ),
            //                 child: const Text(
            //                   'Annuler',
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 20.0
            //                   ),
            //                 ),
            //                 color: Colors.red,
            //                 onPressed: () {
            //
            //                 }
            //             ),
            //           ),
            //         ],
            //       ),
            //       Container(
            //         margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
            //         child: Container(
            //           width: 250.0,
            //           child: Stack(
            //             alignment: Alignment.topCenter,
            //             children: <Widget>[
            //               ClipRRect(
            //                 borderRadius: BorderRadius.circular(20.0),
            //                 child: Image(
            //                   height: 200.0,
            //                   width: 400.0,
            //                   image: AssetImage('assets/categorie/salad/Salad_poulet.jpg'),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //               Container(
            //                 width: 390,
            //                 height: 50,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(30),
            //                     boxShadow: [
            //                       BoxShadow(
            //                         color: Colors.black12.withOpacity(0.5),
            //                         blurRadius: 8.0,
            //                         spreadRadius: 2.0,
            //                         offset: Offset(
            //                           2.0,
            //                           2.0,
            //                         ),
            //                       )
            //                     ]
            //                 ),
            //                 child: Padding(
            //                   padding: const EdgeInsets.fromLTRB(20.0,10.0,0.0,0.0),
            //                   child: Text(
            //                     'Crème dessert au chocolat',
            //                     style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 20.0,
            //                       // fontWeight: FontWeight.w500,
            //                       letterSpacing: 1.2,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               // Positioned(
            //               //   bottom: 5.0,
            //               //   height: 100.0,
            //               //   left: 15.0,
            //               //   width: 390,
            //               //   child: Container(
            //               //     decoration: BoxDecoration(
            //               //       borderRadius: BorderRadius.circular(20),
            //               //       boxShadow: [
            //               //         BoxShadow(
            //               //           color: Colors.black12.withOpacity(0.5),
            //               //           blurRadius: 8.0,
            //               //           spreadRadius: 50.0,
            //               //           offset: Offset(
            //               //             2.0,
            //               //             2.0,
            //               //           ),
            //               //         )
            //               //       ]
            //               //     ),
            //               //   ),
            //               // )
            //             ],
            //           ),
            //         ),
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           SizedBox(
            //             width: 150.0,
            //             height: 50.0,
            //             child: FlatButton(
            //                 shape: new RoundedRectangleBorder(
            //                     borderRadius: new BorderRadius.circular(30.0)
            //                 ),
            //                 child: const Text(
            //                   'Commander',
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 20.0
            //                   ),
            //                 ),
            //                 color: Colors.yellow[700],
            //                 onPressed: () {
            //
            //                 }
            //             ),
            //           ),
            //           SizedBox(
            //             width: 150.0,
            //             height: 50.0,
            //             child: FlatButton(
            //                 shape: new RoundedRectangleBorder(
            //                     borderRadius: new BorderRadius.circular(30.0)
            //                 ),
            //                 child: const Text(
            //                   'Annuler',
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 20.0
            //                   ),
            //                 ),
            //                 color: Colors.red,
            //                 onPressed: () {
            //
            //                 }
            //             ),
            //           ),
            //         ],
            //       ),
            //     ]
            // )
        )
    );
  }

  buildlistitem(Categorie categorie) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 160.0,
                  height: 50.0,
                  child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                      child: const Text(
                        'Commander',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                      color: Colors.yellow.shade700,
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PanierScreen(
                                  categorie: categorie,
                                )));

                      }
                  ),
                ),
                SizedBox(
                  width: 160.0,
                  height: 50.0,
                  child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                      child: const Text(
                        'Retirer',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                      color: Colors.red,
                      onPressed: () async {
                        PanierMethode.deletePlat(categorie.id);
                        Navigator.pop(context);
                        Toast.show(
                          'vous avez Retiré  le plat du panier',context,backgroundColor: Colors.redAccent,duration:5,);
                      }
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

