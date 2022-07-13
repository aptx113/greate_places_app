import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
    this.initialLocation = const PlaceLocation(
        latitude: 37.422, longitude: -122.084, address: null),
    this.isSelecting = false,
  }) : super(key: key);

  final PlaceLocation initialLocation;
  final bool isSelecting;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLocation.latitude,
              widget.initialLocation.longitude),
              zoom: 16
        ),
      ),
    );
  }
}
