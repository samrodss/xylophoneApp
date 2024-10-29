// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Note(const Color.fromRGBO(218, 255, 237, 1), '1'),
              Note(const Color.fromRGBO(155, 243, 240, 1), '2'),
              Note(const Color.fromRGBO(0, 217, 192, 1), '3'),
              Note(const Color.fromRGBO(99, 32, 238, 1), '4'),
              Note(const Color.fromRGBO(173, 252, 146, 1), '5'),
              Note(const Color.fromRGBO(250, 243, 62, 1), '6'),
              Note(const Color.fromRGBO(255, 67, 101, 1), '7'),
            ],
          ),
        ),
      ),
    );
  }
}

class Note extends StatelessWidget {
  final Color bgColor;
  final String
      noteNumber; // note files are named note$stringNumber so a number has to be passed as a string

  const Note(this.bgColor, this.noteNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: bgColor,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    final player = AudioPlayer();
                    await player.play(AssetSource('note$noteNumber.wav'));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Click me',
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
