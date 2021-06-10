import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/Screen/signup_gest.dart';
import 'file:///F:/app/flutter_app/lib/Screen/home_screen.dart';
import 'package:flutter_app/Screen/choix.dart';
// import 'package:flutter_app/Screen/home_screen.dart';
import 'package:flutter_app/Screen/signin.dart';
import 'package:flutter_app/Screen/signup.dart';
import 'package:flutter_app/Screen/commandeEnAttente.dart';
import 'package:flutter_app/Gestionnaire/home_Ges.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        // initialRoute: '/',
        routes: {
       //   '/': (BuildContext ctx) => Choix(),
          '/signin': (BuildContext ctx) => SignIn(),
          '/signup': (BuildContext ctx) => SignUp(),
          '/signupgest': (BuildContext ctx) => SignUpGest(),

        },
      home:Choix()

    );
  }
}

