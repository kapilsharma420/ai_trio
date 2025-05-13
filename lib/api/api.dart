import 'package:ai_trio/helper/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


/// APIs class handles all API related operations
class APIs {
  // Base URL for the ChatGPT API endpoint
  static const String apiUrl = 'https://api.openai.com/v1/chat/completions';
  
  /// Gets an answer from ChatGPT for the given question
  /// 
  /// Parameters:
  /// - question: The user's input question to be answered by ChatGPT
  /// 
  /// Returns:
  /// - Future<String>: The response text from ChatGPT
  /// 
  /// Throws:
  /// - Exception: If API call fails or response processing fails
  static Future<String> getAnswer(String question) async {
    try {
      // Make POST request to ChatGPT API
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          // Specify JSON content type for request
          'Content-Type': 'application/json',
          // Add API key for authentication
          'Authorization': 'Bearer $chatgptApiKey',
        },
        // Convert request body to JSON string
        body: jsonEncode({
          // Specify the ChatGPT model to use
          'model': 'gpt-3.5-turbo',
          // Format the conversation messages
          'messages': [
            {
              'role': 'user',
              'content': question,
            }
          ],
          // Control randomness in responses (0-1)
          'temperature': 0.7,
          // Limit response length to 2000 tokens
          'max_tokens': 2000,
        }),
      );

      // Check if request was successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        final data = jsonDecode(response.body);
        // Extract and return the answer text
        return data['choices'][0]['message']['content'];
      } else {
        // Throw error if request failed
        throw Exception('Failed to get response: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors during API call or response processing
      throw Exception('Error getting answer: $e');
    }
  }
}