import 'package:etl_ai/repo/gemini_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// gemini state notifier provider
final geminiStateNotifierProvider =
    StateNotifierProvider<GeminiStateNotifier, AsyncValue>((ref) {
  return GeminiStateNotifier(ref.watch(geminiRepoProvider));
});

class GeminiStateNotifier extends StateNotifier<AsyncValue> {
  final GeminiRepo _repo;
  GeminiStateNotifier(this._repo) : super(const AsyncData(null));

  // search for a term and update the state
  Future<String> generateText(String term) async {
    state = const AsyncLoading();
    try {
      final data = await _repo.generateText(term);
      state = AsyncData(data);
      return data;
    } catch (e, s) {
      state = AsyncError(e, s);
      return 'Error: $e, Stack: $s';
    }
  }
}
