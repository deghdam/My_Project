import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/client.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/categorie_model.dart';
import 'package:flutter_app/Screen/home_screen.dart';
import 'package:flutter_app/Screen/panier.dar.dart';
import 'package:flutter_app/panie.dart';
import 'package:flutter_app/tools.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:toast/toast.dart';

class LastScreenCat extends StatefulWidget {
  final Categorie categorie;
  int value;

  LastScreenCat({this.categorie,this.value}) ;

  @override
  _LastScreenCatState createState() => _LastScreenCatState();
}

class _LastScreenCatState extends State<LastScreenCat> {
  String categ;

  @override
  Widget build(BuildContext context) {
    int value = widget.value;
     categ = widget.categorie.type;
    return Scaffold(
        extendBodyBehindAppBar: true,
     appBar: AppBar(

       title: Text(
         widget.categorie.name,
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
           onTap: () => Navigator.push(context,
             MaterialPageRoute(
                 builder: (_) =>HomeScreen()
             )),
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
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Background.png"),
                  fit: BoxFit.cover
              )),
          child: Column(
            children: [
              SizedBox(height: 60.0,),
              Stack(
                children: [
                  Container(
                    height: 240.0,
                    width: 600.0,
                    child: Hero(
                      tag: widget.categorie.imageUrl,
                      child: ClipRRect(
                       // borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          imagesUrl + widget.categorie.imageUrl,fit: BoxFit.fitWidth,),
                      ),
                    ),
                  ),
                ],
              ),

              //SizedBox(height: 10,),
              Text('Ingrédients',
                  style:TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,

                  ),),
              SizedBox(height: 10,),

              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  width: 340,
                  height: 100,
                  color: Colors.black45,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                    child:  Center(
                      child: Text(

                        widget.categorie.ingredien,
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      width: 200,
                      height: 70,
                      color: Colors.black45,
                      child: Center(
                        child: Text(
                          widget.categorie.nresto,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      width: 150,
                      height: 70,
                      color: Colors.black45,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Prix :',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),

                            Text(
                              widget.categorie.prix + ' DA',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],),

              SizedBox(height: 20,),

              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) async {
                  String email = await read('email');
                  var result = await psotRaitinplat(
                      email:email,
                      rating: rating.toString(),
                      id: widget.categorie.id
                  );
                  //  raiting = rating.toString();
                  // print(rating);
                  // print(widget.categorie.id);
                  // print(email);
                },
              ),

              SizedBox(height: 25,),

              SizedBox(
                width: 300.0,
                height: 60.0,
                child: FlatButton(
                    shape:  RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(30.0)
                    ),
                    child:  Text(
                      'Ajouter aux Panier',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                      ),
                    ),
                    color: Colors.black45,
                    onPressed: () {
                      PanierMethode.AddPlat(widget.categorie);
                      Toast.show(
                        'Vous avis Ajouter le plat au panier',context,backgroundColor: Colors.green,duration:5,);

                    }
                ),
              ),





            ],
          ),
        ),


    );
  }
}
