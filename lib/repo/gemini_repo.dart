import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final geminiRepoProvider = Provider<GeminiRepo>((ref) {
  return GeminiRepo();
});

class GeminiRepo {
  Future<String> generateText(String search) async {
    final model =
        FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');
    // Provide a prompt that contains text
    final prompt = [Content.text(search)];
    final response = await model.generateContent(prompt);
    return response.text ?? 'No data found';
  }
}
