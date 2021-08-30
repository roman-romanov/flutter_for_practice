import 'package:flutter/material.dart';
//Самописный виджет.
class CollapseAnimatedBox extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final bool isCollapse;
  const CollapseAnimatedBox(
      {Key? key,
      required this.duration,
      required this.child,
      required this.isCollapse})
      : super(key: key);

  @override
  _CollapseAnimatedBoxState createState() => _CollapseAnimatedBoxState();
}

class _CollapseAnimatedBoxState extends State<CollapseAnimatedBox>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 350), vsync: this);
    super.initState();
    if (!widget.isCollapse) {
      _animationController.value = 1;
    }
  }

  @override
  void didUpdateWidget(CollapseAnimatedBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCollapse == widget.isCollapse) return;
    if (widget.isCollapse) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: _animationController, curve: Curves.linear),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
