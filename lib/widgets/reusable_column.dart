import 'package:building_portfolio/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/dimension_responsive.dart';
import 'big_text.dart';
import 'icon_text.dart';



class AppColumn extends StatelessWidget {

  final String text; // the name of the food to be passed by the user
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bigText(text: text),
        SizedBox(height: Dimensions.firstSizedBox10),
        Row(
          children: [
            Wrap(// widget for drawing same thing several time
              children: List.generate(5, (index) => Icon(Icons.star, color: Colors.blue, size: 15,)),
            ),
            const SizedBox(width: 5),
            SmallText(text: '4.7'),
            const SizedBox(width: 5),
            SmallText(text: '100'),
            const SizedBox(width: 5),
            SmallText(text: 'comments'),

          ],
        ),
        SizedBox(height: Dimensions.firstSizedBox20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const IconText(iconColor: Colors.orange, icon: Icons.circle_sharp, text: 'Normal'),
            const IconText(iconColor: Colors.blue, icon: Icons.location_on_outlined, text: '2km'),
            IconText(iconColor: Colors.orange.withOpacity(0.5), icon: Icons.access_time_rounded, text: '32min'),
          ],
        ),
      ],
    );
  }
}
