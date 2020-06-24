import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:restoner3/src/utils/DirectionsProvider.dart';

class MapaPage extends StatefulWidget {

  
  final LatLng polleria1 = LatLng(-11.9654076, -77.0576205);
  final LatLng polleria2 = LatLng(-11.9648358, -77.0597603);
  final LatLng polleria3 = LatLng(-11.9646133, -77.0583498);
  final LatLng polleria4 = LatLng(-11.9669991, -77.0567771);

  

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {

      return Scaffold(        
        
        body: Consumer<DirectionProvider>(
        builder: (BuildContext context, DirectionProvider api, Widget child) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(-11.965896  ,  -77.0577458),
              zoom: 14.4746,
            ),
            markers: _createMarkers(),
            polylines: api.currentRoute,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          );
        },
      ),
      );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();

    tmp.add(
      Marker(
        markerId: MarkerId("polleria1"),
        position: widget.polleria1,
        infoWindow: InfoWindow(title: "DonalChiken"),
      ),
    );
    tmp.add(
      Marker(
        markerId: MarkerId("polleria2"),
        position: widget.polleria2,
        infoWindow: InfoWindow(title: "Polleria El Gordo"),
      ),
    );
    tmp.add(
      Marker(
        markerId: MarkerId("polleria3"),
        position: widget.polleria3,
        infoWindow: InfoWindow(title: "Polleria Machís"),
      ),
    );
    tmp.add(
      Marker(
        markerId: MarkerId("polleria4"),
        position: widget.polleria4,
        infoWindow: InfoWindow(title: "Polleria El Sabor"),
      ),
    );
    return tmp;
  }

    void _onMapCreated(GoogleMapController controller) {
      _mapController = controller;

    /*   _centerView(); */
    }
}




