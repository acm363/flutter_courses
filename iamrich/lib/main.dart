import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Mugiwara No Luffy')),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: const Center(
          child: Image(
            image:
                // NetworkImage('https://wallpapers-clan.com/wp-content/uploads/2023/04/one-piece-monkey-d-luffy-aesthetic-wallpaper.jpg'),
                AssetImage(
                    'images/one-piece-monkey-d-luffy-aesthetic-wallpaper.jpg'),
          ),
        ),
        backgroundColor: Colors.blueGrey,
      )));
}
