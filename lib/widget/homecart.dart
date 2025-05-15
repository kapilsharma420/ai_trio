import 'package:ai_trio/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Homecart extends StatelessWidget {
  final HomeType homeType;
  const Homecart({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    //for developing purpose
    Animate.restartOnHotReload = true;

    return Card(
      color: Colors.blue.withOpacity(.2),
      elevation: 0,
      margin: EdgeInsets.only(bottom: Get.height * 0.02),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child:
         InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          onTap: () => homeType.onTap(),
          child:  homeType.leftAlign
              ? Row(
                children: [
                  //lottie animation
                  Container(
                    width: Get.width * 0.35,
                    child: Padding(
                      padding: homeType.padding,
                      child: Lottie.asset(
                        'assets/LottieAnimation/${homeType.lottie}',
                      ),
                    ),
                  ),
                  //for some space
                  Spacer(),
                  //title
                  Text(
                    homeType.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                  //fore some space
                  Spacer(flex: 2),
                ],
              )
              : Row(
                children: [
                  //for some space
                  Spacer(flex: 2),
                  //title
                  Text(
                    homeType.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                  //for  some space
                  Spacer(),
    
                  //lottie animation
                  Container(
                    width: Get.width * 0.35,
                    child: Padding(
                      padding: homeType.padding,
                      child: Lottie.asset(
                        'assets/LottieAnimation/${homeType.lottie}',
                      ),
                    ),
                  ),
                ],
              ),)
       ).animate().fade(begin: 0.0, end: 1.0, duration: 2000.ms).scale(curve: Curves.easeInOut);

  }
}
