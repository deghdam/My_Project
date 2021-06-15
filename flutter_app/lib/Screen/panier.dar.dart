import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:flutter_app/model/categorie_model.dart';
import 'package:flutter_app/Screen/categorie_screen.dart';
import 'package:flutter_app/panie.dart';
import 'package:flutter_app/tools.dart';
import 'package:toast/toast.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:geolocator/geolocator.dart';

import 'dart:ui';


import '../http.dart';

class PanierScreen extends StatefulWidget {
  final Categorie categorie;

  PanierScreen({this.categorie,});

  @override
  _PanierScreenState createState() => _PanierScreenState();
}


class _PanierScreenState extends State<PanierScreen> {
  TextEditingController _locationController = TextEditingController();
  List<String> _Mode_paiment = ['Visa Carde', 'Paypal', 'Edahabie'];
  String time ; // DateTime.now() as String;
  String _selectedMode;
  int cont ;
  String _currentAddress;
  Position _currentPosition;

  @override
  Future<void> initState()  {
    // TODO: implement initState
    super.initState();
    cont =int.parse(widget.categorie.quantite);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: Text(
          'Passer la Commande',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
            color: Colors.yellow.shade700,
          ),
        ),
        iconTheme: IconThemeData(
            color: Colors.yellow.shade700
        ),
        backgroundColor: Color(0x44000000),
        elevation: 4,
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
         child:ListView(
           children: [
           Column(
             children: [
              // SizedBox(height: 20.0,),
               Form(
                 child: Container(
                   height: 240.0,
                   width: 500.0,
                   child: Hero(
                     tag: widget.categorie.imageUrl,
                     child: Image.network(
                         imagesUrl + widget.categorie.imageUrl,fit: BoxFit.fitWidth,),
                   ),
                 ),
               ),

              // SizedBox(height: 10,),
               Text('Vous êtes sur le point de commander : ',
                 style:TextStyle(
                   fontSize: 20.0,
                   fontWeight: FontWeight.bold,
                   color: Colors.yellow.shade700,
                 ),),

               SizedBox(height:5.0,),

               Text(
                 widget.categorie.name,
                 style:TextStyle(
                   fontSize: 20.0,
                   fontWeight: FontWeight.bold,
                   color: Colors.yellow.shade700,
                 ),),

               SizedBox(height:10.0,),

               Padding(
                 padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text(
                       'Vers :',
                       style:TextStyle(
                         fontSize: 20.0,
                         fontWeight: FontWeight.bold,
                         color: Colors.yellow.shade700,
                       ),),

                     if (_currentAddress != null) Text(
                       _currentAddress,style: TextStyle(fontSize: 17,color: Colors.white),
                     ),
                     FlatButton(
                       onPressed: () {
                         _getCurrentLocation();
                         //print(_currentPosition.latitude);

                       },
                       shape: new RoundedRectangleBorder(
                           borderRadius: new BorderRadius.circular(30.0)
                       ),
                       color: Colors.yellow.shade700,
                       child: Text("Get location",style: TextStyle(color: Colors.white),

                     ),
                     )],
                 ),
               ),

               // SizedBox(height:10.0,),

               // SizedBox(
               //   width: 250.0,
               //   height: 50.0,
               //   child: FlatButton(
               //       shape:  RoundedRectangleBorder(
               //           borderRadius:  BorderRadius.circular(30.0)
               //       ),
               //       child:  Text(
               //         'Choisir une autre destination',
               //         style: TextStyle(
               //             color: Colors.white,
               //             fontSize: 15.0,
               //           fontWeight: FontWeight.bold,
               //         ),
               //       ),
               //       color: Colors.yellow.shade700,
               //       onPressed: () {}
               //   ),
               // ),

               SizedBox(height:10.0,),

               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                 child: Row(
                   //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text(
                       'Pour :',
                       style:TextStyle(
                         fontSize: 20.0,
                         fontWeight: FontWeight.bold,
                         color: Colors.yellow.shade700,
                       ),),

                   ],
                 ),
               ),

               DateTimePicker(
                 type: DateTimePickerType.dateTimeSeparate,
                 dateMask: 'd MMM, yyyy',
                 initialValue: DateTime.now().toString(),
                 firstDate: DateTime(2000),
                 lastDate: DateTime(2100),
                 icon: Icon(Icons.event),
                 dateLabelText: 'Date',
                 timeLabelText: "Hour",
                 onChanged: (val) {
                   time = val + ':00';
                 //  print(val + ':00');

                 } ,
                 validator: (val) {
                 //  print(val);
                   return null;
                 },
                // onSaved: (val) => print( "je suis la " + val),
               ),

               //SizedBox(height: 10.0 ,),

               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,

                   children: [
                     Text(
                       'Quantité',
                       style: TextStyle(
                           color: Colors.yellow.shade700,
                           fontSize: 20.0
                       ),
                     ),

                     RawMaterialButton(
                         onPressed: () {

                         },
                        // elevation: 2.0,
                         fillColor: Colors.black45,
                         padding: EdgeInsets.all(10.0),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20.0),
                             side: BorderSide(color:  Colors.yellow.shade700)),
                         child:Text(
                            '$cont',
                           style: TextStyle(
                               color: Colors.white,
                               fontSize: 20.0
                           ),
                         )
                     ),
                     RawMaterialButton(
                       onPressed: () {
                         setState(() {
                           cont = cont + 1;
                         });
                       },
                       elevation: 2.0,
                       fillColor: Colors.black45,
                       padding: EdgeInsets.all(5.0),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20.0),
                           side: BorderSide(color: Colors.yellow.shade700)),
                       child: Icon(Icons.add,
                         size: 35.0,
                         color: Colors.white70,),
                     ),

                     RawMaterialButton(
                       onPressed: () {
                         setState(() {
                           cont = cont - 1;
                         });

                       },
                       elevation: 2.0,
                       fillColor: Colors.black45,
                       padding: EdgeInsets.all(5.0),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20.0),
                           side: BorderSide(color: Colors.yellow.shade700)),
                       child: Icon(Icons.remove,
                         size: 35.0,
                         color: Colors.white70,),
                     ),
                   ],
                 ),
               ),

               ClipRRect(
                 borderRadius:BorderRadius.circular(15.0) ,
                 child: Container(
                   color: Colors.white,
                   width: 320,
                   padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                   child:DropdownButton(
                     hint: Text('Choisir une méthode de paiment'),
                     value: _selectedMode,
                     onChanged: (newValue) {
                       setState(() {
                         _selectedMode = newValue;
                       });
                     },
                     items: _Mode_paiment.map((_Mode_paiment) {
                       return DropdownMenuItem(
                         child: new Text(_Mode_paiment),
                         value: _Mode_paiment,
                       );
                     }).toList(),
                   ),
                 ),
               ),

               // SizedBox(
               //   width: 300.0,
               //   height: 60.0,
               //   child: FlatButton(
               //       shape:  RoundedRectangleBorder(
               //           borderRadius:  BorderRadius.circular(30.0)
               //       ),
               //       child:  Center(
               //         child: Text(
               //           'Choisir une autre méthode de paiment',
               //           style: TextStyle(
               //               color: Colors.white,
               //               fontWeight: FontWeight.bold,
               //               fontSize: 15.0
               //           ),
               //         ),
               //       ),
               //       color: Colors.yellow.shade700,
               //       onPressed: () {}
               //   ),
               // ),

               SizedBox(
                 height: 20.0,
               ),


               Padding(
                 padding: const EdgeInsets.fromLTRB(20.0,10,20,0.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [

                     SizedBox(
                        width: 120.0,
                       height: 50.0,
                       child: FlatButton(
                           shape: new RoundedRectangleBorder(
                               borderRadius: new BorderRadius.circular(30.0)
                           ),
                           child:  Text(
                             'Annuler',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 20.0
                             ),
                           ),
                           color: Colors.red,
                           onPressed: () {
                             Navigator.pop(context);

                           }
                       ),
                     ),

                     SizedBox(
                       // width: 50.0,
                       height: 50.0,
                       child: FlatButton(
                           shape: new RoundedRectangleBorder(
                               borderRadius: new BorderRadius.circular(30.0)
                           ),
                           child: const Text(
                             'Confirmer',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 20.0
                             ),
                           ),
                           color: Colors.yellow.shade700,
                           onPressed: () async {
                             var email= await read('email');

                            if(time != null && _currentPosition != null ){
                              var result = await Commander(
                                  email:email,
                                  quantite: cont.toString(),
                                  adresse: _locationController.text,
                                  id_plat: widget.categorie.id,
                                  id_restaurant: widget.categorie.id_resto,
                                  time: time,
                                  methode: _selectedMode,
                                  latitude: _currentPosition.latitude.toString(),
                                  longitude: _currentPosition.longitude.toString(),
                                  adress:_currentAddress,
                              );
                              if (result['statusCode'] == 201){
                                Toast.show(
                                  'vous commande est validé',context,backgroundColor: Colors.green,duration:5,);
                                PanierMethode.deletePlat(widget.categorie.id);
                                Navigator.pop(context);
                              }
                            } else {
                              Toast.show(
                                'Veuillez vérifier vos champs SVP !! ', context,
                                backgroundColor: Colors.red, duration: 5,);
                            }



                           }
                       ),
                     ),
                   ],
                 ),
               )




             ],
           ),
           ]
         ) ,
      ),
    );
  }

  _getAddressFromLatLng() async {
    try {
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude
      );

      geo.Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()
      ..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }
}

