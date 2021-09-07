import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/colors.dart';
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
class InheritedExample extends StatelessWidget {
  final String title;
  const InheritedExample({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _popNavigator() {
      Navigator.pop(context);
    }

    return Scaffold(
        appBar: AppBar(
            backgroundColor: transparent,
            elevation: 0.0,
            leading: IconButton(
                onPressed: _popNavigator, icon: styleIconMenuOpenBlack)),
        body: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: mainAxisAlignmentCenter,
              children: [
                DataOwnerStatefull(),
              ],
            ),
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
  int _number = 0;

  void _increment() {
    setState(() {
      _number += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignmentCenter,
      children: [
        ElevatedButton(
          onPressed: _increment,
          child: Text(add),
        ),
        const SizedBox(height: 15),
        DataproviderInherited(
          value: _number,
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
            .dependOnInheritedWidgetOfExactType<DataproviderInherited>()
            ?.value ??
        0;
    // final value =
    //   context.findAncestorStateOfType<_DataOwnerStatefullState>()?._number ??
    //         0;

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
    final value = getInherit<DataproviderInherited>(context)?.value ?? 0;
    // final value =
    //   context.findAncestorStateOfType<_DataOwnerStatefullState>()?._number ??
    //         0;
    return Text('$value', style: styleSimple_FS30);
  }
}

//Глобальная функция
T? getInherit<T>(BuildContext context) {
  final element =
      context.getElementForInheritedWidgetOfExactType<DataproviderInherited>();
  final widget = element?.widget;
  if (widget is DataproviderInherited) {
    return widget as T;
  } else {
    return null;
  }
}

//******************************************************************************

class DataproviderInherited extends InheritedWidget {
  final int value;
//В унаследовании(inherited), в кострукторе обязательно
//должен быть наследник(child)
  const DataproviderInherited(
      {Key? key, required this.value, required Widget child})
      : super(key: key, child: child);

  static DataproviderInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataproviderInherited>();
  }

  @override
  bool updateShouldNotify(DataproviderInherited oldWidget) {
    return value != oldWidget.value;
  }
}

//******************************************************************************
