import 'package:flutter/material.dart';


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/Screen/mn_resto.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/categorie_model.dart';
import 'package:flutter_app/model/restaurent_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class ModifierRest extends StatefulWidget {
  Restaurent restaurent;
  int id;
  ModifierRest({this.restaurent,this.id});

  @override
  _ModifierRestState createState() => _ModifierRestState();
}

class _ModifierRestState extends State<ModifierRest> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  final _nomrestaurantController = TextEditingController();
  final _HoraireController = TextEditingController();
  final _phoneController = TextEditingController();
  final _adresseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   // print(widget.id);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        title: Text(
          'Modifier information',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.yellow.shade700,
          ),
        ),
        iconTheme: IconThemeData(
            color: Colors.yellow.shade700
        ),
        backgroundColor: Color(0x44000000),
        elevation: 1,
        actions: [


          GestureDetector(
            onTap: () {},
            child: Image(
                fit: BoxFit.cover,
                width: 100,
                image:AssetImage(
                  'assets/Logo.png',
                ) ),
          ),


        ],
        bottomOpacity:1.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_gest.png"),
                fit: BoxFit.cover
            )),
        child: SafeArea(
          child: ListView(
            children: [
              Form(
                  child: Column(
                    children: [
                      imageProfile(),

                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                              child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 1,
                                  validator: (String value){
                                    if(value.isEmpty){
                                      return 'Nom du restaurant ne peut pas être vide';
                                    }
                                    return null;
                                  },
                                  controller: _nomrestaurantController,
                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Nom du restaurant',
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
                                  validator: (var value){
                                    if(value.isEmpty){
                                      return 'Entrer Les Horaires du travaille Svp';
                                    }
                                    return null;
                                  },
                                  controller: _HoraireController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Horaire',
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
                                  keyboardType: TextInputType.text,
                                  validator: (String value){
                                    if(value.isEmpty){
                                      return 'adresse ne peut pas être vide';
                                    }
                                    return null;
                                  },
                                  controller: _adresseController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'adresse',
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
                                  keyboardType: TextInputType.number,
                                  validator: (String value){
                                    if(value.isEmpty){
                                      return 'Phone ne peut pas être vide';
                                    }
                                    return null;
                                  },
                                  controller: _phoneController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Phone',
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


                          ],
                        ),
                      ),

                      SizedBox(height: 50,),

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
                                'Appliquer',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0
                                ),
                              ),
                              color: Colors.yellow[700],
                              onPressed: () async {
                                final  prefs = await SharedPreferences.getInstance();
                                final key = 'email';
                                String email = prefs.getString(key);
                                // print(email);
                                // print(_adresseController);
                                var result = await Modifierresto(
                                   // email:email,
                                    phone:_phoneController.text,
                                  adresse: _adresseController.text,
                                  horaire: _HoraireController.text,
                                  nomresto: _nomrestaurantController.text,
                                  id: widget.id,
                                );

                                if (result['statusCode'] == 200) {
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => MonResto()));
                                }
                                else {
                                  Toast.show(
                                    'Inmformations incorrect',context,backgroundColor: Colors.redAccent,duration:5,);
                                }
                              }
                          ),
                        ),
                      ),

                    ],

                  )
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        Image.network(
            _imageFile == null ? imagesUrl + widget.restaurent.imageUrl : FileImage(File(_imageFile.path)),fit: BoxFit.cover,

        ),

        Positioned(
          bottom: 15.0,
          left: 170.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 35.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}