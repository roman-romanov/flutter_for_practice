import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_utils.dart';
import 'intro_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> introData = [
    {
      "text": "Choose Your Desire Product",
      "image": "assets/icons/intro2.png",
    },
    {"text": "Complete your shopping", "image": "assets/icons/intro1.png"},
    {"text": "Get product at your door", "image": "assets/icons/intro3.png"}
  ];

  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(children: [
      Spacer(
        flex: 1,
      ),
      Expanded(
          flex: 4,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: introData.length,
            itemBuilder: (context, index) => IntroContent(
              text: introData[index]["text"],
              image: introData[index]["image"],
            ),
          )),
      Spacer(
        flex: 1,
      ),
      Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < introData.length; i++)
              if (i == currentPage + 1) _skipButton(true),
            Stack(children: [
              if (currentPage != 2)
                Row(
                  children: [
                    for (var i = 0; i < introData.length; i++)
                      if (i == currentPage) buildDot(false) else buildDot(true),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [if (currentPage == 2) _gettingStarted(true)],
              ),
            ]),
            for (int x = 0; x < introData.length; x++)
              if (x == currentPage + 1) _nextButton(true),
          ],
        ),
      )
    ]));
  }

  AnimatedContainer buildDot(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 10 : 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.red[600] : Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Widget _nextButton(bool isVisible) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Next",
        style: TextStyle(color: ColorsUtils.BLACK_COLOR, fontSize: 20),
      ),
    );
  }

  Widget _skipButton(bool isVisible) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Skip",
        style: TextStyle(color: ColorsUtils.BLACK_COLOR, fontSize: 20),
      ),
    );
  }

  Widget _gettingStarted(bool? isVisible) {
    return ElevatedButton(
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 60)),
        backgroundColor: MaterialStateProperty.all(Colors.orange),
      ),
      onPressed: () {},
      child: Text(
        'Getting started',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
  }) : super(key: key);
  final String? text;
  // final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(width: 1)),
        ),
        onPressed: () {},
        child: Text(
          text!,
          style: TextStyle(fontSize: 18, color: ColorsUtils.BACKGROUND_LIGHT),
        ),
      ),
    );
  }
}
