import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/const.dart';
import 'package:flutter_for_practice/styles/colors.dart';
import 'package:flutter_for_practice/styles/styles.dart';
import 'package:flutter_for_practice/styles/values.dart';

class CollapseAnimatedWidget extends StatefulWidget {
  const CollapseAnimatedWidget({Key? key}) : super(key: key);

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
    void _onMenuList() => Navigator.pop(context);

    return Scaffold(
      appBar: AppBar(
          title: appBarAnimatedContainer,
          leading: IconButton(onPressed: _onMenuList, icon: iconMenuOpen)),
      body: SafeArea(
        child: Column(mainAxisAlignment: mainAxisAlignmentCenter, children: [
          Center(
            child: Padding(
              padding: edgeInsetsEight,
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: red,
                  ),
                  width: widthInfinity,
                  child: Padding(
                    padding: edgeInsetsThree,
                    child: AnimatedContainer(
                      duration: durationMilliseconds500,
                      height: _isCollapsed ? 0 : height150,
                      color: yellow.shade50,
                      child: Center(
                        child: Padding(
                          padding: edgeInsetsEight,
                          child: Text(textForCollapsedAnimation,
                              style: styleSimple_FS20,
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: _toggle,
              child: Text(_isCollapsed ? expand : collapse)),
        ]),
      ),
    );
  }
}
