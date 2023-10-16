import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Ask Me Anything'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Ball(size: 200),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Ball(size: 300),
            ),
          ],
        ),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  final double size;

  const Ball({Key? key, required this.size}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  _BallState();

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            ballNumber = Random().nextInt(5) + 1;
            print('I got clicked $ballNumber');
          });
        },
        child: Image.asset('images/ball$ballNumber.png', width: widget.size));
  }
}
