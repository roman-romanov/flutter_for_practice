import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/styles.dart';
import 'styles/const.dart';

class MainList extends StatelessWidget {
  const MainList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: appBarMenuTitle),
          body: Column(
            crossAxisAlignment: crossAxisAlignmentLeft,
            children: [
              //
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/container_colors');
                  },
                  child: colorButtonContext),
              //
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/inherited_widget');
                  },
                  child: inheritedWidget),
            ],
          ),
        ),
      );
    });
  }
}
