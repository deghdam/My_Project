import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/Screen/commande_gest.dart';
import 'package:flutter_app/Gestionnaire/Screen/historique_des_commandes.dart';
import 'package:flutter_app/Gestionnaire/Screen/mes_commande_gest.dart';
import 'package:flutter_app/Gestionnaire/Screen/mn_resto.dart';
import 'package:flutter_app/Gestionnaire/Screen/profil_gest.dart';
import 'package:flutter_app/Gestionnaire/Screen/signin_gest.dart';
import 'package:flutter_app/Gestionnaire/widget/categorie_Gest_Caroudel.dart';
import 'package:flutter_app/Providers/Plat.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/personne.dart';
import 'package:flutter_app/model/restaurent_model.dart';
class HomeGest extends StatefulWidget {
 // final Restaurent restaurent;
  int id;
  String email;
   HomeGest({this.id,this.email});

  @override
  _HomeGestState createState() => _HomeGestState();
}

class _HomeGestState extends State<HomeGest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Home',
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

      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
        ),
        child: Drawer(

          child: ListView(

            padding: EdgeInsets.zero,

            children:  <Widget>[
              SizedBox(
                height: 340,
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child:FutureBuilder<List<Personne>>(
                      future:FetchinfoGest(email: widget.email) ,
                      builder: (context, snapchat) {
                        if(snapchat.hasData){
                          return ListView.builder(
                            itemCount: snapchat.data.length,
                            itemBuilder:(BuildContext context, index) {
                              Personne personne = snapchat.data[index];
                              return Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                      'assets/profile.png',
                                    ),
                                    radius: 80.0,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    personne.prenom + ' ' + personne.nom,
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),

                                  SizedBox(height: 10.0),

                                  GestureDetector(
                                    onTap:() => Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (_) => Profil_gest(personne: personne,)
                                        )),
                                    child: Container(
                                      color: Colors.black45,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: Container(
                                          color: Colors.yellow.shade700,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                            child: new Text(
                                              'Voir mon pofil',
                                              style: TextStyle(
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );

                            },);

                        } else return Container(child: Center(child: CircularProgressIndicator(color: Colors.white,),),);
                      },
                    )

                ),
              ),

              ListTile(
                onTap:() {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => MonResto(id: widget.id,)
                      ));
                },
                leading: Icon(Icons.restaurant,
                  color: Colors.yellow.shade700,),
                title: Text('Mon Restaurant',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
              ),

              ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) =>MesCommandes(id: widget.id,)
                      ));
                },
                leading: Icon(Icons.av_timer_rounded,
                  color: Colors.yellow.shade700,),
                title: Text('Mes Commandes',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) =>HistoriqueCommandeGest(id: widget.id,)
                      ));
                },
                leading: Icon(Icons.history,
                  color: Colors.yellow.shade700,),
                title: Text('Historique des commandes',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
              ),


              SizedBox(height: 70.0,),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    onPressed: () async {
                      var result = await Deconnexionclient();
                      print(result["statusCode"]);
                       if(result["statusCode"] == 200){
                         Navigator.pushReplacementNamed(
                             context,'/signingest');
                          }
                       },
                    child: new Text(
                      'D??connexion',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    color: Colors.yellow.shade700,
                  ),
                ),
              ),




            ],
          ),

        ),
      ),





      body:Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_gest.png"),
                fit: BoxFit.cover
            )),

        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 10.0),
              CategorieGestCr(),
              //SizedBox(height: 20.0),
              CommandeGestHome(id: widget.id)
            ],

          ),
        ),
      ),

    );
  }
}
