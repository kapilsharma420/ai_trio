import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
   // This function saves the value 'true' to remember that onboarding is completed
  static Future<void> setOnboardingDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingDone', true); // Save the value
  }

 // This function checks if onboarding is already completed
  static Future<bool> isOnboardingDone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingDone') ?? false; // Read flag (false if not found)
  }
}
