

import 'package:building_portfolio/utils/dimension_responsive.dart';
import 'package:flutter/cupertino.dart';

class imageContainer extends StatelessWidget {

  final String image;
  final Color? color;


  const imageContainer({Key? key, required this.image, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: Dimensions.secondScrollableStack120,
      width: Dimensions.secondScrollableStack120,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.borderSmallContainer20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
