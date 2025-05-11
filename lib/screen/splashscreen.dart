import 'package:ai_trio/helper/global.dart';
import 'package:ai_trio/screen/homescreen.dart';
import 'package:ai_trio/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing the size of device
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      //body
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            //for some space
            Spacer(flex: 2),
            //logo
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child: Image.asset(
                  'assets/images/SS_pic.png',
                  width: mq.width * .4,
                ),
              ),
            ),
            //for some space
            Spacer(),
            //lottie animation loading
            CustomLoading(),
            //for some space again
            Spacer(),
          ],
        ),
      ),
    );
  }
}
