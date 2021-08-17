import 'package:flutter/material.dart';

class BottomNavigatorWidget extends StatefulWidget {
  final String? title;
  BottomNavigatorWidget({Key? key, this.title}) : super(key: key);

  @override
  _BottomNavigatorWidgetState createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
  int _selectedTab = 0;

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  List<Widget> _widgetList = [
    Text('Домой'),
    Text('Список'),
    Text('Поиск'),
    Text('Добавить'),
    Text('Настройки')
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return Scaffold(
          appBar: AppBar(title: Text('Top Search')),
          body: Center(
            child: _widgetList[_selectedTab],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: onSelectedTab,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Домой'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.kitchen), label: 'Список'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_add), label: 'Добавить'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Настройки'),
            ],
          ),
        );
      });
    });
  }
}
