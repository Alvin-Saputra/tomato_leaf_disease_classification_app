import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:leaf_disease_classification_app/view/screens/home_screen.dart';
import 'package:leaf_disease_classification_app/view/screens/leaf_disease_list_screen.dart';

  late CameraDescription firstCamera;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  firstCamera = cameras.first;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.greenAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: HomeScreen(camera: firstCamera),
    );
  }
}


