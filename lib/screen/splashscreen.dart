import 'package:ai_trio/helper/pref.dart';
import 'package:ai_trio/screen/homescreen.dart';
import 'package:ai_trio/screen/onboarding_screen.dart';
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
    //function to check if onboarding is done or not
    _checkOnboarding();
  }

  Future<void> _checkOnboarding() async {
    await Future.delayed(
      Duration(milliseconds: 2500),
    ); // Delay to show splash screen
    final done = await Prefs.isOnboardingDone(); // ✅ Check onboarding status

    // ✅ If onboarding is already done, go to HomeScreen
    // ✅ Else, show OnboardingScreen

    //navigate with getx

    Get.off(() => done ? Homescreen() : OnboardingScreen());
  }

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.all(Get.width * .05),
                child: Image.asset(
                  'assets/images/SS_pic.png',
                  width: Get.width * .4,
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
