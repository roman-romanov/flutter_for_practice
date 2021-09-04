import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_for_practice/context.dart';
import 'package:sizer/sizer.dart';
import 'main_list.dart';

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
    return LayoutBuilder(builder: (context, constraints) {
      return Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.red,
                unselectedItemColor: Colors.grey),
          ),
          initialRoute: '/main_list',
          routes: {
            '/main_list': (context) => const MainList(),
            '/color_button': (context) => const ColorButton(),
            '/container_colors': (context) => const ContainerColors(),
          },
         // home: MainList(),
        );
      });
    });
  }
}
