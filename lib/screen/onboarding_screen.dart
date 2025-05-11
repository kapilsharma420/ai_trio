import 'package:ai_trio/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body
      body: Column(
        children: [
          //lottie ai ask me animation
          LottieBuilder.asset(
            'assets/LottieAnimation/ai_ask_me.json',
            height: mq.height * .6,
          ),

          //title
          Text(
            'Ask me Anything',
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
              'I can be your Best Friend & You can ask me anything & I will help you !',

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
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: mq.width * .02),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
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
           textStyle:    TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
              shape: StadiumBorder(),
              elevation: 0,
              backgroundColor: Colors.blue,
              minimumSize: Size(mq.width * .4, 50),
            ),

            onPressed: () {},
            child: Text('Next',style: TextStyle(color: Colors.white),),
          ),
          Spacer(flex: 2,),
        ],
      ),
    );
  }
}
