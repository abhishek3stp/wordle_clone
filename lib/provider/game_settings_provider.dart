import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameSettings {
  final int wordSize;
  final int attempts;

  GameSettings({required this.wordSize, required this.attempts});

  GameSettings clone({int? wordSize, int? attempts}) {
    return GameSettings(
        wordSize: wordSize ?? this.wordSize,
        attempts: attempts ?? this.attempts);
  }
}

class GameSettingsNotifier extends StateNotifier<GameSettings> {
  GameSettingsNotifier() : super(GameSettings(wordSize: 5, attempts: 6));

  void updateAttempts(int attempts) {
    state = state.clone(attempts: attempts);
  }

  void updateWordSize(int wordSize) {
    state = state.clone(wordSize: wordSize);
  }
}

final gameSettingsProvider =
    StateNotifierProvider<GameSettingsNotifier, GameSettings>((ref) {
  return GameSettingsNotifier();
});
