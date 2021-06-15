import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/restaurent.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/restaurent_model.dart';
import 'package:flutter_app/Screen/restaurent_screen.dart';



class RestaurentVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Restaurant',
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
        child:Container(
            height: 260.0,
            child: FutureBuilder<List<Restaurent>>(
              future: FetchResto(),
              builder: (context, snapchat) {
                if (snapchat.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
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
                        child:Container(
                          margin: EdgeInsets.all(10.0),
                          child: Container(
                            //width: 250.0,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                Hero(
                                  tag : restaurent.imageUrl,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child:  Image.network(
                                      imagesUrl + restaurent.imageUrl,
                                      height: 200,
                                      width: 390,
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
                                      restaurent.name,
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
                  );
                }
                else return Container(child: Center(child: CircularProgressIndicator(color: Colors.white,),),);
              },

            )
        )
      ),

    );
  }
}



