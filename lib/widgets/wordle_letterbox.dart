import 'package:flutter/material.dart';

class WordleLetterBox extends StatelessWidget {
  final String letter;
  final int pos;
  final String correctWord;
  final bool attempted;

  const WordleLetterBox({
    Key? key,
    required this.letter,
    required this.correctWord,
    required this.attempted,
    required this.pos,
  }) : super(key: key);

  Color? getBgColor() {
    if (!attempted) {
      return null;
    }
    if (!correctWord.contains(letter)) {
      return Colors.grey;
    }
    if (correctWord.indexOf(letter) == pos) {
      return Colors.green;
    }
    return Colors.orange;
  }

  BoxBorder? getBorder() {
    if (!attempted) {
      return Border.all(color: Colors.grey, width: 2);
    }
    return Border.all(color: Colors.transparent, width: 2);
  }

  Color? getTextColor() {
    if (!attempted) {
      return Colors.black;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: getBorder(),
        color: getBgColor(),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        letter.toUpperCase(),
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: getTextColor(),
        ),
      ),
    );
  }
}
