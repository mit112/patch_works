import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {

  final latitude;
  final longitude;
  GoogleMapScreen({this.latitude, this.longitude});


  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMapScreen> {

  Set<Marker> _marker = {};

  void _onMapCreated(GoogleMapController controller) {
    if (widget.latitude && widget.longitude) {
      setState(() {
        _marker.add(Marker(markerId:  MarkerId('1'), position: LatLng(widget.latitude, widget.longitude),));
        print(widget.latitude);
        print('-' * 80);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(initialCameraPosition: CameraPosition(
        target: LatLng(widget.latitude ?? 22.5, widget.longitude ?? 88.5),
        zoom: 15,
       ),
        onMapCreated: _onMapCreated,
        markers: _marker,
      ),
    );
  }
}
