import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/Screen/signin_gest.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:toast/toast.dart';

class SignUpGest extends StatefulWidget {
  @override
  _SignUpGestState createState() => _SignUpGestState();
}

class _SignUpGestState extends State<SignUpGest> {

  final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _nomrestaurantController = TextEditingController();
  final _adresseController = TextEditingController();
  final _phonerestoController = TextEditingController();
  final _horaireController = TextEditingController();


  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Inscription',
            style: TextStyle(
              // fontSize: 25.0,
              // fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.yellow[700],
          leading: BackButton(color: Colors.white,),
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backg2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: [
                Container(
                  height: 160.0,
                  width: 160.0,
                  child: Image.asset('assets/Logo.png'),
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                ),
                Form(
                  key: _signupKey,
                  child:
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child: TextFormField(
                            validator: (String value){
                              if(value.isEmpty){
                                return 'Nom ne peut pas ??tre vide';
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
                                return 'Pr??nom ne peut pas ??tre vide';
                              }
                              return null;
                            },
                            controller: _prenomController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Pr??nom',
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
                                return 'Email ne peut pas ??tre vide';
                              }
                              return null;
                            },
                            controller: _emailController,
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
                                return 'Nom du restaurant ne peut pas ??tre vide';
                              }
                              return null;
                            },
                            controller:_nomrestaurantController ,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Nom du Restaurant',
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
                                return 'T??l??phone ne peut pas ??tre vide';
                              }
                              return null;
                            },
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'T??l??phone',
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
                                return 'T??l??phone du Restaurant ne peut pas ??tre vide';
                              }
                              return null;
                            },
                            controller: _phonerestoController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'T??l??phone du Restaurant',
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
                                return 'Adresse du restaurant ne peut pas ??tre vide';
                              }
                              return null;
                            },
                             controller: _adresseController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Adresse du Restaurant',
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
                                return 'Horaire du Travaille ne peut pas ??tre vide';
                              }
                              return null;
                            },
                            controller: _horaireController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Horaire du Travaille',
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
                                return 'Mot de passe ne peut pas ??tre vide';
                              }
                              else if(value.length < 6){
                                return 'Mot de passe trop court';
                              }
                              return null;
                            },
                            controller: _passwordController,
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
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child: TextFormField(
                            validator: (String value) {
                              if (value != _passwordController.value.text) {
                                return 'Les mot de passe ne sont pas identiques';
                              }
                              return null;
                            },
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Mot de passe confirmation',
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
                      SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)
                            ),
                            child: const Text(
                              'Inscription',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0
                              ),
                            ),
                            color: Colors.yellow[700],
                            onPressed: () async{
                              if(_signupKey.currentState.validate()){
                                int value = int.parse(_phoneController.text);
                                var result = await SignupGest(
                                  password: _passwordController.text,
                                  email: _emailController.text,
                                  nom: _nomController.text,
                                  prenom: _prenomController.text,
                                  passwordconf: _confirmPasswordController.text,
                                  phonegest:value.toString(),
                                  phoneresto: _phonerestoController.text.toString(),
                                  nomresto: _nomrestaurantController.text,
                                  horaire: _horaireController.text,
                                  adress: _adresseController.text,
                                );

                                if (result['statusCode'] == 201) {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SigninGest()));
                                  Toast.show(
                                    'Vous avez bien inscrit ',context,backgroundColor: Colors.redAccent,duration:5);

                                } else {
                                  Toast.show(
                                      'Inmformations incorrect',context,backgroundColor: Colors.redAccent,duration:5);
                                }

                              }
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                        child: Text(
                          'Vous avez d??j?? un compte? Connectez vous',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        child: SizedBox(
                          width: 200.0,
                          height: 50.0,
                          child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0)
                              ),
                              child: const Text(
                                'Connexion',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0
                                ),
                              ),
                              color: Colors.yellow[700],
                              onPressed: () {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SigninGest()));
                              }
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}