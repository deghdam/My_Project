import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/Screen/categorie_gest.dart';
import 'package:flutter_app/Gestionnaire/widget/categoie_gest_vertical.dart';
import 'package:flutter_app/model/categorie_model.dart';
  // import 'package:flutter_app/Screen/categorie_screen.dart';
  //  import 'package:flutter_app/Widget/categorie_vertical.dart';

class CategorieGestCr extends StatelessWidget {
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
                        builder: (_) => CategorieGVer()
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
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (_) => CategorieGest(
                          categorie : categories[index],
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
                        Hero(
                          tag : categories[index].imageUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 210.0,
                              width: 240.0,
                              image: AssetImage(categories[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 210,
                          child: Center(
                            child: Text(
                              categories[index].type,
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
        )

      ],
    );
  }
}