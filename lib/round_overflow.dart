import 'package:flutter/material.dart';

class RoundOverflow extends StatefulWidget {
  final String title;
  const RoundOverflow({Key? key, required this.title}) : super(key: key);

  @override
  _RoundOverflowState createState() => _RoundOverflowState();
}

class _RoundOverflowState extends State<RoundOverflow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      OverflowBox(
          maxHeight: double.infinity,
          maxWidth: double.infinity,
          child: CircleAvatar(radius: 200, backgroundColor: Colors.red)),
      Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: CircleAvatar(
          radius: 150,
          backgroundImage: NetworkImage(
              'https://wallpaperscave.ru/images/original/18/08-31/animals-tiger-80406.jpg'),
        ))
      ])),
      Center(
          child: Container(
              padding: EdgeInsets.only(top: 200),
              child: Text('https://t.me/uz_dart',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))))
    ]));
  }
}
