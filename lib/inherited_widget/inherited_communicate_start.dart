import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/colors.dart';
import 'package:flutter_for_practice/styles/const.dart';
import 'package:flutter_for_practice/styles/styles.dart';
import 'package:flutter_for_practice/styles/values.dart';

class InheritedCommunicateStart extends StatelessWidget {
  final String title;
  const InheritedCommunicateStart({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _popNavigator() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        leading:
            IconButton(onPressed: _popNavigator, icon: styleIconMenuOpenBlack),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: mainAxisAlignmentCenter,
          children: [
            SimpleCalcWidget(),
          ],
        ),
      )),
    );
  }
}

//******************************************************************************

class SimpleCalcWidget extends StatefulWidget {
  const SimpleCalcWidget({Key? key}) : super(key: key);

  @override
  State<SimpleCalcWidget> createState() => _SimpleCalcWidgetState();
}

class _SimpleCalcWidgetState extends State<SimpleCalcWidget> {
  final _model = SimpleCalcWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: edgeInsetsSymHorThirty,
      child: SimpleCalcWidgetProvider(
        model: _model,
        child: Column(
          mainAxisSize: mainAxisSizeMin,
          children: [
            FirstNumberWidget(),
            SizedBox(height: height10),
            SecondNumberWidget(),
            SizedBox(height: height10),
            SummaryButtonWidget(),
            SizedBox(height: height10),
            ResultWidget(),
          ],
        ),
      ),
    ));
  }
}

//******************************************************************************

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        onChanged: (value) {
          SimpleCalcWidgetProvider.of(context)?.model.firstNumber = value;
        });
  }
}

//******************************************************************************

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) =>
          SimpleCalcWidgetProvider.of(context)?.model.secondNumber = value,
    );
  }
}

//******************************************************************************

class SummaryButtonWidget extends StatefulWidget {
  const SummaryButtonWidget({Key? key}) : super(key: key);

  @override
  _SummaryButtonWidgetState createState() => _SummaryButtonWidgetState();
}

class _SummaryButtonWidgetState extends State<SummaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        SimpleCalcWidgetProvider.of(context)?.model.summ();
      },
      child: Text(calculateAmount),
    );
  }
}

//******************************************************************************

class ResultWidget extends StatefulWidget {
  const ResultWidget({Key? key}) : super(key: key);

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  String _result = '0';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final result = SimpleCalcWidgetProvider.of(context)?.model;
    result?.addListener(() {
      _result = '${result.summaryResult}';
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_result',
      style: styleSimple_FS20,
    );
  }
}

//******************************************************************************

class SimpleCalcWidgetModel extends ChangeNotifier {
  int? _firstNumber;
  int? _secondNumber;
  int? summaryResult;

  set firstNumber(String value) => _firstNumber = int.tryParse(value);
  set secondNumber(String value) => _secondNumber = int.tryParse(value);

  void summ() {
    int? summaryResult;
    if (_firstNumber != null && _secondNumber != null) {
      summaryResult = _firstNumber! + _secondNumber!;
    } else {
      summaryResult = null;
    }

    if (this.summaryResult != summaryResult) {
      this.summaryResult = summaryResult;
      notifyListeners();
    }
  }
}

//******************************************************************************

class SimpleCalcWidgetProvider extends InheritedWidget {
  final SimpleCalcWidgetModel model;

  const SimpleCalcWidgetProvider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, child: child);

  static SimpleCalcWidgetProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>();
  }

  @override
  bool updateShouldNotify(SimpleCalcWidgetProvider oldWidget) {
    return model != oldWidget.model;
  }
}

//******************************************************************************
