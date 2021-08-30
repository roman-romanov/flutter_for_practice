import 'package:flutter/material.dart';
import 'package:flutter_for_practice/const/const.dart';
import 'package:flutter_for_practice/styles/colors.dart';
import 'package:flutter_for_practice/styles/styles.dart';
import 'package:flutter_for_practice/styles/values.dart';

class CollapseAnimatedWidget extends StatefulWidget {
  final String title;
  const CollapseAnimatedWidget({Key? key, required this.title})
      : super(key: key);

  @override
  _CollapseAnimatedWidgetState createState() => _CollapseAnimatedWidgetState();
}

class _CollapseAnimatedWidgetState extends State<CollapseAnimatedWidget> {
  bool _isCollapsed = false;

  void _toggle() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ElevatedButton(
              onPressed: _toggle,
              child: Text(_isCollapsed ? expand : collapse)),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                    color: red,
                    width: widthInfinity,
                    child: Padding(
                      padding: edgeInsetsTwenty,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: _isCollapsed ? 0 : height100,
                        color: _isCollapsed ? green : amber,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
