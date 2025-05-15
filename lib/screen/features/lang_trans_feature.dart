import 'package:flutter/material.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot Feature'),
      ),
      body: Center(
        child: Text(
          'This is the Translator Feature Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}