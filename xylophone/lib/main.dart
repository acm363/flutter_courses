import 'package:audioplayers/audioplayers.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: TextButton(
                onPressed: () {
                  print('I was pressed');
                  final player = AudioPlayer();
                  player.play(UrlSource(
                      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"));
                },
                child: Text(adjectives.last)),
          ),
        ),
      ),
    );
  }
}
