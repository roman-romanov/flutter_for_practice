import 'package:flutter/material.dart';




class IntroContent extends StatelessWidget {
  const IntroContent({
    Key? key,
    this.text,
    this.image }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 31,right: 31),
      child: Column(

        children: [
          Image.asset(image!,
            height: size.height*0.438,
            width: size.width*2.65,
          ),
          Spacer(
            flex: 1,
          ),
          Text(text!,style: TextStyle(fontSize: 22),)
        ],
      ),
    );
  }
}