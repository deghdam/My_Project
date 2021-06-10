
import 'package:flutter/material.dart';
import 'package:flutter_app/Widget/modifierProfil.dart';


class Profil extends StatefulWidget {
  final Profil profil;

  Profil({ this.profil});
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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
                image: AssetImage("assets/Background.png"),
                fit: BoxFit.cover
            )),

        child: Column(
            children: [
              SizedBox(height: 100.0,),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/sam.JPG',
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

                        SizedBox( height:20.0),

                        Text(
                          'Adresse',
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
                           'Deghdak',
                           style: TextStyle(
                             fontSize: 25.0,
                             color: Colors.white,

                           ),
                         ),

                         SizedBox( height:20.0),

                         Text(
                           'Sami',
                           style: TextStyle(
                             fontSize: 25.0,
                             color: Colors.white,

                           ),
                         ),

                         SizedBox( height:20.0),

                         Text(
                           '03151528',
                           style: TextStyle(
                             fontSize: 25.0,
                             color: Colors.white,

                           ),
                         ),

                         SizedBox( height:30.0),

                         Text(
                           'samideghdak@gmail.com',
                           style: TextStyle(
                             fontSize: 17.0,
                             color: Colors.white,

                           ),
                         ),

                         SizedBox( height:30.0),

                         Text(
                           'Sidi Mabrouk Constantine',
                           style: TextStyle(
                             fontSize: 17.0,
                             color: Colors.white,
                             overflow: TextOverflow.ellipsis,


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
                    builder: (_) =>ModifierProfil()
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





