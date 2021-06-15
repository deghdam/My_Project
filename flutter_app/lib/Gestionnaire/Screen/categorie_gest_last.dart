import 'package:flutter/material.dart';
import 'package:flutter_app/Gestionnaire/home_Ges.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/categorie_model.dart';



class LastScrGest extends StatefulWidget {
  final Categorie categorie;
  int value;
   LastScrGest({result,this.categorie,this.value});

  @override
  _LastScrGestState createState() => _LastScrGestState();
}

class _LastScrGestState extends State<LastScrGest> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    builder: (_) =>HomeGest()
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
                image: AssetImage("assets/background_gest.png"),
                fit: BoxFit.cover
            )),
        child: Column(
          children: [
            SizedBox(height: 80.0,),
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

            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                width: 300,
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

            SizedBox(height: 30,),

            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                width: 300,
                height: 70,
                color: Colors.black45,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Prix :  ',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),

                      Text(
                        widget.categorie.prix + ' DA',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }
}
