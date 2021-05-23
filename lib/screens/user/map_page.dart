import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('map page'),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300.0,
            child: GoogleMap(
              // onMapCreated: (GoogleMapController controller) {
              //   _controller.complete(controller);
              // },
              mapType: MapType.normal,
              scrollGesturesEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(19.1726, 72.9425),
                zoom: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
