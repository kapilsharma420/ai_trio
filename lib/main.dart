import 'package:ai_trio/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
   // Ensures that widget binding is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
   // Hides system UI (like status and navigation bars) in immersive sticky mode
 await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // Locks the app orientation to portrait mode only (both up and down)
 await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.white,
  //     systemNavigationBarColor: Colors.white,
  //     statusBarIconBrightness: Brightness.dark,
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splashscreen()
    );
  }
}
