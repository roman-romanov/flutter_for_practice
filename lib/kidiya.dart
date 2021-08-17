import 'package:flutter/material.dart';

class Kidiya extends StatefulWidget {
  final String title;
  const Kidiya({Key? key, required this.title}) : super(key: key);

  @override
  _KidiyaState createState() => _KidiyaState();
}

class _KidiyaState extends State<Kidiya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      OverflowBox(
          maxHeight: double.infinity,
          maxWidth: double.infinity,
          child: CircleAvatar(radius: 200, backgroundColor: Colors.red[100])),
      Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Image(image: AssetImage('assets/images/kidya_logo.png')),
            ),
            Text(
              'Do shopping in one minute',
              style: TextStyle(fontSize: 18),
            )
          ],
        ))
      ])),
    ]));
  }
}
