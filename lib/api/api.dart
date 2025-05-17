import 'dart:developer';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../helper/global.dart';

class APIs {
  /// Get answer from Google Gemini AI
  static Future<String> getAnswer(String question) async {
    // Check for empty or whitespace-only input
    if (question.trim().isEmpty) {
      return 'Please enter a valid question.';
    }

    try {
      log('api key: $ApiKey');
      log('user question: $question');

      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: ApiKey,
      );

      final content = [Content.text(question)];
      final res = await model.generateContent(
        content,
        safetySettings: [
          SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
          SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
          SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
          SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
        ],
      );

      final answer = res.text;

      if (answer == null || answer.trim().isEmpty) {
        return 'AI could not generate a response.';
      }

      log('res: $answer');
      return answer;
    } catch (e) {
      log('getAnswerGeminiE: $e');
      return 'Something went wrong (Try again in sometime)';
    }
  }
}
