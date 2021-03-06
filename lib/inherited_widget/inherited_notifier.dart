import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/const.dart';
import 'package:flutter_for_practice/styles/styles.dart';
import 'package:flutter_for_practice/styles/values.dart';

class InheritNotifier extends StatelessWidget {
  final String title;
  const InheritNotifier({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _popNavigator() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: appBarInheritedNotifier,
        leading: IconButton(onPressed: _popNavigator, icon: iconMenuOpen),
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
  final _model = ChangeNotifierModel();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: edgeInsetsSymHorThirty,
      child: WidgetProvider(
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
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        onChanged: (value) {
          WidgetProvider.of(context)?.model.firstNumber = value;
        });
  }
}

//******************************************************************************

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) =>
          WidgetProvider.of(context)?.model.secondNumber = value,
    );
  }
}

//******************************************************************************

class SummaryButtonWidget extends StatelessWidget {
  const SummaryButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        WidgetProvider.of(context)?.model.summ();
      },
      child: Text(calculateAmount),
    );
  }
}

//******************************************************************************

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = WidgetProvider.of(context)?.model.summaryResult ?? '0';
    return Text('$result', style: styleSimple_FS20);
  }
}

//******************************************************************************

class ChangeNotifierModel extends ChangeNotifier {
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

class WidgetProvider extends InheritedNotifier<ChangeNotifierModel> {
  final ChangeNotifierModel model;

  const WidgetProvider({Key? key, required this.model, required Widget child})
      : super(
          key: key,
          notifier: model,
          child: child,
        );

  static WidgetProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WidgetProvider>();
  }
}

//******************************************************************************
