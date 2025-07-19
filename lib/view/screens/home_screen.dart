import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:leaf_disease_classification_app/models/local/classification_helper.dart';
import 'package:leaf_disease_classification_app/models/remote/remote_classification_helper.dart';
import 'package:leaf_disease_classification_app/utils/image_cropper_utils.dart';
import 'package:leaf_disease_classification_app/view/components/result_card.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.camera, super.key});

  final CameraDescription camera;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isProcessing = false;

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

  // Future<String> takePhotoAndClassify() async {
  //   final XFile? image = await _controller!.takePicture();
  //   var result = "";
  //   if (image == null) {
  //     return "";
  //   } else {
  //     File? croppedImage = await cropImage(File(image!.path));
  //     if (croppedImage == null) {
  //       return "";
  //     } else {
  //       result = await RemoteClassificationHelper().classifyImage(croppedImage);
  //       return result;
  //     }
  //   }
  // }

  // Future<String> takePhotoAndClassify() async {
  //   final XFile? image = await _controller!.takePicture();
  //   var result = "";

  //   File? croppedImage = await cropImage(File(image!.path));
  //   result = await RemoteClassificationHelper().classifyImage(croppedImage!);
  //   return result;
  // }

  Future<String> takePhotoAndClassify() async {
    // Cegah multiple calls
    if (_isProcessing) {
      return "";
    }

    setState(() {
      _isProcessing = true;
    });

    try {
      final XFile? image = await _controller.takePicture();

      if (image == null) {
        return "";
      }

      // Tambahkan try-catch untuk proses cropping
      try {
        File? croppedImage = await cropImage(File(image.path));
        if (croppedImage == null) {
          return "";
        }

        String result = await RemoteClassificationHelper().classifyImage(
          croppedImage,
        );
        return result;
      } catch (e) {
        print("Error during cropping: $e");
        // Jika cropping gagal, gunakan gambar asli
        String result = await RemoteClassificationHelper().classifyImage(
          File(image.path),
        );
        return result;
      }
    } catch (e) {
      print("Error taking photo: $e");
      return "";
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) return;

    File? croppedImage = await cropImage(File(image.path));
    if (croppedImage == null) return;

    String result = await RemoteClassificationHelper().classifyImage(
      croppedImage,
    );
    print("result: $result");
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () async {
                                await takePhotoAndClassify();
                              },
                              icon: Icon(Icons.camera_alt),
                              label: Text(
                                "Take Photos",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await pickFromGallery();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(
                                  12,
                                ), // bisa disesuaikan
                                shape:
                                    const CircleBorder(), // opsional: biar tombol bulat
                              ),
                              child: const Icon(Icons.image),
                            ),
                          ],
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
