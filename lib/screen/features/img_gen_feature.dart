import 'package:flutter/material.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Feature'),
      ),
      body: Center(
        child: Text(
          'This is the Image Feature Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}