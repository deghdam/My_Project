import 'package:flutter/material.dart';

class ModifierProfil extends StatefulWidget {
  @override
  _ModifierProfilState createState() => _ModifierProfilState();
}

class _ModifierProfilState extends State<ModifierProfil> {

  final GlobalKey<FormState> _modifierProfileKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Modifier Profil',
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
                  width: 150.0,
                  height: 150.0,
                  margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  child: CircleAvatar(
                    radius: 25,
                    child: ClipRRect(
                      child: Image.asset("assets/sam.JPG"),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                Form(
                  key: _modifierProfileKey,
                  child:
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child: TextFormField(
                            validator: (String value){
                              if(value.isEmpty){
                                return 'Nom ne peut pas être vide';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Nom',
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child: TextFormField(
                            validator: (String value){
                              if(value.isEmpty){
                                return 'Prénom ne peut pas être vide';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Prénom',
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child: TextFormField(
                            validator: (String value){
                              if(value.isEmpty){
                                return 'Email ne peut pas être vide';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Email',
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child: TextFormField(
                            validator: (String value){
                              if(value.isEmpty){
                                return 'Téléphone ne peut pas être vide';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Téléphone',
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child: TextFormField(
                            validator: (String value){
                              if(value.isEmpty){
                                return 'Mot de passe ne peut pas être vide';
                              }
                              else if(value.length < 6){
                                return 'Mot de passe trop court';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Mot de passe',
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                        child: Text(
                          'Pour confirmer votre identité, entrer votre mot de passe',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child: TextFormField(
                            validator: (String value){
                              if(value.isEmpty){
                                return 'Mot de passe ne peut pas être vide';
                              }
                              else if(value.length < 6){
                                return 'Mot de passe trop court';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Mot de passe',
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: RaisedButton(
                            onPressed: null,
                            color: Colors.yellow.shade700,
                            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                            child: new Text(
                              'Appliquer',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ]
          ),
        )
    );
  }
}