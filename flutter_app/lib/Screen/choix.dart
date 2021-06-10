import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/Screen/signin_gest.dart';
import 'package:flutter_app/Screen/home_screen.dart';
class Choix extends StatefulWidget {
  @override
  _ChoixState createState() => _ChoixState();
}

class _ChoixState extends State<Choix> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backchoix.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 30.0),
                  child: SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)
                        ),
                        child: const Text(
                          'Client',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                          ),
                        ),
                        color: Colors.yellow[700],
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        }
                    ),
                  ),
                ),
                Container(
                  height: 160.0,
                  width: 160.0,
                  child: Image.asset('assets/Logo.png'),
                  margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 80.0),
                ),
                SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                      child: const Text(
                        'Gestionnaire',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                      color: Colors.yellow[700],
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (_) =>SigninGest()
                            ));

                      }
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}