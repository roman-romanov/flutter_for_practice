import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/const.dart';
import 'package:flutter_for_practice/styles/styles.dart';
import 'package:flutter_for_practice/styles/values.dart';

class ExampleKeysWidget extends StatelessWidget {
  final String title;
  const ExampleKeysWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: KeysWidget(),
    );
  }
}

class KeysWidget extends StatefulWidget {
  @override
  _KeysWidget createState() => _KeysWidget();
}

class _KeysWidget extends State<KeysWidget> {
  List<Widget> tiles = [
    //Проверка ключей происходит в первой вложенности(Padding), в одном родителе
    //В данном случае tiles вложены в отступы (Padding), которые в свою очередь вложены
    //в родитель Row 
    Padding(
      key: UniqueKey(),
      padding: edgeInsetsEight,
      child: ColorfulTile(),
    ),
    Padding(
      key: UniqueKey(),
      padding: edgeInsetsEight,
      child: ColorfulTile(),
    ),
  ];
  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: mainAxisAlignmentCenter,
        children: [
          Padding(
              padding: edgeInsetsTwenty,
              child: ElevatedButton(
                onPressed: swapTiles,
                child: Text(toggle),
              )),
          Row(mainAxisAlignment: mainAxisAlignmentCenter, children: tiles),
        ],
      ),
    ));
  }
}

class ColorfulTile extends StatefulWidget {
  const ColorfulTile({Key? key}) : super(key: key);
  @override
  _ColorfulTileState createState() => _ColorfulTileState();
}

class _ColorfulTileState extends State<ColorfulTile> {
  final myColor = UniqueColorGenerator.getColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height100,
      width: width100,
      color: myColor,
    );
  }
}

class UniqueColorGenerator {
  static final _random = Random();
  static Color getColor() {
    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1.0,
    );
  }
}
