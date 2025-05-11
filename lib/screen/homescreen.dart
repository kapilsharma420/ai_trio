import 'package:ai_trio/helper/global.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    //initializing the size of device
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Text('welcome to home screen ')
      ),
    );
  }
}
