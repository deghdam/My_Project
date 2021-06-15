import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:flutter_app/Screen/home_screen.dart';
import 'package:flutter_app/tools.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Connexion',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.yellow.shade700,
          leading: BackButton(
            color: Colors.white,
          ),
          elevation: 0,
          bottomOpacity: 1.0,
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
                child: ListView(children: [
                  Container(
                    height: 160.0,
                    width: 160.0,
                    child: Image.asset('assets/Logo.png'),
                    margin: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 30.0),
                  ),
                  Form(
                      key: _signupKey,
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                          child: TextFormField(
                              controller: _emailController,
                              validator: (String value) {
                                if (value.isEmpty) {
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
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                          child: TextFormField(
                              controller: _passwordController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Mot de passe ne peut pas être vide';
                                } else if (value.length < 6) {
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
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 200.0,
                          height: 50.0,
                          child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              child: const Text(
                                'Connexion',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              color: Colors.yellow[700],
                              onPressed: () async {
                                FocusScope.of(context).requestFocus(new FocusNode());
                                Toast.show(
                                  'Authentification en cours ...',context,backgroundColor: Colors.green,duration:5,);
                                if (_signupKey.currentState.validate()) {
                                  var result = await AutClient(
                                      email: _emailController.text,
                                      password: _passwordController.text);
                                  if (result['statusCode'] == 201) {
                                  //  print(result["response"]);
                                    Toast.show('Authentification avec succes',context,backgroundColor: Colors.green,duration:5,);
                                    save(key: 'email',value: _emailController.text);
                                    var jsonResponse = jsonDecode(result['response']) as Map<String, dynamic>;
                                    save(key: 'token',value:jsonResponse['token']);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => HomeScreen(
                                              email:_emailController.text ,

                                            )));
                                  } else {
                                    Toast.show(
                                        'Inmformations incorrect',context,backgroundColor: Colors.redAccent,duration:5,);
                                  }
                                }
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          child: Text(
                            'Vous n\'avez pas un compte? Inscrivez vous',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          height: 50.0,
                          child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              child: const Text(
                                'Inscription',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              color: Colors.yellow[700],
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              }),
                        ),
                      ]))
                ]))));
  }




}
