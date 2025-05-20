import 'package:ai_trio/model/home_type.dart';
import 'package:ai_trio/widget/homecart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final isDarkMode = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Assistant',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 1,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 12),
            icon: Icon(Icons.brightness_4_rounded, color: Colors.blue),
            onPressed: () {
              // Handle dark and light mode logic 
              isDarkMode.value = !isDarkMode.value;
              Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
              
             
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: Get.width*.04,vertical: Get.height*.015),
        children: 
          HomeType.values.map((e) => Homecart(homeType: e,)).toList(),
        
      )
    );
  }
}
