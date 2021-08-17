import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String? title;
  MainPage({Key? key, this.title});
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.95;
    final bottomHeight = MediaQuery.of(context).size.height * 0.1;
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return Scaffold(
          body: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      child: Container(
                    width: screenWidth,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Привет!',
                              style: TextStyle(
                                  fontSize: 45, fontWeight: FontWeight.w900)),
                          SizedBox(height: 15),
                          Text('мы отправили на него код подтверждения'),
                          SizedBox(height: 30),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment(0, 0.9),
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20, right: 15),
                        width: 240,
                        height: 110,
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Далее',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.red,
                  ),
                ],
              ),
              Positioned(
                left: 30,
                bottom: bottomHeight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Забыли пароль?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 1.0, size.height * 0.033);
    path.quadraticBezierTo(size.width * 0.98, size.height * 0.23,
        size.width * 0.90, size.height * 0.23);
    path.quadraticBezierTo(size.width * 0.82, size.height * 0.23,
        size.width * 0.60, size.height * 0.23);
    path.quadraticBezierTo(size.width * 0.51, size.height * 0.23,
        size.width * 0.51, size.height * 0.42);
    path.quadraticBezierTo(size.width * 0.51, size.height * 0.62,
        size.width * 0.60, size.height * 0.62);
    path.quadraticBezierTo(size.width * 0.82, size.height * 0.62,
        size.width * 0.90, size.height * 0.62);
    path.quadraticBezierTo(size.width * 0.98, size.height * 0.62,
        size.width * 1.0, size.height * 0.82);
    path.lineTo(size.width * 1.0, size.height * 0.033);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
