import 'dart:math';

import 'package:flutter/material.dart';

class CustomPainWidget extends StatefulWidget {
  final String? title;
  const CustomPainWidget({Key? key, this.title}) : super(key: key);

  @override
  _CustomPainWidgetState createState() => _CustomPainWidgetState();
}

class _CustomPainWidgetState extends State<CustomPainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 100,
        height: 100,
        child: RadialPercentWidget(
          percent: 0.75,
          fillColor: Colors.black,
          lineFillColor: Colors.lightGreen.shade400,
          lineVoidColor: Colors.grey.withOpacity(0.4),
          liineWidth: 5.0,
          child: Text(
            '58%',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      )),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  final double percent;
  final Widget child;
  final Color fillColor;
  final Color lineFillColor;
  final lineVoidColor;
  final double liineWidth;
  const RadialPercentWidget(
      {Key? key,
      required this.percent,
      required this.child,
      required this.fillColor,
      required this.lineFillColor,
      required this.lineVoidColor,
      required this.liineWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
            painter: MyPainter(
          percent: percent,
          fillColor: fillColor,
          lineFillColor: lineFillColor,
          lineVoidColor: lineVoidColor,
          liineWidth: liineWidth,
          child: child,
        )),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Center(child: child),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Widget child;
  final Color fillColor;
  final Color lineFillColor;
  final lineVoidColor;
  final double liineWidth;
  MyPainter({
    required this.percent,
    required this.child,
    required this.fillColor,
    required this.lineFillColor,
    this.lineVoidColor,
    required this.liineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);

    drawBackground(canvas, size);

    drawVoidLine(canvas, arcRect);

    drawFillLine(canvas, arcRect);
  }

  void drawFillLine(Canvas canvas, Rect arcRect) {
    var fillPaint = Paint();
    fillPaint.color = lineFillColor;
    fillPaint.style = PaintingStyle.stroke;
    fillPaint.strokeWidth = liineWidth;
    fillPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      arcRect,
      //0 смещение на ноль
      -pi / 2,
      //замыкаем круг и умножаем на проценты
      pi * 2 * percent,
      false,
      fillPaint,
    );
  }

  void drawVoidLine(Canvas canvas, Rect arcRect) {
    var filledSpace = Paint();
    filledSpace.color = lineVoidColor;
    filledSpace.style = PaintingStyle.stroke;
    filledSpace.strokeWidth = liineWidth;
    canvas.drawArc(
      arcRect,
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      filledSpace,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final backgroundPaint = Paint();
    backgroundPaint.color = fillColor;
    backgroundPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundPaint);
  }

  Rect calculateArcsRect(Size size) {
    final linePadding = 4;
    final offset = liineWidth / 2 * linePadding;
    final arcRect = Offset(offset, offset) &
        Size(size.height - offset * 2, size.width - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
