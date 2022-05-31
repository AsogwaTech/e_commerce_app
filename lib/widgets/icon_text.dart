import 'package:building_portfolio/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

import '../utils/dimension_responsive.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final double? size;
  const IconText({Key? key, required this.iconColor, required this.icon, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size:size /*Dimensions.iconSize24*/),
        SmallText(text: text),
        const SizedBox(width: 5),
      ],

    );
  }
}
