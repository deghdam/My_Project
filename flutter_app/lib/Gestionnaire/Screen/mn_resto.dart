import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/Screen/mes_plat_gest.dart';
import 'package:flutter_app/Gestionnaire/Screen/modifier_restaurant.dart';
import 'package:flutter_app/Providers/restaurent.dart';
import 'package:flutter_app/model/restaurent_model.dart';

import '../../http.dart';
class MonResto extends StatefulWidget {
 // Restaurent restaurent;

  int id;
   MonResto({ this.id,
   //  this.restaurent
   });

  @override
  _MonRestoState createState() => _MonRestoState();
}

class _MonRestoState extends State<MonResto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Mon Restaurent',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.yellow.shade700,
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
                image: AssetImage("assets/background_gest.png"),
                fit: BoxFit.cover
            )),

        child: FutureBuilder<List<Restaurent>>(
            future: FetchMonResto(id: widget.id),
            builder: (context,snapchat)
            {
              if(snapchat.hasData){
                return ListView.builder(
                  itemCount:snapchat.data.length ,

                  itemBuilder:(context, int index) {
                    Restaurent restaurant = snapchat.data[index];
                    return Column(
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child:Image.network(
                                  imagesUrl + restaurant.imageUrl,
                                  fit: BoxFit.fitWidth,
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      restaurant.location,
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      restaurant.Horaire,
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

                        SizedBox(height: 15.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => MesPlatGest(
                                          id: widget.id,
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
                                          'Mes Plats',
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
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        restaurant.raiting + '⭐',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0,),


                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ModifierRest(
                                      restaurent : restaurant,
                                      id: widget.id,
                                    )));
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child:Container(
                                color:Colors.yellow.shade700,
                                width: 250,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Modifier information',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ),
                      ],

                    );

                  } ,

                );
              }
              else
                // print(FetchMonResto(id: widget.id));
                return Container();




            },
        ),
      ),
    );
  }
}

