// import 'package:camera/camera.dart';
// import 'package:tflite/tflite.dart';

// class ClassificationHelper {
//   Future<void> tfLiteInit() async {
//     await Tflite.loadModel(
//       model: "assets/models/leaf_model.tflite",
//       labels: "assets/models/labels.txt",
//     );
//   }

//   classifyImage(XFile image) async {
//     var recognitions = await Tflite.runModelOnImage(
//       path: image.path,
//       imageMean: 0.0,
//       imageStd: 255.0,
//       numResults: 3,
//       threshold: 0.5,
//       asynch: true,
//     );

//     var label = recognitions?[0]['label'].toString();
//     print(label);
//     return label;
//   }
// }
