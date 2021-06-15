import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:flutter_app/tools.dart';

class ModifierProfilgest extends StatefulWidget {
  @override
  _ModifierProfilgestState createState() => _ModifierProfilgestState();
}

class _ModifierProfilgestState extends State<ModifierProfilgest> {
  final _newpasswordController = TextEditingController();
  final _oldPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();

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

          child: ListView(
              children: [
                Container(
                  width: 150.0,
                  height: 150.0,
                  margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  child: CircleAvatar(
                    radius: 25,
                    child: ClipRRect(
                      child: Image.asset("assets/profile.png"),
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
                            controller: _nomController,
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
                            controller: _prenomController,
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
                                return 'Téléphone ne peut pas être vide';
                              }
                              return null;
                            },
                            controller: _phoneController,
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
                            controller: _newpasswordController,
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
                            controller: _oldPasswordController,
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
                            onPressed: () async {
                              String email = await read('email');
                              var result = await ModifierCompteGest(
                                  email:email,
                                  name:_nomController.text,
                                  prenom: _prenomController.text,
                                  phone: _phoneController.text,
                                  password:_newpasswordController.text ,
                                  confirmpassword:_oldPasswordController.text
                              );
                              print(_nomController.text);
                              print(_prenomController.text);
                              print(_phoneController.text);
                              print( _oldPasswordController.text);
                              print(_oldPasswordController.text);
                            },

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