import 'package:flutter/material.dart';
import 'styles/colors.dart';
import 'styles/styles.dart';
import 'styles/const.dart';

class Scroll extends StatelessWidget {
  final String title;
  const Scroll({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Container(
                  color: green.shade100,
                  child: _Page(key: PageStorageKey(index)),
                );
              case 1:
                return Container(
                  color: yellow.shade100,
                  child: _Page(key: PageStorageKey(index)),
                );
              case 2:
                return Container(
                  color: blue.shade100,
                  child: _Page(key: PageStorageKey(index)),
                );
              default:
                throw error;
            }
          }),
    ));
  }
}

class _Page extends StatelessWidget {
  const _Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: edgeInsetsTen,
            child: Column(
              children: [
                Text('$index'),
                Divider(),
              ],
            ),
          );
        });
  }
}
