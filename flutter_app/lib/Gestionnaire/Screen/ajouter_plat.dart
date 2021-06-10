import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/Screen/mes_plat_gest.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:flutter_app/model/categorie_model.dart';
import 'package:image_form_field/image_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';


class AjouterPlat extends StatefulWidget {

  int id;
   AjouterPlat({this.id});


  @override
  _AjouterPlatState createState() => _AjouterPlatState();
}

class _AjouterPlatState extends State<AjouterPlat> {
  List<String> _categorie = ['pizza', 'soupe', 'sandwich', 'salade'];
  String _selectedCategorie;
  final _nomplatController = TextEditingController();
  final _prixController = TextEditingController();
  final _ingredientsController = TextEditingController();

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        title: Text(
           'Ajouter un Plat',//widget.categorie.name,
          style: TextStyle(
            fontSize: 20.0,
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
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_gest.png"),
                fit: BoxFit.cover
            )),
        child: SafeArea(
          child: ListView(
            children: [
              Form(
                child:Column(
                  children: [
                    SizedBox(height: 30.0),
                    Container(
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                      child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Nom du plat ne peut pas être vide';
                            }
                            return null;
                          },
                          controller: _nomplatController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nom du Plat',
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
                          validator: (var value){
                            if(value.isEmpty){
                              return 'Entrer Le prix du plat Svp';
                            }
                            return null;
                          },
                          controller: _prixController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Prix',
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
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'ingrédients ne peut pas être vide';
                            }
                            return null;
                          },
                          controller: _ingredientsController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'ingrédients',
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

                    ClipRRect(
                      borderRadius:BorderRadius.circular(15.0) ,
                      child: Container(
                        color: Colors.white,
                        width: 340,
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                        child:DropdownButton(
                          hint: Text('Please choose a categorie'), // Not necessary for Option 1
                          value: _selectedCategorie,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategorie = newValue;
                            });
                          },
                          items: _categorie.map((categorie) {
                            return DropdownMenuItem(
                              child: new Text(categorie),
                              value: categorie,
                            );
                          }).toList(),
                      ),
                      ),
                    ),



                    //imageProfile(),

                    SizedBox(height: 100),

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
                              'Enregistrer',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0
                              ),
                            ),
                            color: Colors.yellow[700],
                            onPressed: () async {
                              var result = await Ajouterplat(
                                ingrediant:_ingredientsController.text,
                                nameplat: _nomplatController.text,
                                prix: _prixController.text,
                                id: widget.id.toString(),
                                categorie: _selectedCategorie,
                              );
                              if (result['statusCode'] == 201) {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => MesPlatGest()));
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
                ),

              )

            ],
          )
        ),
      ),


    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/sam.JPG")
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
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

