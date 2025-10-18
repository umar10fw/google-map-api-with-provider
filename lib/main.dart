import 'package:flutter/material.dart';
import 'package:nextgen_maps/provider/map_provider.dart';
import 'package:provider/provider.dart';
import 'view/screen/map_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NextGenMapsApp());
}

class NextGenMapsApp extends StatelessWidget {
  const NextGenMapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapProvider(),
      child: MaterialApp(
        title: 'NextGen Maps App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const MapScreen(),
        routes: {
          MapScreen.routeName: (ctx) => const MapScreen(),
        },
      ),
    );
  }
}
