import 'package:ai_trio/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  // Ensures that widget binding is initialized before running the app  ( Make sure Flutter is ready)
  WidgetsFlutterBinding.ensureInitialized();
  // Hides system UI (like status and navigation bars) in immersive sticky mode
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // Locks the app orientation to portrait mode only (both up and down)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: IconThemeData(color: Colors.blue),

          elevation: 1,

          centerTitle: true,
          backgroundColor: Colors.white,
        ),
      ),

      title: 'AI Trio',
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
