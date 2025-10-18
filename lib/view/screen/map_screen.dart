import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextgen_maps/provider/map_provider.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  static const routeName = '/map';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<MapProvider>(context, listen: false).initMap());
  }

  @override
  Widget build(BuildContext context) {
    final mapVM = Provider.of<MapProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Nearby Services')),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: MapProvider.initialCamera,
        onMapCreated: (GoogleMapController controller) =>
            mapVM.controller.complete(controller),
        myLocationEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
        rotateGesturesEnabled: true,
        tiltGesturesEnabled: true,
        markers: mapVM.markers,
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'recenter',
            onPressed: mapVM.recenter,
            tooltip: 'Recenter to my location',
            child: const Icon(Icons.my_location),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'zoom_in',
            onPressed: mapVM.zoomIn,
            tooltip: 'Zoom in',
            mini: true,
            child: const Icon(Icons.zoom_in),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'zoom_out',
            onPressed: mapVM.zoomOut,
            tooltip: 'Zoom out',
            mini: true,
            child: const Icon(Icons.zoom_out),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'refresh',
            onPressed: mapVM.refreshMarkers,
            tooltip: 'Refresh markers',
            mini: true,
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
