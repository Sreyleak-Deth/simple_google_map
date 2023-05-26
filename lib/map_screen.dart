
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}):super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  static const  currentLocation = LatLng(11.562108, 104.888535);
  late GoogleMapController mapController;
  Map<String, Marker> markers = {};

 late GoogleMapController googleMapController;

  @override
  void dispose(){
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition:const CameraPosition(
        target: currentLocation,
        zoom: 11.5
      ),
      onMapCreated: (controller) {
        mapController = controller;
        addMarker('location', currentLocation);
      },
      markers: markers.values.toSet(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 52, 225, 255),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        onPressed: (){},
        child: const Icon(Icons.center_focus_strong),

      ),
    );
  }

  addMarker(
    String id,
    LatLng location,
  ) async {
    // var markerIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/store.png');
    // var url = 'https://w7.pngwing.com/pngs/43/926/png-transparent-computer-icons-avatar-user-avatar-heroes-woman-silhouette.png';
    // var bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url)).buffer.asUint8List();

    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
        title: "phnom penh",
        snippet: "you're arrived phnom penh",
      ),
      // icon: markerIcon
      // icon: BitmapDescriptor.fromBytes(bytes)
    );

    markers[id] = marker;
    setState(() {});
  }
}
