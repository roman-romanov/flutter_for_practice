import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/colors.dart';
import 'package:flutter_for_practice/styles/styles.dart';

//Пример использования ловального ключа
class ReorderWidget extends StatefulWidget {
  final String title;
  const ReorderWidget({Key? key, required this.title}) : super(key: key);

  @override
  _ReorderWidgetState createState() => _ReorderWidgetState();
}

class _ReorderWidgetState extends State<ReorderWidget> {
  var ints = List<String>.generate(10, (index) => index.toString());

  void onReorder(int from, int to) {
    setState(() {
      if (from < to) {
        to -= 1;
      }
      final element = ints.removeAt(from);
      ints.insert(to, element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ReorderableListView.builder(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: ints.length,
            itemBuilder: (context, index) {
              return GreenBox(
                key: ValueKey(ints[index]),
              );
            },
            onReorder: onReorder),
      ),
    );
  }
}

class GreenBox extends StatefulWidget {
  GreenBox({Key? key}) : super(key: key) {
    print('GreenBox init');
  }

  @override
  _GreenBoxState createState() {
    print('GreenBox createState');
    return _GreenBoxState();
  }
}

class _GreenBoxState extends State<GreenBox> {
  var _text = 'start';
  bool isDeactivated = false;
  bool isDisposed = false;

  void _changeText(String text) {
    _text = text;
    setState(() {});
  }

  _GreenBoxState() {
    print('GreenBox state init');
  }

  @override
  void initState() {
    super.initState();
    print('GreenBox initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('GreenBox didChangeDependencies');
  }

  @override
  void didUpdateWidget(GreenBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('GreenBox didUpdateWidget');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('GreenBox reassemble');
  }

  @override
  Widget build(BuildContext context) {
    print(
        'GreenBox build isDeactivated: $isDeactivated, isDisposed: $isDisposed');

    return Padding(
      padding: edgeInsetsTen,
      child: Container(
        color: green,
        child: Column(children: [
          Text(_text),
          Padding(
              padding: edgeInsetsTen,
              child: TextField(
                onChanged: _changeText,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ))
        ]),
      ),
    );
  }

  @override
  void deactivate() {
    print('GreenBox deactivate');
    isDeactivated = true;
    super.deactivate();
  }

  @override
  void dispose() {
    print('GreenBox deactivate');
    isDisposed = true;
    super.dispose();
  }
}
