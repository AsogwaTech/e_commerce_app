import 'package:building_portfolio/pages/my_home_page/sliddable_portion.dart';
import 'package:building_portfolio/utils/dimension_responsive.dart';
import 'package:building_portfolio/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/small_text.dart';


class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      body: Column(
        children: [
          // showing the body header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.topBottom45, bottom: Dimensions.topBottom15),
              padding: EdgeInsets.only(left: Dimensions.rightLeft20, right: Dimensions.rightLeft20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      bigText(text: 'Country', color: Colors.black),// reusable text for big text
                      Row(
                        children: [
                          SmallText(text:'City', color: Colors.red),
                          const Icon(Icons.arrow_drop_down_circle_rounded),
                        ],
                      ),

                    ],
                  ),
                  Container(
                    width: Dimensions.rightLeft45,
                    height: Dimensions.topBottom45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.borderSmallContainer20),
                      color: Colors.blue .withOpacity(0.6),

                    ),
                    child: Icon(Icons.search, color: Colors.white,size: Dimensions.iconSize24,),
                  ),
                ],
              ),
            ),
          ),
          //showing the sliddable portion of the page
          Expanded(
              child: SingleChildScrollView(
                  child: SliddablePage(),
              ),
          ),
        ],
      ),
    );
  }
}