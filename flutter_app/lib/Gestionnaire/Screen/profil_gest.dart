
import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/Screen/modifierprofil_gest.dart';
import 'package:flutter_app/Widget/modifierProfil.dart';
import 'package:flutter_app/model/personne.dart';


class Profil_gest extends StatefulWidget {
  Personne personne;

  Profil_gest({ this.personne});
  @override
  _Profil_gestState createState() => _Profil_gestState();
}

class _Profil_gestState extends State<Profil_gest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Mon Profil',
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
        elevation: 10,
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

        child: Column(
          children: [
            SizedBox(height: 100.0,),
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/profile.png',
              ),
              radius: 80.0,
            ),

            SizedBox(height: 20.0,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Nom',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),),

                    SizedBox( height:20.0),
                    Text(
                      'Prenom',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,

                      ),),

                    SizedBox( height:20.0),

                    Text(
                      'Téléphone',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,

                      ),),

                    SizedBox( height:20.0),

                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,

                      ),),

                  ],
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.personne.nom,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,

                      ),
                    ),

                    SizedBox( height:20.0),

                    Text(
                      widget.personne.prenom,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,

                      ),
                    ),

                    SizedBox( height:20.0),

                    Text(
                      widget.personne.phone,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,

                      ),
                    ),

                    SizedBox( height:30.0),

                    Text(
                      widget.personne.email,
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,

                      ),
                    ),
                  ],
                )
              ],
            ),

            SizedBox(height: 30,),


            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (_) =>ModifierProfilgest()
                        ))
                  },
                  child: new Text(
                    'Modifier',
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
    );
  }
}