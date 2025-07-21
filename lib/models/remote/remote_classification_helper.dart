import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class RemoteClassificationHelper {
  final Uri endpoint = Uri.parse("http://10.0.2.2:5000/classify-image");
  // final Uri endpoint = Uri.parse("https://2d02350ac173.ngrok-free.app/classify-image");

  Future<String> classifyImage(File image) async {
    // Buat multipart request
    var request = http.MultipartRequest('POST', endpoint);

    // Tambahkan file image dengan key 'image'
    request.files.add(
      await http.MultipartFile.fromPath(
        'image', // KEY harus sesuai dengan yang dipakai di Flask (`request.files['image']`)
        image.path,
      ),
    );

    // Kirim request
     var streamedResponse = await request.send().timeout(const Duration(seconds: 120));

    // Ambil response dari stream
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      // Jika response JSON, parse dan ambil hasil klasifikasinya
      var responseData = jsonDecode(response.body);
      return responseData['prediction'] ?? 'Unknown';
    } else {
      print("Error: ${response.body}");
      throw Exception("Failed to classify image");
    }
  }
}