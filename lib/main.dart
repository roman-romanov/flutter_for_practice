import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_for_practice/context.dart';
import 'package:flutter_for_practice/inherited_widget/inherited_example.dart';
import 'package:flutter_for_practice/json/json_example.dart';
import 'package:sizer/sizer.dart';
import 'collapse_animated.dart';
import 'inherited_widget/inherited_communicate.dart';
import 'inherited_widget/inherited_model.dart';
import 'inherited_widget/inherited_notifier.dart';
import 'menu_list.dart';

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
          initialRoute: '/menu_list',
          routes: {
            '/menu_list': (context) => const MenuList(),
            '/color_button': (context) => const ColorButton(),
            '/container_colors': (context) => const ContainerColors(),
            '/collapse_animated': (context) => const CollapseAnimatedWidget(),
            '/inherited_widget': (context) =>
                const InheritedExample(title: 'Inherit Widget'),
            '/inherited_model': (context) =>
                const InheritModel(title: 'Inherit Model'),
            '/inherited_communicate': (context) =>
                const InheritedCommunicateStart(title: 'Inherited Communicate'),
            '/inherited_notifier': (context) =>
                const InheritNotifier(title: 'Inherited Notifier'),
            '/json_example': (context) => const JsonExample(),
          },
          // home: MainList(),
        );
      });
    });
  }
}
