import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/Plat.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/categorie_model.dart';
import 'package:flutter_app/Screen/categorie_screen.dart';
import 'package:flutter_app/Widget/categorie_vertical.dart';


class CategorieCarousel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [

              Text(
                'Categorie',
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.yellow.shade700,
                    letterSpacing: 1.5),
              ),

              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (_) => CategorieVertical()
                    )),
               child: Text(
                 'Voir Tout',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.yellow.shade700,
                       letterSpacing: 1.5
                  ),

               ),
              )
            ],
          ),
        ),

        Container(
          height: 260.0,
          child: FutureBuilder<List<Categorie>>(
            future:Fetchcategorie(),
            builder: (context, snapchat) {
              if(snapchat.hasData){
                return Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapchat.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Categorie categorie = snapchat.data[index] ;
                      return GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(
                                builder: (_) => CategorieScreen(
                                  categorie : categorie,
                                )
                            )
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          child: Container(
                            width: 250.0,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                   ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      imagesUrl + categorie.imageUrl,
                                      height: 200,
                                      width: 390,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                Positioned(
                                  top: 210,
                                  child: Center(
                                    child: Text(
                                      categorie.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      );
                    },
                  ),
                );
              }else return Container(child: Center(child: CircularProgressIndicator(color: Colors.white,),),);

            },
          )
        )

      ],
    );
  }
}



