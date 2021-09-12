import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_for_practice/json/human.dart';
import 'package:flutter_for_practice/json/json.dart';
import 'package:flutter_for_practice/styles/const.dart';
import 'package:flutter_for_practice/styles/styles.dart';
import 'package:flutter_for_practice/styles/values.dart';

//******************************************************************************

class JsonExample extends StatelessWidget {
  const JsonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onMenuList() => Navigator.pop(context);

    return Scaffold(
      appBar: AppBar(
        title: jsonExample,
        leading: IconButton(
          onPressed: _onMenuList,
          icon: iconMenuOpen,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: mainAxisAlignmentCenter,
          children: [
            JsonExampleProvider(
              coder: JsonExampleCoder(),
              child: const ButtonWidget(),
            ),
            JsonView(),
          ],
        ),
      ),
    );
  }
}

//******************************************************************************

class JsonView extends StatelessWidget {
  const JsonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        return Container(
          height: height500,
          child: ListView.builder(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: edgeInsetsSymHorTen,
                  child: Table(
                    border: TableBorder.all(width: .1),
                    children: [
                      TableRow(
                        children: [
                          Text(
                            '$jsonString',
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}

//******************************************************************************

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10)),
            onPressed: () => JsonExampleProvider.read(context)?.coder.encode(),
            child: const Text(encode),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10)),
            onPressed: () => JsonExampleProvider.read(context)?.coder.decode(),
            child: const Text(decode),
          ),
        ],
      ),
    );
  }
}

//******************************************************************************

class JsonExampleCoder {
  void encode() {
    try {
      final jsonStrng = jsonEncode(humans.map((e) => e.toJson()).toList());
      print(jsonStrng);
    } catch (error) {
      print(error);
    }
  }

  void decode() {
    try {
      final json = jsonDecode(jsonString) as List<dynamic>;
      final users = json
          .map<Human>((dynamic e) => Human.fromJson(e as Map<String, dynamic>))
          .toList();
      print(users);
    } catch (error) {
      print(error);
    }
  }
}

//******************************************************************************

class JsonExampleProvider extends InheritedWidget {
  final JsonExampleCoder coder;

  const JsonExampleProvider(
      {Key? key, required this.coder, required Widget child})
      : super(key: key, child: child);

  static JsonExampleProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
  }

  static JsonExampleProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<JsonExampleProvider>()
        ?.widget;
    return widget is JsonExampleProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(JsonExampleProvider oldWidget) {
    return true;
  }
}

//******************************************************************************