import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      'assets/LottieAnimation/loading.json',
      width: 100,
    );
  }
}
