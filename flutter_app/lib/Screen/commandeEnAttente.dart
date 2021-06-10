import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/restaurent.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/commande.dart';

class CommandeEnAttente extends StatefulWidget {
  String email;
  CommandeEnAttente({this.email});

  @override
  _CommandeEnAttenteState createState() => _CommandeEnAttenteState();
}

class _CommandeEnAttenteState extends State<CommandeEnAttente> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Commande en attente',
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

          child: FutureBuilder <List<Commande>>(
            future: FetchCommandeAttentClient( email: widget.email),
            builder: (context, snapchat) {
              if (snapchat.hasData)
              {
                return Container(
                  // padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: snapchat.data.length,
                    itemBuilder: (context, index) {
                      Commande commande = snapchat.data[index];
                      return Column(
                        children: [
                          Container(
                              margin: EdgeInsets.all(10.0),
                            child:Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child:
                                  Image.network(
                                    imagesUrl + commande.imageUrl,
                                    height: 200,
                                    width: 390,
                                    fit: BoxFit.cover,
                                  ),

                                ),
                                Container(
                                  width: 350,
                                  height: 200,
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
                                    padding: const EdgeInsets.fromLTRB(15.0,5.0,5.0,5.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          commande.nomcommande,
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children: [


                                            SizedBox(height: 3,),

                                            Text(
                                              'Quantité : ' + commande.quantite.toString(),
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),
                                            SizedBox(height: 3,),


                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  commande.nomresto,
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white
                                                  ),
                                                ),

                                                Text(
                                                  commande.date,
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 3,),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Container(
                                color: Colors.yellow.shade700,
                                child: RaisedButton(
                                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                  // onPressed: () => {
                                  //   Navigator.push(context,
                                  //       MaterialPageRoute(
                                  //           builder: (_) =>SignIn()
                                  //       )
                                  //   )
                                  //
                                  // },
                                  child: Container(
                                    color: Colors.yellow.shade700,
                                    child: new Text(
                                      'Annuler',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  //color: Colors.yellow.shade700,
                                ),
                              ),
                            ),
                          ),

                        ],
                      );
                    },
                  ),
                );
              }

              else return Container();

            },

          ),
        )
    );
  }
}