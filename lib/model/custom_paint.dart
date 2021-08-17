import 'package:flutter/material.dart';

class CustomPaintWidget extends StatefulWidget {
  final String? title;
  const CustomPaintWidget({Key? key, this.title}) : super(key: key);

  @override
  _CustomPaintWidgetState createState() => _CustomPaintWidgetState();
}

class _CustomPaintWidgetState extends State<CustomPaintWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.amber)),
              child: CustomPaint(
                painter: Painter(),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () {},
                child: Text('Splash Color Yoq!!!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var backgroundPaint = Paint();
    backgroundPaint.color = Colors.black;
    backgroundPaint.style = PaintingStyle.fill;
    backgroundPaint.strokeWidth = 5.0;
    canvas.drawOval(Offset.zero & size, backgroundPaint);

    final fillSpacePaint = Paint();
    fillSpacePaint.color = Colors.lightGreen.shade600;
    fillSpacePaint.style = PaintingStyle.stroke;
    fillSpacePaint.strokeWidth = 5.0;
    canvas.drawArc(Offset.zero & size, 15, 5, true, fillSpacePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
