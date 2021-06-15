import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/restaurent.dart';
import 'package:flutter_app/model/commande.dart';

class CommandeGestHome extends StatefulWidget {
  int id;
   CommandeGestHome({this.id});

  @override
  _CommandeGestHomeState createState() => _CommandeGestHomeState();
}

class _CommandeGestHomeState extends State<CommandeGestHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.3),
                      blurRadius: 10.0,
                      spreadRadius: 7.0,
                      offset: Offset(
                        2.0,
                        2.0,
                      ),
                    )
                  ]
              ),
              child: Center(
                child: Text(
                  'Commandes',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.yellow.shade700,
                      letterSpacing: 1.5),
                ),
              ),
            ),
            ]
          ),
        ),

        Container(
          height: 200,
          child: FutureBuilder <List<Commande>>(
            future: FetchCommande(id: widget.id),
              builder: (context, snapchat) {
              if (snapchat.hasData)
                {
                  return Container(
                   // padding: EdgeInsets.all(20),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapchat.data.length,

                      itemBuilder: (context, index) {
                        Commande commande = snapchat.data[index];

                        return Container(
                          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: RaisedButton(
                              //padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                              child: Container(
                                width: 500,
                                height: 60,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text(
                                      commande.nom + ' ' + commande.prenom,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),

                                    Text(
                                      commande.date,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                              color: Colors.yellow.shade700,
                            ),
                          ),

                        );


                      },
                    ),
                  );
                }

              else return Container(child: Center(child: CircularProgressIndicator(color: Colors.white,),),);

              },



          )
        ),
      ],
    );
  }
}
