import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/home_Ges.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:flutter_app/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';


class SigninGest extends StatefulWidget {
  const SigninGest({Key key}) : super(key: key);

  @override
  _SigninGestState createState() => _SigninGestState();
}

class _SigninGestState extends State<SigninGest> {

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
                                if (_signupKey.currentState.validate()) {
                                  var result = await AutGest(
                                      email: _emailController.text,
                                      password: _passwordController.text);
                                 // print(result['statusCode']);
                                  if (result['statusCode'] == 201) {

                                    var jsonResponse =
                                    convert.jsonDecode(result['response']) as Map<String, dynamic>;
                                    var email = jsonResponse['gestionnaire'][0]['email'];
                                    var itemCount =jsonResponse['gestionnaire'][0]['id'];
                                    save(email);
                                   // print(itemCount);
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (_) =>HomeGest(id:itemCount,)
                                        ));
                                  } else {
                                    Toast.show(
                                        'Inmformations incorrect',context,backgroundColor: Colors.redAccent);
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
                                Navigator.pushNamed(context, '/signupgest');
                              }),
                        ),
                      ]))
                ]))));
  }

        save(String email) async {
          final prefs = await SharedPreferences.getInstance();
          final key = 'email';
          final value = email;
          prefs.setString(key, value);
           // print(value);
        }
}
