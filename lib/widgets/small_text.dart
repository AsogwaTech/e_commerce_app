import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final Color? color;// optional
  final String text;
  double size;
  double height;// For default space between each text
  //TextOverflow overflow;
  SmallText({Key? key, this.color, required this.text,this.height = 1.2, /*this.overflow = TextOverflow.ellipsis,*/ this.size = 12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //overflow: overflow,
      style: TextStyle(
        color: color,
        height: height,
        fontWeight: FontWeight.w300,
        fontSize: size,
      ),
    );
  }
}