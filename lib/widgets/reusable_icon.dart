import 'package:building_portfolio/utils/dimension_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  const AppIcon({Key? key, required this.icon, this.size = 40, this.iconColor = const Color(0xFFfcf4e4), this.backgroundColor = const Color(0xFF756d54)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),//to make it round
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize16,
      ),
    );
  }
}
