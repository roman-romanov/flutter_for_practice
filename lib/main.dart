import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_for_practice/reorder_widget.dart';
import 'package:sizer/sizer.dart';




void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.red, unselectedItemColor: Colors.grey),
        ),
        home: ReorderWidget(title: 'Flutter Practice'),
      );
    });
  }
}
