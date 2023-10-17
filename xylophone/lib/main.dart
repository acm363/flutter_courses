import 'package:audioplayers/audioplayers.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildXylophoneKey(color: Colors.red, soundNumber: 1),
                  buildXylophoneKey(color: Colors.orange, soundNumber: 2),
                  buildXylophoneKey(color: Colors.yellow, soundNumber: 3),
                  buildXylophoneKey(color: Colors.green, soundNumber: 4),
                  buildXylophoneKey(color: Colors.teal, soundNumber: 5),
                  buildXylophoneKey(color: Colors.blue, soundNumber: 6),
                  buildXylophoneKey(color: Colors.purple, soundNumber: 7),
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildXylophoneKey({required Color color, required int soundNumber}) {

    void playSound() {
      final player = AudioPlayer();
      player.play(
        AssetSource('note$soundNumber.wav'),
        volume: 1.0,
      );
    }

    return Expanded(
      child: InkWell(
        onTap: () {
          print('I was pressed $soundNumber');
          playSound();
        },
        child: Container(
          color: color,
          child: Text("Play note $soundNumber"),
        ),
      ),
    );
  }
}
