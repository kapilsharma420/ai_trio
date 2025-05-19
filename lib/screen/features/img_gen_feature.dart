import 'dart:convert';

import 'package:ai_trio/controller/image_controller.dart';
import 'package:ai_trio/widget/custom_button.dart';
import 'package:ai_trio/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final ImageController _c = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Image Generator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * .04,
            vertical: Get.height * .02,
          ),
          children: [
            // Prompt input field
            TextFormField(
              controller: _c.textC,
              minLines: 2,
              maxLines: null,
              textAlign: TextAlign.center,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                hintText:
                    'Imagine something wonderful & innovative\nType here & I will create for you 😃',
                hintStyle: const TextStyle(fontSize: 14.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
            SizedBox(height: Get.height * .02),

            // AI Image display
            Container(
              height: Get.height * .5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              alignment: Alignment.center,
              child: Obx(() => _aiImage()),
            ),
            SizedBox(height: Get.height * .02),

            // Create button
            CustomButton(
              onTap: () {
                if (_c.textC.text.trim().isEmpty) {
                  Get.snackbar(
                    "Error",
                    "Please enter a prompt first",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red.shade100,
                  );
                  return;
                }
                _c.createImage();
              },
              text: 'Create Image',
            ),
          ],
        ),
      ),
    );
  }

  Widget _aiImage() {
    return switch (_c.status.value) {
      Status.none => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/LottieAnimation/ai_play.json',
            height: Get.height * .3,
            repeat: true,
          ),
          const SizedBox(height: 16),
          Text(
            'Enter a prompt to generate an image',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
          ),
        ],
      ),
      Status.loading => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLoading(),
            SizedBox(height: 16),
            Text(
              'Generating your image...',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
      Status.error => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red.shade400, size: 48),
            const SizedBox(height: 16),
            Text(
              _c.errorMessage ?? 'An error occurred',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red.shade400, fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _c.resetState,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade50,
                foregroundColor: Colors.red.shade400,
              ),
            ),
          ],
        ),
      ),
      Status.complete =>
        _c.base64Image.isNotEmpty
            ? ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(
                base64Decode(_c.base64Image),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.red.shade400,
                          size: 48,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Failed to load image: ${error.toString()}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red.shade400,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: _c.resetState,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Try Again'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade50,
                            foregroundColor: Colors.red.shade400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
            : const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_not_supported, color: Colors.grey, size: 48),
                  SizedBox(height: 16),
                  Text(
                    'No image generated',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
    };
  }
}
