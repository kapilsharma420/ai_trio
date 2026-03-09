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
  final _apiKey = salabilityAI_API_KEY;
  static const String _apiUrl =
      'https://api.stability.ai/v1/generation/stable-diffusion-xl-1024-v1-0/text-to-image';

  Future<void> createImage() async {
    final prompt = textC.text.trim();
    if (prompt.isEmpty) return;

    status.value = Status.loading;
    base64Image = '';
    errorMessage = null;

    try {
      final response = await http.post(
        Uri.parse(
          'https://api.stability.ai/v1/generation/stable-diffusion-xl-1024-v1-0/text-to-image',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $salabilityAI_API_KEY',
        },
        body: jsonEncode({
          "text_prompts": [
            {"text": prompt},
          ],
          "cfg_scale": 7,
          "height": 1024,
          "width": 1024,
          "samples": 1,
          "steps": 30,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        base64Image = data['artifacts'][0]['base64'];
        status.value = Status.complete;
        textC.clear();
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      status.value = Status.error;
      errorMessage = e.toString();
      Get.snackbar(
        "Error",
        errorMessage!,
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
