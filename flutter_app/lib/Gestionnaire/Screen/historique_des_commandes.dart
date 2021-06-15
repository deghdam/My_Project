import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/restaurent.dart';
import 'package:flutter_app/model/commande.dart';


class HistoriqueCommandeGest extends StatefulWidget {
  int id;

   HistoriqueCommandeGest({this.id});

  @override
  _HistoriqueCommandeGestState createState() => _HistoriqueCommandeGestState();
}

class _HistoriqueCommandeGestState extends State<HistoriqueCommandeGest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Historique des commandes',
          style: TextStyle(
            fontSize: 20.0,
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

        child: FutureBuilder <List<Commande>>(
          future: FetchHistCommande(id: widget.id),
          builder: (context, snapchat) {
            if (snapchat.hasData)
              {
                return Container(
                 // width: 300,

                  child: ListView.builder(
                    itemCount: snapchat.data.length,
                    itemBuilder: (context, index) {
                      Commande commande = snapchat.data[index];
                      return Container(
                       // width: 200,
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(15, 10.0, 15.0, 10.0),
                              color: Colors.black12,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15.0,0.0,5.0,0.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          commande.nomcommande,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),

                                        SizedBox(height: 3,),

                                        Text(
                                          'Quantité : ' + commande.quantite.toString(),
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                        Text(
                                          'Etat : ' + commande.Etat,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                        SizedBox(height: 3,),


                                        Text(
                                          commande.deliveryadress,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                        SizedBox(height: 3,),


                                        Text(
                                          commande.date,
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
                                              commande.prix + ' DA',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),

                                            Text(
                                              commande.nom + ' ' + commande.prenom,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        ),


                                      ],
                                    ),
                                  ),




                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else return Container(child: Center(child: CircularProgressIndicator(color: Colors.white,),),);

          },



        ),
      ),

    );
  }
}
