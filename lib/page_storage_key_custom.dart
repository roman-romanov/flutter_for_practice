import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/styles.dart';
import 'styles/colors.dart';
import 'styles/const.dart';

class PageStorageKeyExample extends StatelessWidget {
  final String title;
  const PageStorageKeyExample({Key? key, required this.title})
      : super(key: key);

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
                  child: _Page(key: null),
                );
              case 1:
                return Container(
                  color: yellow.shade100,
                  child: Center(child: secondPage),
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

class _MyPageStorageIdentifier {
  final Key? key;
  final String? name;
  _MyPageStorageIdentifier({this.key, this.name});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MyPageStorageIdentifier &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          name == other.name;
  @override
  int get hashCode => key.hashCode ^ name.hashCode;
}

class _Page extends StatefulWidget {
  const _Page({Key? key}) : super(key: key);

  @override
  __PageState createState() => __PageState();
}

class __PageState extends State<_Page> {
  final _textEditingController = TextEditingController();

  void setupValuePersistence() {
    final key = widget.key;
    if (key == null) return;
    final identifier = _MyPageStorageIdentifier(key: key, name: 'text');

    final dynamic value =
        PageStorage.of(context)?.readState(context, identifier: identifier);
    _textEditingController.text = value is String ? value : '';
    _textEditingController.addListener(() {
      PageStorage.of(context)?.writeState(context, _textEditingController.text,
          identifier: identifier);
    });
  }

  @override
  void initState() {
    setupValuePersistence();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsTwenty,
      child: Center(
        child: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
