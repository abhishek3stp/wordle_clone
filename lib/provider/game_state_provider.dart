import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle_clone/data/wordle_repo.dart';
import 'package:wordle_clone/provider/game_settings_provider.dart';

class GameState {
  final GameSettings settings;
  final List<String> validWords;
  final String correctWord;
  final List<String> attempts;
  final int attempted;

  GameState(
      {required this.correctWord,
      required this.validWords,
      required this.settings,
      required this.attempts,
      required this.attempted});

  GameState clone(
      {List<String>? validWords,
      String? correctWord,
      List<String>? attempts,
      int? attempted}) {
    return GameState(
        correctWord: correctWord ?? this.correctWord,
        validWords: validWords ?? this.validWords,
        settings: this.settings,
        attempts: attempts ?? this.attempts,
        attempted: attempted ?? this.attempted);
  }
}

class GameStateNotifier extends StateNotifier<GameState> {
  final Random rng = Random();
  GameStateNotifier(GameSettings settings)
      : super(GameState(
            validWords: [],
            correctWord: "begin",
            settings: settings,
            attempts: [],
            attempted: 0));

  Future<void> updateWords() async {
    final words = await loadWords(state.settings.wordSize);
    state = state.clone(
        validWords: words, correctWord: words[rng.nextInt(words.length - 1)]);
  }

  void newCorrectWord() {
    state = state.clone(
        correctWord:
            state.validWords[rng.nextInt(state.validWords.length - 1)]);
  }

  void updateCurrentAttempt(String key) {
    if (key == '_') {
      // handle enter press
    } else if (key == '<') {
      // handle back press
    } else {
      final attempts = state.attempts;
      if (attempts.length <= state.attempted) {
        attempts.add("");
      }
      var currentAttempt = attempts[state.attempted];
      if (currentAttempt.length >= state.settings.wordSize) {
        print("trying to type word longer than correct word length");
        return;
      }
      currentAttempt += key;
      print(currentAttempt);
      attempts[state.attempted] = currentAttempt;
      state = state.clone(attempts: attempts);
    }
  }
}

final gameStateProvider =
    StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  final settings = ref.watch(gameSettingsProvider);
  final gameStateNotifier = GameStateNotifier(settings);
  gameStateNotifier.updateWords();
  return gameStateNotifier;
});
