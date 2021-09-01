import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/const.dart';
import 'package:flutter_for_practice/styles/styles.dart';
import 'package:flutter_for_practice/styles/values.dart';

//Использование глобальных ключей, для получения состояния
final globalKey = GlobalKey<_AwesomeTextWidgetState>();

class AwesomeText extends StatelessWidget {
  final String title;
  const AwesomeText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: stringGlobalKey,),
      body: Column(
        mainAxisAlignment: mainAxisAlignmentCenter,
        children: [
          Row(
            mainAxisAlignment: mainAxisAlignmentCenter,
            children: [
              ElevatedButton(
                  onPressed: () => globalKey.currentState?._increment(),
                  child: Text(increment)),
              SizedBox(width: width20),
              ElevatedButton(
                  style: styleDecrement,
                  onPressed: () => globalKey.currentState?._decrement(),
                  child: Text(decrement))
            ],
          ),
          SizedBox(height: height20),
          AwesomeTextWidget(key: globalKey),
        ],
      ),
    ));
  }
}

class AwesomeTextWidget extends StatefulWidget {
  const AwesomeTextWidget({Key? key}) : super(key: key);

  @override
  _AwesomeTextWidgetState createState() => _AwesomeTextWidgetState();
}

class _AwesomeTextWidgetState extends State<AwesomeTextWidget> {
  var _value = 0;

  void _increment() {
    setState(() {
      _value += 1;
    });
  }

  void _decrement() {
    setState(() {
      _value -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_value', style: styleSimple_FS50);
  }
}
