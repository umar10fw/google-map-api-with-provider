import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServicePoint {
  final String id;
  final String title;
  final double lat;
  final double lng;

  ServicePoint({
    required this.id,
    required this.title,
    required this.lat,
    required this.lng,
  });

  LatLng get position => LatLng(lat, lng);
}

final List<ServicePoint> kServicePoints = [
  ServicePoint(id: 'lahore_1', title: 'Liberty Market', lat: 31.5165, lng: 74.3587),
  ServicePoint(id: 'lahore_2', title: 'Model Town Park', lat: 31.4753, lng: 74.3307),
  ServicePoint(id: 'lahore_3', title: 'Emporium Mall', lat: 31.4707, lng: 74.2728),
  ServicePoint(id: 'lahore_4', title: 'Packages Mall', lat: 31.4672, lng: 74.3574),
  ServicePoint(id: 'lahore_5', title: 'MM Alam Road', lat: 31.5100, lng: 74.3482),
  ServicePoint(id: 'karachi_1', title: 'Clifton Beach', lat: 24.8042, lng: 67.0221),
  ServicePoint(id: 'karachi_2', title: 'Dolmen Mall Clifton', lat: 24.8120, lng: 67.0281),
  ServicePoint(id: 'karachi_3', title: 'LuckyOne Mall', lat: 24.9384, lng: 67.0915),
  ServicePoint(id: 'karachi_4', title: 'Mazar-e-Quaid', lat: 24.8730, lng: 67.0414),
  ServicePoint(id: 'karachi_5', title: 'Karachi Zoo', lat: 24.8734, lng: 67.0308),
  ServicePoint(id: 'islamabad_1', title: 'Faisal Mosque', lat: 33.7294, lng: 73.0379),
  ServicePoint(id: 'islamabad_2', title: 'Centaurus Mall', lat: 33.7070, lng: 73.0488),
  ServicePoint(id: 'islamabad_3', title: 'Daman-e-Koh', lat: 33.7515, lng: 73.0551),
  ServicePoint(id: 'islamabad_4', title: 'Pakistan Monument', lat: 33.6938, lng: 73.0652),
  ServicePoint(id: 'islamabad_5', title: 'Rawal Lake', lat: 33.6931, lng: 73.1189),
  ServicePoint(id: 'faisalabad_1', title: 'Clock Tower (Ghanta Ghar)', lat: 31.4180, lng: 73.0790),
  ServicePoint(id: 'faisalabad_2', title: 'Lyallpur Galleria', lat: 31.4043, lng: 73.1098),
  ServicePoint(id: 'faisalabad_3', title: 'D-Ground Market', lat: 31.4082, lng: 73.1118),
  ServicePoint(id: 'faisalabad_4', title: 'Chenab Club', lat: 31.4080, lng: 73.0942),
  ServicePoint(id: 'faisalabad_5', title: 'University of Agriculture', lat: 31.4311, lng: 73.0693),
  ServicePoint(id: 'multan_1', title: 'Bahauddin Zakariya University', lat: 30.2709, lng: 71.4934),
  ServicePoint(id: 'multan_2', title: 'Multan Fort', lat: 30.1975, lng: 71.4755),
  ServicePoint(id: 'multan_3', title: 'Hussain Agahi Market', lat: 30.1953, lng: 71.4752),
  ServicePoint(id: 'multan_4', title: 'Shah Rukn-e-Alam Shrine', lat: 30.1963, lng: 71.4684),
  ServicePoint(id: 'multan_5', title: 'ChenOne Tower', lat: 30.2188, lng: 71.4750),
  ServicePoint(id: 'bahawalpur_1', title: 'Noor Mahal', lat: 29.3953, lng: 71.6834),
  ServicePoint(id: 'bahawalpur_2', title: 'Bahawalpur Zoo', lat: 29.3958, lng: 71.6861),
  ServicePoint(id: 'bahawalpur_3', title: 'Darbar Mahal', lat: 29.4041, lng: 71.6765),
  ServicePoint(id: 'bahawalpur_4', title: 'Sadiq Public School', lat: 29.3823, lng: 71.7219),
  ServicePoint(id: 'bahawalpur_5', title: 'Central Library', lat: 29.3928, lng: 71.6820),
];
