import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../model/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);

    return message.msgType == MessageType.bot
        //bot
        ? Row(
          children: [
            const SizedBox(width: 6),

            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/logo.png', width: 24),
            ),

            //
            Container(
              constraints: BoxConstraints(maxWidth: Get.width * .6),
              margin: EdgeInsets.only(
                bottom: Get.height * .02,
                left: Get.width * .02,
              ),
              padding: EdgeInsets.symmetric(
                vertical: Get.height * .01,
                horizontal: Get.width * .02,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.only(
                  topLeft: r,
                  topRight: r,
                  bottomRight: r,
                ),
              ),
              child:
                  message.msg.isEmpty
                      ? AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            ' Please wait... ',
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        repeatForever: true,
                      )
                      : Text(message.msg, textAlign: TextAlign.center),
            ),
          ],
        )
        //user
        : Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //
            Container(
              constraints: BoxConstraints(maxWidth: Get.width * .6),
              margin: EdgeInsets.only(
                bottom: Get.height * .02,
                right: Get.width * .02,
              ),
              padding: EdgeInsets.symmetric(
                vertical: Get.height * .01,
                horizontal: Get.width * .02,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.only(
                  topLeft: r,
                  topRight: r,
                  bottomLeft: r,
                ),
              ),
              child: Text(message.msg, textAlign: TextAlign.center),
            ),

            const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),

            const SizedBox(width: 6),
          ],
        );
  }
}
