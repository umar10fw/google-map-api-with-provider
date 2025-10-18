import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../view/screen/service_point_model/ServicePoint model.dart';

class MapProvider extends ChangeNotifier {

  final Completer<GoogleMapController> controller = Completer();
  final Set<Marker> _markers = {};
  LatLng? _currentLatLng;
  double _currentZoom = 12.0;

  Set<Marker> get markers => _markers;
  LatLng? get currentLatLng => _currentLatLng;
  double get zoom => _currentZoom;

  static const CameraPosition initialCamera = CameraPosition(
    target: LatLng(31.5204, 74.3587),
    zoom: 12,
  );

  // ---------- Initialization ----------
  Future<void> initMap() async {
    await _determinePosition();
    _addServiceMarkers();
    if (_currentLatLng != null) {
      _addOrUpdateUserMarker(_currentLatLng!);
      moveCamera(_currentLatLng!, zoom: 15);
    }
  }

  // ---------- Location ----------
  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    try {
      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _currentLatLng = LatLng(pos.latitude, pos.longitude);
      notifyListeners();
    } catch (e) {
      debugPrint('Error getting location: $e');
    }
  }

  // ---------- Markers ----------
  void _addServiceMarkers() {
    final Set<Marker> serviceMarkers = kServicePoints.map((s) {
      return Marker(
        markerId: MarkerId(s.id),
        position: s.position,
        infoWindow: InfoWindow(title: s.title),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
    }).toSet();

    _markers.removeWhere((m) => m.markerId.value.startsWith('svc'));
    _markers.addAll(serviceMarkers);
    notifyListeners();
  }

  void _addOrUpdateUserMarker(LatLng pos) {
    final userMarker = Marker(
      markerId: const MarkerId('user_marker'),
      position: pos,
      infoWindow: const InfoWindow(title: 'You are here'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    );

    _markers.removeWhere((m) => m.markerId.value == 'user_marker');
    _markers.add(userMarker);
    notifyListeners();
  }

  // ---------- Camera ----------
  Future<void> moveCamera(LatLng target, {double? zoom}) async {
    final mapController = await controller.future;
    final camera = CameraPosition(target: target, zoom: zoom ?? _currentZoom);
    mapController.animateCamera(CameraUpdate.newCameraPosition(camera));
  }

  Future<void> zoomIn() async {
    _currentZoom += 1;
    final mapController = await controller.future;
    mapController.animateCamera(CameraUpdate.zoomTo(_currentZoom));
  }

  Future<void> zoomOut() async {
    _currentZoom = (_currentZoom - 1).clamp(2.0, 20.0);
    final mapController = await controller.future;
    mapController.animateCamera(CameraUpdate.zoomTo(_currentZoom));
  }

  Future<void> recenter() async {
    await _determinePosition();
    if (_currentLatLng != null) {
      _addOrUpdateUserMarker(_currentLatLng!);
      await moveCamera(_currentLatLng!, zoom: 15);
    }
  }

  Future<void> refreshMarkers() async {
    _addServiceMarkers();
    if (_currentLatLng != null) _addOrUpdateUserMarker(_currentLatLng!);
    notifyListeners();
  }
}
