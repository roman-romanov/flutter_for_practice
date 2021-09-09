import 'package:flutter/material.dart';

import 'package:flutter_for_practice/styles/const.dart';
import 'package:flutter_for_practice/styles/styles.dart';

//******************************************************************************
/*Методы
--------------------------------------------------------------------------------
dependOnInheritedElement           - Подписывает на изменения унаследования
Используется в:                      didChangeDependencies, build
--------------------------------------------------------------------------------
dependOnInheritedWidgetOfExactType - Получает унаследование и одновременно 
                                     подписывает на его изменения
Используется в:                      didChangeDependencies, build
--------------------------------------------------------------------------------
getElementForInheritedWidgetOfExactType - Получает элемент унаследования виджета
                                       из него можно получить само унаследование 
                                       без подписки на изменения
Используется в:                        initState, didChangeDependencies, build
                                       deactivate
--------------------------------------------------------------------------------
*/
class InheritModel extends StatelessWidget {
  final String title;
  const InheritModel({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _popNavigator() {
      Navigator.pop(context);
    }

    return Scaffold(
        appBar: AppBar(
          title: appBarInheritedModel,
            leading:
                IconButton(onPressed: _popNavigator, icon: styleIconMenuOpen)),
        body: SafeArea(
          child: Center(
            child: DataOwnerStatefull(),
          ),
        ));
  }
}

class DataOwnerStatefull extends StatefulWidget {
  const DataOwnerStatefull({Key? key}) : super(key: key);

  @override
  _DataOwnerStatefullState createState() => _DataOwnerStatefullState();
}

class _DataOwnerStatefullState extends State<DataOwnerStatefull> {
  int _numberOne = 0;
  int _numberTwo = 0;

  void _incrementOne() {
    setState(() {
      _numberOne += 1;
    });
  }

  void _incrementTwo() {
    setState(() {
      _numberTwo += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignmentCenter,
      children: [
        ElevatedButton(
          onPressed: _incrementOne,
          child: const Text(add),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: _incrementTwo,
          child: const Text(add),
        ),
        DataProviderInherited(
          valueOne: _numberOne,
          valueTwo: _numberTwo,
          child: const DataConsumerStateless(),
        ),
      ],
    );
  }
}

//******************************************************************************

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInherited>(
                aspect: 'One')
            ?.valueOne ??
        0;

    return Container(
      child: Column(crossAxisAlignment: crossAxisAlignmentCenter, children: [
        Text('$value', style: styleSimple_FS30),
        const DataConsumerStateful(),
      ]),
    );
  }
}

class DataConsumerStateful extends StatefulWidget {
  const DataConsumerStateful({Key? key}) : super(key: key);

  @override
  _DataConsumerStatefulState createState() => _DataConsumerStatefulState();
}

class _DataConsumerStatefulState extends State<DataConsumerStateful> {
  @override
  Widget build(BuildContext context) {
    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInherited>(
                aspect: 'Two')
            ?.valueTwo ??
        0;

    return Text('$value', style: styleSimple_FS30);
  }
}

//******************************************************************************

class DataProviderInherited extends InheritedModel<String> {
  final int valueOne;
  final int valueTwo;
//В унаследовании(inherited), в кострукторе обязательно
//должен быть наследник(child)
  const DataProviderInherited(
      {Key? key,
      required this.valueOne,
      required this.valueTwo,
      required Widget child})
      : super(key: key, child: child);

  static DataProviderInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataProviderInherited>();
  }

  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return valueOne != oldWidget.valueOne || valueTwo != oldWidget.valueTwo;
  }

  @override
  bool updateShouldNotifyDependent(
      covariant DataProviderInherited oldWidget, Set<String> dependencies) {
    final isValueOneUpdated =
        valueOne != oldWidget.valueOne && dependencies.contains('One');
    final isValueTwoUpdated =
        valueTwo != oldWidget.valueTwo && dependencies.contains('Two');
    return isValueOneUpdated || isValueTwoUpdated;
  }
}

//******************************************************************************
