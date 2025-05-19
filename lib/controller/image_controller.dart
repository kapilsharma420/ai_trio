import 'dart:convert';
import 'dart:developer';
import 'package:ai_trio/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

/// Status enum to track the image generation state
enum Status { none, loading, complete, error }

/// Controller class to handle image generation using Vyro.ai API
class ImageController extends GetxController {
  /// Text controller for the prompt input
  final textC = TextEditingController();

  /// Observable status of the image generation process
  final status = Status.none.obs;

  /// Base64 encoded image data
  String base64Image = '';

  /// Error message for API errors
  String? errorMessage;

  final _apiKey = ImagineArtApiKey;

  static const String _apiUrl = 'https://api.vyro.ai/v2/image/generations';

  /// Generates an image using Vyro.ai API
  /// Returns the image as base64 encoded string
  Future<void> createImage() async {
    final userInput = textC.text.trim();

    if (userInput.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter a prompt",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
      );
      return;
    }

    status.value = Status.loading;
    errorMessage = null;
    base64Image = '';

    try {
      log("Starting image generation with prompt: $userInput");

      // Create multipart request as per Imagine.art API docs
      var request = http.MultipartRequest('POST', Uri.parse(_apiUrl));

      // Add headers exactly as shown in the API docs
      request.headers.addAll({'Authorization': 'Bearer $_apiKey'});

      // Add fields exactly as shown in the API docs
      request.fields.addAll({
        'prompt': userInput,
        'style': 'realistic', // Adding style parameter as per API docs
        'aspect_ratio': '1:1',
      });

      log("Sending request to Imagine.art API...");
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      log("Response status: ${response.statusCode}");
      log("Response headers: ${response.headers}");

      if (response.statusCode == 200) {
        // The API returns the image directly as binary data
        final bytes = response.bodyBytes;
        if (bytes.isNotEmpty) {
          // Convert the image bytes to base64
          base64Image = base64Encode(bytes);
          log("Successfully encoded image to base64: ${bytes.length} bytes");
          status.value = Status.complete;
          textC.clear();
        } else {
          throw Exception("Empty image received");
        }
      } else {
        log("API Error: ${response.statusCode} - ${response.reasonPhrase}");
        log("Error response body: ${response.body}");

        // Try to parse error message if it's JSON
        try {
          final errorJson = jsonDecode(response.body);
          final errorMsg =
              errorJson['error'] ??
              errorJson['message'] ??
              response.reasonPhrase;
          throw Exception("API Error: $errorMsg");
        } catch (e) {
          throw Exception(
            "API Error: ${response.reasonPhrase ?? 'Unknown error'}",
          );
        }
      }
    } catch (e) {
      log("Image generation error details: ${e.toString()}");
      errorMessage = e.toString();
      status.value = Status.error;
      Get.snackbar(
        "Error",
        errorMessage!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
      );
    }
  }

  void resetState() {
    status.value = Status.none;
    errorMessage = null;
    base64Image = '';
    textC.clear();
  }

  @override
  void onClose() {
    textC.dispose();
    super.onClose();
  }
}
