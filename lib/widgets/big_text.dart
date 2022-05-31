import 'package:building_portfolio/utils/dimension_responsive.dart';
import 'package:flutter/cupertino.dart';

class bigText extends StatelessWidget {
  final Color? color;// optional
  final String text;
  double size;
  TextOverflow overflow;
   bigText({Key? key, this.color, required this.text, this.overflow = TextOverflow.ellipsis, this.size = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,// when the text is more than one line, it should ellipse
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontSize: size == 0 ? Dimensions.bigTextSize20 : size,// to take care of hardcoded size
      ),
    );
  }
}
