import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:flutter_app/Providers/restaurent.dart';
import 'package:flutter_app/model/commande.dart';
import 'package:toast/toast.dart';


class MesCommandes extends StatefulWidget {
  int id;
   MesCommandes({this.id});

  @override
  _MesCommandesState createState() => _MesCommandesState();
}

class _MesCommandesState extends State<MesCommandes> {
  @override
  Widget build(BuildContext context) {
    //print(widget.id);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Mes Commandes',
          style: TextStyle(
            fontSize: 20.0,
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
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_gest.png"),
                fit: BoxFit.cover
            )),
        child: FutureBuilder <List<Commande>>(
          future: FetchCommande(id: widget.id),
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
                            height: 150,
                            width: 350,
                            margin: EdgeInsets.fromLTRB(0, 10.0, 5.0, 10.0),
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
                                      'Approuver',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0
                                      ),
                                    ),
                                    color: Colors.yellow.shade700,
                                    onPressed: () async {
                                      var result = await ApprouverCommande(
                                        id: commande.id.toString(),
                                      );
                                      if (result['statusCode'] == 200) {
                                        // Navigator.pop(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (_) => SigninGest()));
                                        Toast.show(
                                          'Vous avez Appouver La Commande ',context,backgroundColor: Colors.redAccent,duration:5);

                                      } else {
                                        Toast.show(
                                            'Inmformations incorrect',context,backgroundColor: Colors.redAccent,duration:5);
                                      }

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
                                      'Refuser',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0
                                      ),
                                    ),
                                    color: Colors.red,
                                    onPressed: () async {
                                      var result = await RefuserCommande(
                                        id: commande.id.toString(),
                                      );
                                      if (result['statusCode'] == 200) {
                                        // Navigator.pop(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (_) => SigninGest()));
                                        Toast.show(
                                            'Vous avez Refuser La Commande ',context,backgroundColor: Colors.redAccent,duration:5);

                                      } else {
                                        Toast.show(
                                            'Inmformations incorrect',context,backgroundColor: Colors.redAccent,duration:5);
                                      }



                                    }
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                        ],
                      );
                    },
                ),
              );
            }

            else return Container();

            },

        ),

      ),
      floatingActionButton: SizedBox(
        width: 335.0,
        height: 50.0,
        child: FlatButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)
            ),
            child: const Text(
              'Voir les commandes sur la carte',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
              ),
            ),
            color: Colors.yellow.shade700,
            onPressed: () {

            }
        ),
      ),
    );
  }
}
