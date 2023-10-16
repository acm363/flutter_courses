import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/me.jpg'),
              ),
            ),
            Text('Churchill ATCHEDJI',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  fontFamily: 'Onest',
                  fontWeight: FontWeight.w100,
                )),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'SOFTWARE ENGINEER',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black.withOpacity(0.6),
                fontFamily: 'Lato',
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.indigo.shade500,
              ),
            ),
            Card(
              color: Colors.indigo.shade50,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                    leading: Icon(
                      Icons.call,
                      size: 30.0,
                      color: Colors.indigo,
                    ),
                    title: Text(
                      '+33 77 77 77 77 77',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ),
            ),
            SizedBox(height: 5),
            Card(
              color: Colors.indigo.shade50,
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                    leading: Icon(
                      Icons.contact_mail,
                      size: 30.0,
                      color: Colors.indigo,
                    ),
                    title: Text(
                      'churchill@mail.net',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
