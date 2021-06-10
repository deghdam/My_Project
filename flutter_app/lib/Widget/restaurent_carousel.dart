import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/restaurent.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/restaurent_model.dart';
import 'package:flutter_app/Screen/restaurent_screen.dart';
import 'package:flutter_app/Widget/retaurent_vertical.dart';

class RestaurentCraousel extends StatelessWidget {
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
                'Restaurant',
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.yellow.shade700,
                    letterSpacing: 1.5),
              ),

              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (_) => RestaurentVertical()
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
          child: FutureBuilder<List<Restaurent>>(
            future: FetchResto(),
            builder: (context, snapchat) {
              if (snapchat.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapchat.data.length,
                  itemBuilder: (BuildContext context, int index) {

                    Restaurent restaurent = snapchat.data[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(
                              builder: (_) => RestaurentScreen(
                                restaurent : restaurent,
                              )
                          )),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        child: Container(
                          width: 250.0,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              Hero(
                                tag : restaurent.imageUrl,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child:Image.network(
                                    imagesUrl + restaurent.imageUrl,
                                    height: 200,
                                    width: 390,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 210,
                                child: Center(
                                  child: Text(
                                    restaurent.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
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
                );
              }
              else return Container();
            },

          )
        )

      ],
    );
  }
}

