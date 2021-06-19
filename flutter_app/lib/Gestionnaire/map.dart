

import 'package:flutter/material.dart';
import 'package:flutter_app/model/commande.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Map extends StatefulWidget {
 List<Commande> commandes = [];
   Map({ this.commandes});

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  Set<Marker> markers = Set();
  static final LatLng _kMapCenter = LatLng(36.38126164801278, 6.611742452132429);

  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _kMapCenter, zoom: 100.0, tilt: 0, bearing: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _settState();
  }
  void _settState() {
    for (var i= 0; i < widget.commandes.length  ; i++){
      print('${widget.commandes[i].laltitude} ,${widget.commandes[i].longitude} ');
      markers.add( Marker(
        markerId: MarkerId(widget.commandes[i].id),
        infoWindow: InfoWindow(
          title: "${widget.commandes[i].nom}",
        ),
        position: LatLng(double.parse(widget.commandes[i].laltitude),double.parse(widget.commandes[i].longitude)),
      ));

    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
   // print(widget.commande.longitude);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Les Commandes sur Map',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.yellow.shade700,
        leading: BackButton(
          color: Colors.white,
        ),
        elevation: 0,
        bottomOpacity: 1.0,
      ),
      body: GoogleMap(
        initialCameraPosition:_kInitialPosition,
        markers: markers,

      ),
    );
  }

  // Set<Marker> _createMarker() {
  //   return {
  //     Marker(
  //         markerId: MarkerId("marker_1"),
  //         position: _kMapCenter,
  //         infoWindow: InfoWindow(title: 'Marker 1'),
  //         rotation: 90),
  //     Marker(
  //       markerId: MarkerId("marker_2"),
  //       position: LatLng(18.997962200185533, 72.8379758747611),
  //     ),
  //   };
  // }
}