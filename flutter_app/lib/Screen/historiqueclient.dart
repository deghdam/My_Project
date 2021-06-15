import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/restaurent.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/commande.dart';

class HistoriqueClient extends StatefulWidget {
  String email;
  HistoriqueClient({this.email});

  @override
  _HistoriqueClientState createState() => _HistoriqueClientState();
}

class _HistoriqueClientState extends State<HistoriqueClient> {

  @override
  Widget build(BuildContext context) {
   // print(widget.email);
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
                image: AssetImage("assets/Background.png"),
                fit: BoxFit.cover
            )),

        child: FutureBuilder <List<Commande>>(
          future: FetchCommandeHistoriqueClient(email: widget.email),
            builder: (context, snapchat){
              if (snapchat.hasData)
              {
                return ListView.builder(
                    itemCount: snapchat.data.length,
                    itemBuilder:(context, index) {
                      Commande commande = snapchat.data[index];
                      return Container(
                        margin: EdgeInsets.fromLTRB(10, 10.0, 14.0, 10.0),
                        child: Container(
                          height: 180,
                          width: double.infinity,
                          child: Stack(
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
                                  //  borderRadius:BorderRadius.circular(200) ,
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
                                            fontSize: 20.0,
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
                                            'Etat : ' + commande.Etat,
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
                                          SizedBox(height: 3,),


                                          Text(
                                            commande.nomresto,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white
                                            ),
                                          ),
                                          SizedBox(height: 3,),
                                          Text(
                                            "Date de Livraison : " + commande.date,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white
                                            ),
                                          ),
                                          SizedBox(height: 3,),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      );
                    }, );
              } else return Container(child: Center(child: CircularProgressIndicator(color: Colors.white,),),);
            }

        )
      ),
    );
  }
}