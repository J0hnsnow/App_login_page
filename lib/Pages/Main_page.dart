// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, non_constant_identifier_names, unnecessary_null_comparison
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Order A Nduthi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: MapScreen());
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-1.227841, 36.905729),
    zoom: 3.7,
  );

  late GoogleMapController _googleMapController;
  late Marker _origin;
  late Marker _destination;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var onPressed2 = (() => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: _origin.position,
                  zoom: 3.5,
                  tilt: 50.0,
                ),
              ),
            ),
            style: TextButton.styleFrom(
              primary: Colors.green,
              textstyle: const TextStyle(fintWeight: Fontweight.w600),
            )
          );
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Google Maps'),
        actions: [
          // ignore: unnecessary_null_comparison
          if (_origin != null)
          TextButton(
            onPressed:onPressed2,
        child: const Text('ORIGIN'),
        ),

         if(_destination != null)
          TextButton(
            onPressed:(() => _googleMapController.animateCamera (
              CameraUpdate.newCameraPosition(
                CameraPosition (
                  target: _destination.position,
                  zoom: 3.5,
                  tilt: 50.0,
                ),
              ),
            ),
            style: TextButton.styleFrom(
              primary: Colors.yellow,
              textstyle: const TextStyle(fintWeight: Fontweight.w600),
            ),
          ),
        child: const Text('BIKE'),
          )
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: {
          if (_origin != null) _origin,
          if (_destination != null) _destination
        },
        onLongPress: _addMarker,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  void _addMarker(LatLng pos) {
    if (_origin == null || (_origin != null && _destination != null)) {
      //Origin is not set OR Origin/Destination are both set
      //Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
          position: pos,
        );
      });
    } else {
      //Origin is already set
      //Set destination
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
      });
    }
  }
}
