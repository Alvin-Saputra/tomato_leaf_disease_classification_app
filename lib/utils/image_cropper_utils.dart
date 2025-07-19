import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

Future<File?> cropImage(File imageFile) async {
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: imageFile.path,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.green,
        toolbarWidgetColor: Colors.white,
        lockAspectRatio: true, // Kunci aspect ratio
        aspectRatioPresets: [
          CropAspectRatioPreset.square, // Hanya square
        ],
        initAspectRatio: CropAspectRatioPreset.square, // Set default ke square
        hideBottomControls: false,
        showCropGrid: true,
      ),
    ],
  );

  if (croppedFile != null) {
    return File(croppedFile.path);
  } else {
    return null;
  }
}
