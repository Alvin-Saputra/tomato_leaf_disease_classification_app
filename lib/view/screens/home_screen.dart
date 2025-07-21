import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:leaf_disease_classification_app/models/leaf.dart';
import 'package:leaf_disease_classification_app/models/local/classification_helper.dart';
import 'package:leaf_disease_classification_app/models/remote/remote_classification_helper.dart';
import 'package:leaf_disease_classification_app/utils/image_cropper_utils.dart';
import 'package:leaf_disease_classification_app/utils/show_message_helper.dart';
import 'package:leaf_disease_classification_app/view/components/result_card.dart';
import 'package:leaf_disease_classification_app/view/components/result_loading_card.dart';
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
  LeafDisease? predictionResult;
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

  Future<void> takePhotoAndClassify() async {
    // Cegah multiple calls
    if (_isProcessing) {
      return;
    }

    setState(() {
      _isProcessing = true;
    });

    final XFile? image = await _controller.takePicture();

    if (image == null) {
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    File? croppedImage = await cropImage(File(image.path));
    if (croppedImage == null) {
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    try {
      String result = await RemoteClassificationHelper().classifyImage(
        croppedImage,
      );
      predictionResult = await getLeafDiseaseData(result);
    } catch (e) {
      showMessage(context, e.toString());
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  Future<void> pickFromGallery() async {
    late String result;

    if (_isProcessing) {
      return;
    }
    setState(() {
      _isProcessing = true;
    });

    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) {
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    File? croppedImage = await cropImage(File(image.path));
    if (croppedImage == null) {
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    try {
      result = await RemoteClassificationHelper().classifyImage(croppedImage);
      predictionResult = await getLeafDiseaseData(result);
    } catch (e) {
      showMessage(context, e.toString());
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }

    print("result: $result");
  }

  Future<LeafDisease> getLeafDiseaseData(String predictionResult) async {
    LeafDisease? matchedDisease = listLeafDisease.firstWhere(
      (disease) => disease.id == predictionResult,
      orElse: () => LeafDisease(
        id: 'unknown',
        name: 'Unknown Disease',
        scientificName: '',
        description: 'Tidak ditemukan data penyakit untuk hasil prediksi ini.',
        imageAsset: [],
      ),
    );
    return matchedDisease;
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
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                        child: _isProcessing
                            ? ResultLoadinCard()
                            : (predictionResult != null)
                            ? ResultCard(
                                key: ValueKey('result'),
                                predictionResult!,
                              )
                            : SizedBox.shrink(key: ValueKey('empty')),
                      ),
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
