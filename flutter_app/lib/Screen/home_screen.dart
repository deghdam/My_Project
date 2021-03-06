import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/Plat.dart';
import 'package:flutter_app/Providers/client.dart';
import 'file:///F:/app/flutter_app/lib/Widget/categorie_Carousel.dart';
import 'package:flutter_app/Widget/restaurent_carousel.dart';
import 'package:flutter_app/Screen/Profil.dart';
import 'package:flutter_app/Screen/favoris_screen.dart';
import 'package:flutter_app/Screen/commandeEnAttente.dart';
import 'package:flutter_app/Screen/mon_panier.dart';
import 'package:flutter_app/Screen/historiqueclient.dart';
import 'package:flutter_app/Screen/signin.dart';
import 'package:flutter_app/model/personne.dart';
import 'package:flutter_app/tools.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  String email;
  HomeScreen({this.email});



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                      future:Fetchinfoclient(email: widget.email) ,
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
                                            builder: (_) => Profil(personne: personne,)
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

                        } else return Container();
                      },
                    )

                ),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) =>Panier()
                      ));
                  },
                leading: Icon(Icons.shopping_cart_rounded,
                  color: Colors.yellow.shade700,),
                title: Text(
                  'Mon Panier',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                 var email= await read('email');
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) =>FavorisScreen(email)
                      ));
                },
                leading: Icon(Icons.star,
                  color: Colors.yellow.shade700,),
                title: Text('Mes Favoris',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              ListTile(
                onTap: () async {
                  var email= await read('email');
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) =>HistoriqueClient(email : email)
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
              ListTile(
                onTap: () async {
                  final  prefs = await SharedPreferences.getInstance();
                  final key = 'email';
                  String email = prefs.getString(key);
                  // print(email);
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) =>CommandeEnAttente(
                            email: email,
                          )
                      ));
                },
                leading: Icon(Icons.av_timer_rounded,
                  color: Colors.yellow.shade700,),
                title: Text('Commandes en Attente',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
              ),

              SizedBox(height: 20.0,),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    onPressed: () async{
                      var result = await Deconnexionclient();
                    if(result["statusCode"] == 200){
                      Navigator.pushReplacementNamed(
                          context,'/signin');
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


         body: Container(
           constraints: BoxConstraints.expand(),
           decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage("assets/Background.png"),
                   fit: BoxFit.cover
               )),
           child: SafeArea(

             child: ListView(
               children: <Widget>[

                 SizedBox(height: 10.0),
                 CategorieCarousel(),
                 SizedBox(height: 10.0),
                 RestaurentCraousel()
               ],
             ),


           ),
         ),
      );
  }
}

