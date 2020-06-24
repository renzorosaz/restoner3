import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
/* import 'package:restoner3/src/models/place.dart'; */


class SearchPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
 /*    final placesProvider= Provider.of<Future<List<Place>>>(context); */

    return FutureProvider(
     /*    create: (context) => placesProvider , */
          child: Scaffold(
        body:(currentPosition != null )
            ? Stack(
          children: <Widget>[
             GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(currentPosition.latitude, currentPosition.longitude),
                  zoom: 16.0,
                ),
                zoomGesturesEnabled: true,
              ),
            
          ],
        ) : Center(
          child: CircularProgressIndicator(),
        )
      ),
    );
  }
}