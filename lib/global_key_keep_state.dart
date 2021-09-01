import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/colors.dart';
import 'package:flutter_for_practice/styles/const.dart';
import 'package:flutter_for_practice/styles/values.dart';

final _globalKey = GlobalKey();


class SwitchSlider extends StatelessWidget {
  final String title;
  const SwitchSlider({Key? key, required this.title}) : super(key: key);

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
                      child: SwitchSliderWidgets(key: _globalKey),
                    );
                  case 1:
                    return Container(
                      color: blue.shade100,
                      child: Center(child: secondPage),
                    );
                  case 2:
                    return Container(
                      color: red.shade100,
                      child: SwitchSliderWidgets(key: null),
                    );

                  default:
                    throw '404';
                }
              })),
    );
  }
}

class SwitchSliderWidgets extends StatefulWidget {
  const SwitchSliderWidgets({Key? key}) : super(key: key);

  @override
  _SwitchSliderWidgets createState() => _SwitchSliderWidgets();
}

class _SwitchSliderWidgets extends State<SwitchSliderWidgets> {
  bool _switchValue = false;
  double _sliderValue = half;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Switch(
        value: _switchValue,
        onChanged: (value) {
          setState(() {
            _switchValue = value;
          });
        },
      ),
      Slider(
        value: _sliderValue,
        onChanged: (value) {
          setState(() {
            _sliderValue = value;
          });
        },
      ),
    ]);
  }
}
