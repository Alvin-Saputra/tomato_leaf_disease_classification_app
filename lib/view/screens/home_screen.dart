import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:leaf_disease_classification_app/view/components/result_card.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.camera, super.key});

  final CameraDescription camera;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Stack(
            children: [
              // Camera preview sebagai background (layer paling bawah)
              Positioned.fill(child: CameraPreview(_controller)),

              // Result card di atas camera preview
              // Positioned(
              //   bottom: 20, // Jarak dari bawah layar
              //   left: 40,
              //   child: ResultCard(),
              // ),
              Align(
                alignment: Alignment.center,
                child: Lottie.asset("assets/animation/Scanner.json"),
              ),
              // Result card menggunakan Align untuk positioning
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ResultCard(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt),
                          label: Text(
                            "Take Photos",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
