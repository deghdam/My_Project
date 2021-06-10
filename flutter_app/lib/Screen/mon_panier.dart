import 'package:flutter/material.dart';

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

            Icon(
              Icons.search,
              size:35.0,
              color: Colors.yellow.shade700,
            ),

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

            child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Container(
                      width: 250.0,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 200.0,
                              width: 400.0,
                              image: AssetImage('assets/categorie/pizza/pizza1.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 390,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12.withOpacity(0.5),
                                    blurRadius: 8.0,
                                    spreadRadius: 2.0,
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
                                'Pizza Végétarienne',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  // fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   bottom: 5.0,
                          //   height: 100.0,
                          //   left: 15.0,
                          //   width: 390,
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(20),
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: Colors.black12.withOpacity(0.5),
                          //           blurRadius: 8.0,
                          //           spreadRadius: 50.0,
                          //           offset: Offset(
                          //             2.0,
                          //             2.0,
                          //           ),
                          //         )
                          //       ]
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 150.0,
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
                            color: Colors.yellow[700],
                            onPressed: () {
                              Navigator.pushNamed(context, '/modifierProfil');
                            }
                        ),
                      ),
                      SizedBox(
                        width: 150.0,
                        height: 50.0,
                        child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)
                            ),
                            child: const Text(
                              'Annuler',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0
                              ),
                            ),
                            color: Colors.red,
                            onPressed: () {

                            }
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                    child: Container(
                      width: 250.0,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 200.0,
                              width: 400.0,
                              image: AssetImage('assets/categorie/salad/Salad_poulet.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 390,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12.withOpacity(0.5),
                                    blurRadius: 8.0,
                                    spreadRadius: 2.0,
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
                                'Crème dessert au chocolat',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  // fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   bottom: 5.0,
                          //   height: 100.0,
                          //   left: 15.0,
                          //   width: 390,
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(20),
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: Colors.black12.withOpacity(0.5),
                          //           blurRadius: 8.0,
                          //           spreadRadius: 50.0,
                          //           offset: Offset(
                          //             2.0,
                          //             2.0,
                          //           ),
                          //         )
                          //       ]
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 150.0,
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
                            color: Colors.yellow[700],
                            onPressed: () {

                            }
                        ),
                      ),
                      SizedBox(
                        width: 150.0,
                        height: 50.0,
                        child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)
                            ),
                            child: const Text(
                              'Annuler',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0
                              ),
                            ),
                            color: Colors.red,
                            onPressed: () {

                            }
                        ),
                      ),
                    ],
                  ),
                ]
            )
        )
    );
  }
}