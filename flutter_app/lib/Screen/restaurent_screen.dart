import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screen/nosplat.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/restaurent_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurentScreen extends StatefulWidget {
  final Restaurent restaurent;
  RestaurentScreen({this.restaurent});

  @override
  _RestaurentScreenState createState() => _RestaurentScreenState();
}

class _RestaurentScreenState extends State<RestaurentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Hero(
          tag:widget.restaurent.name ,
          child: Text(
            widget.restaurent.name,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.yellow.shade700,
            ),
          ),
        ),
        iconTheme: IconThemeData(
            color: Colors.yellow.shade700
        ),
        backgroundColor: Color(0x44000000),
        elevation: 10,
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

        child: Column(
          children:
          [
            Stack(
              children: [
                Container(
                  height: 240.0,
                  width: 600.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 2.0,
                        ),
                      ]),
                  child: Hero(
                    tag: widget.restaurent.imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child:Image.network(
                        imagesUrl + widget.restaurent.imageUrl,fit: BoxFit.fitWidth,),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
               children: [
                 Icon(Icons.location_on,
                 size: 25.0,
                   color: Colors.white,
                 ),

                 SizedBox(width: 10.0),

                 Text('Location',
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.w400,
                   color:Colors.white
                 ),)
               ],

              ),
            ),
            Padding(
              padding:  EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child:Container(
                  color:Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                    child: Hero(
                      tag: widget.restaurent.location,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.restaurent.location,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.access_time_sharp,
                    size: 25.0,
                    color: Colors.white,
                  ),

                  SizedBox(width: 10.0),

                  Text('Horaire',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color:Colors.white
                    ),)
                ],

              ),
            ),

            Padding(
              padding:  EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child:Container(
                    color:Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                      child: Hero(
                        tag: widget.restaurent.Horaire,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            widget.restaurent.Horaire,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ),

            SizedBox(height: 15.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => NosPlat (
                              id: widget.restaurent.id,
                            )));
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child:Container(
                        color:Colors.black54,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Nos Plats',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                ),

                ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child:Container(
                      color:Colors.black54,
                      child: Hero(
                        tag:widget.restaurent.raiting,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              widget.restaurent.raiting + '⭐',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
            SizedBox(height: 20.0,),

            Center(
              child: Text(
                'Laissez une Note',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
              )
              ),
            ),

            SizedBox(height: 10.0,),

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
                  onRatingUpdate: (rating) {
                   print(rating);
                   },
               ),

            SizedBox(height: 20.0,),

            ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child:Container(
                  color:Colors.yellow.shade700,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.phone,
                        size: 25,
                        color: Colors.white,),
                        Text(
                          'Contact',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ),






          ],

        ),
      ),
    );
  }
}


