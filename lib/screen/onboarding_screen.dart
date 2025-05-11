import 'package:ai_trio/helper/global.dart';
import 'package:ai_trio/helper/pref.dart';
import 'package:ai_trio/model/onboard.dart';
import 'package:ai_trio/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      //onboarding 1
      Onboard(
        title: 'Ask me Anything',
        subtitle:
            'I can be your Best Friend & You can ask me anything & I will help you !',
        lottie: 'ai_ask_me',
      ),
      //onboarding 2
      Onboard(
        title: 'Imagination to Reality',
        subtitle:
            'Just tell me your imagination & I will make it a reality for you !',
        lottie: 'ai_play',
      ),
    ];
    return Scaffold(
      //body
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (context, index) {
          // this is done for the purpose of button text (next or finish )
          final islast = index == list.length - 1;
          return Column(
            children: [
              //lottie ai ask me animation
              LottieBuilder.asset(
                'assets/LottieAnimation/${list[index].lottie}.json',
                height: mq.height * .6,width: islast? mq.width*.7:null ,
              ),

              //title
              Text(
                list[index].title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  color: Colors.black,
                ),
              ),
              //for some space
              SizedBox(height: mq.height * .015),
              //subtitle
              SizedBox(
                width: mq.width * .7,
                child: Text(
                  list[index].subtitle,

                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: .5,
                    color: Colors.black54,
                  ),
                ),
              ),
              Spacer(),
              // code for dots
              Wrap(
                children: [
                  //for some space
                  SizedBox(height: mq.height * .05),

                  //dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color:
                              list[index].title == 'Ask me Anything'
                                  ? Colors.blue
                                  : Colors.black54,
                          shape:
                              list[index].title == 'Ask me Anything'
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: mq.width * .02),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color:
                              list[index].title == 'Imagination to Reality'
                                  ? Colors.blue
                                  : Colors.black54,
                          shape:
                              list[index].title == 'Imagination to Reality'
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              //button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  shape: StadiumBorder(),
                  elevation: 0,
                  backgroundColor: Colors.blue,
                  minimumSize: Size(mq.width * .4, 50),
                ),

                onPressed: () async {
                  if (islast) {
                       // ✅ Save flag when onboarding is completed
                     await Prefs.setOnboardingDone();  
                       // ✅ Navigate to HomeScreen and replace onboarding
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Homescreen()),
                    );
                  } else {
                     // If not the last page, go to the next onboarding slide
                    c.nextPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Text(
                  islast ? 'Finish' : 'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
