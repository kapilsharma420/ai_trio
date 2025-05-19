import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          shape: StadiumBorder(),
          elevation: 0,
          backgroundColor: Colors.blue,
          minimumSize: Size(Get.width * .4, 50),
        ),
      
        onPressed: onTap,
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
