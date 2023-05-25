import 'package:flutter/material.dart';
import 'package:wordle_clone/widgets/wordle_letterbox.dart';

class WordleRow extends StatelessWidget {
  final int wordSize;
  final String word;
  final String correctWord;
  final bool attempted;

  const WordleRow(
      {required this.word,
      required this.wordSize,
      required this.attempted,
      required this.correctWord,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<WordleLetterBox> boxes = List.empty(growable: true);

    for (int j = 0; j < wordSize; j++) {
      var letter = "";
      if (word.length > j) {
        letter = word[j];
      }
      boxes.add(WordleLetterBox(
        letter: letter,
        attempted: attempted,
        correctWord: correctWord,
        pos: j,
      ));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
