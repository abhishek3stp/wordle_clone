import 'package:flutter/material.dart';
import 'package:wordle_clone/widgets/wordle_letterbox.dart';

class WordleRow extends StatelessWidget {
  final int wordSize;
  final String word;

  const WordleRow({required this.word, required this.wordSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<WordleLetterBox> boxes = List.empty(growable: true);

    for (int j = 0; j < wordSize; j++) {
      if (word.length > j) {
        boxes.add(WordleLetterBox(letter: word[j]));
      } else {
        boxes.add(WordleLetterBox());
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
