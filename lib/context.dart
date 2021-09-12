import 'package:flutter/material.dart';
import 'styles/styles.dart';
import 'styles/colors.dart';
import 'styles/const.dart';

class ContainerColors extends StatelessWidget {
  const ContainerColors({Key? key}) : super(key: key);

  static void goToContainerColorsWidget(BuildContext context) {
    Navigator.of(context)
        .push<void>(MaterialPageRoute<void>(builder: (context) {
      return const ContainerColorsWidget();
    }));
  }

  void onMenuList(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarContext,
          leading: IconButton(
              onPressed: () => onMenuList(context), icon: iconMenuOpen)),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => goToContainerColorsWidget(context),
            child: Text(goTo),
          ),
        ),
      ),
    );
  }
}

class ContainerColorsWidget extends StatelessWidget {
  const ContainerColorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appBarContext,),
      body: SafeArea(
        child: InheritExample(
          child: ColoredWidget(
            initialColor: red,
            child: Padding(
              padding: edgeInsetsFourty,
              child: ColoredWidget(
                initialColor: green,
                child: Padding(
                  padding: edgeInsetsFourty,
                  child: ColorButton(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InheritExample extends InheritedWidget {
  const InheritExample({Key? key, required child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class ColoredWidget extends StatefulWidget {
  final Color initialColor;
  final Widget child;
  const ColoredWidget(
      {Key? key, required this.initialColor, required this.child})
      : super(key: key);

  @override
  _ColoredWidgetState createState() => _ColoredWidgetState();
}

class _ColoredWidgetState extends State<ColoredWidget> {
  late Color color;

  @override
  void initState() {
    color = widget.initialColor;
    super.initState();
  }

  void changeColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: color, child: widget.child);
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({Key? key}) : super(key: key);

  void _onPressed(BuildContext context) {
    //Находит в дереве, откуда он стартует ближайший к нему state
    context.findAncestorStateOfType<_ColoredWidgetState>()?.changeColor(pink);
    //Находит в дереве, откуда он стартует последний к нему state
    context
        .findRootAncestorStateOfType<_ColoredWidgetState>()
        ?.changeColor(yellow);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredWidget(
      initialColor: blue,
      child: Center(
        child: ElevatedButton(
          onPressed: () => _onPressed(context),
          child: Text(press),
        ),
      ),
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({Key? key}) : super(key: key);
  void _onPressed(BuildContext context) {
    //Находит в дереве, откуда он стартует ближайший к нему state
    context.findAncestorStateOfType<_ColoredWidgetState>()?.changeColor(pink);
    //Находит в дереве, откуда он стартует последний к нему state
    context
        .findRootAncestorStateOfType<_ColoredWidgetState>()
        ?.changeColor(yellow);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onPressed(context),
      child: Text(press),
    );
  }
}
