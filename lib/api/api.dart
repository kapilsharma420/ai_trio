
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:translator_plus/translator_plus.dart';
import '../helper/global.dart';

class APIs {
  /// Get answer from Google Gemini AI (REST API)
  static Future<String> getAnswer(String question) async {
    if (question.trim().isEmpty) {
      return 'Please enter a valid question.';
    }

    try {
      log('api key: $ApiKey');
      log('user question: $question');

      final url = Uri.parse(
'https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent?key=$ApiKey'
);

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": question}
              ]
            }
          ]
        }),
      );

      if (response.statusCode != 200) {
        log('HTTP Error: ${response.body}');
        return 'Something went wrong (Server Error)';
      }

      final data = jsonDecode(response.body);

      final answer =
          data['candidates'][0]['content']['parts'][0]['text'];

      if (answer == null || answer.toString().trim().isEmpty) {
        return 'AI could not generate a response.';
      }

      log('res: $answer');
      return answer;
    } catch (e) {
      log('getAnswerGeminiE: $e');
      return 'Something went wrong (Try again in sometime)';
    }
  }

  /// Google Translate
  static Future<String> googleTranslate({
    required String from,
    required String to,
    required String text,
  }) async {
    try {
      final res =
          await GoogleTranslator().translate(text, from: from, to: to);
      return res.text;
    } catch (e) {
      log('googleTranslateE: $e');
      return 'Something went wrong!';
    }
  }
}
