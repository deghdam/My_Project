import 'package:flutter/material.dart';
import 'package:flutter_app/model/categorie_model.dart';
import 'package:flutter_app/Screen/categorie_screen.dart';
import 'package:flutter_app/Screen/lastscreencat.dart';



class CategorieVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Categorie',
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
        elevation: 0,
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
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              Categorie categorie = categories[index];
              return GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (_) => CategorieScreen(
                          categorie : categorie,
                        )
                    )),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Container(
                    //width: 250.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Hero(
                          tag : categorie.imageUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 200.0,
                              width: 400.0,
                              image: AssetImage(categorie.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 390,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.5),
                                  blurRadius: 8.0,
                                  spreadRadius: 3.0,
                              offset: Offset(
                                2.0,
                                2.0,
                              ),
                              )
                            ]
                          ),

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,10.0,0.0,0.0),
                            child: Text(
                              categorie.type,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
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
        ),

    );
  }
}
