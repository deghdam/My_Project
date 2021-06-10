import 'package:flutter/material.dart';
import 'package:flutter_app/model/categorie_model.dart';
import 'package:flutter_app/Screen/categorie_screen.dart';

import '../http.dart';

class PanierScreen extends StatefulWidget {
  final Categorie categorie;
  int value;
  PanierScreen({this.categorie,this.value});

  @override
  _PanierScreenState createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {
  int cont = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: Text(
          'Mon Panier',
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
        elevation: 4,
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
         child:Column(
           children: [
            // SizedBox(height: 20.0,),
             Container(
               height: 240.0,
               width: 500.0,
               child: Hero(
                 tag: widget.categorie.imageUrl,
                 child: Image.network(
                     imagesUrl + widget.categorie.imageUrl,fit: BoxFit.fitWidth,),
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

                   SizedBox(
                     width: 210.0,
                     height: 50.0,
                     child: FlatButton(
                         shape:  RoundedRectangleBorder(
                             borderRadius:  BorderRadius.circular(30.0)
                         ),
                         child:  Text(
                           'Nouvelle Ville Ali Mendjeli',
                           style: TextStyle(
                               color: Colors.white,
                               fontSize: 12.0
                           ),
                         ),
                         color: Colors.black45,
                         onPressed: () {}
                     ),
                   ),
                 ],
               ),
             ),

             SizedBox(height:10.0,),

             SizedBox(
               width: 250.0,
               height: 50.0,
               child: FlatButton(
                   shape:  RoundedRectangleBorder(
                       borderRadius:  BorderRadius.circular(30.0)
                   ),
                   child:  Text(
                     'Choisir une autre destination',
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 15.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   color: Colors.yellow.shade700,
                   onPressed: () {}
               ),
             ),

             SizedBox(height:10.0,),

             Padding(
               padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Text(
                     'Pour :',
                     style:TextStyle(
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.yellow.shade700,
                     ),),

                   SizedBox(
                     width: 210.0,
                     height: 50.0,
                     child: FlatButton(
                         shape:  RoundedRectangleBorder(
                             borderRadius:  BorderRadius.circular(30.0)
                         ),
                         child:  Text(
                           '28/05/21 à 20:00',
                           style: TextStyle(
                               color: Colors.white,
                               fontSize: 15.0
                           ),
                         ),
                         color: Colors.black45,
                         onPressed: () {}
                     ),
                   ),
                 ],
               ),
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

             SizedBox(
               width: 300.0,
               height: 60.0,
               child: FlatButton(
                   shape:  RoundedRectangleBorder(
                       borderRadius:  BorderRadius.circular(30.0)
                   ),
                   child:  Center(
                     child: Text(
                       'Choisir une autre méthode de paiment',
                       style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 15.0
                       ),
                     ),
                   ),
                   color: Colors.yellow.shade700,
                   onPressed: () {}
               ),
             ),

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
                         onPressed: () {

                         }
                     ),
                   ),
                 ],
               ),
             )




           ],
         ) ,
      ),
    );
  }
}

