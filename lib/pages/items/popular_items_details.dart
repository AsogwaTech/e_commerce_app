import 'package:building_portfolio/utils/dimension_responsive.dart';
import 'package:building_portfolio/widgets/big_text.dart';
import 'package:building_portfolio/widgets/expandable_item_details.dart';
import 'package:building_portfolio/widgets/reusable_column.dart';
import 'package:building_portfolio/widgets/reusable_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PopularItemDetails extends StatelessWidget {
  const PopularItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // the item image**************************
          Positioned(
            top: Dimensions.topBottom30 + 10,
            left: 0,// starts from the end of the screen and stops at the extreme without space
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularImageHeight/1.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/heart.png'),
                  ),
                ),
              ),
          ),
          //the icons on the top page***********************
          Positioned(
            top: Dimensions.topBottom45,
            left: Dimensions.rightLeft20,
              right: Dimensions.rightLeft20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart),
                ],
              )
          ),
          //the body section**************************************
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularImageHeight - 50, // to scale it up a bit
              child:Container(
                padding: EdgeInsets.only(left: Dimensions.rightLeft20, right: Dimensions.rightLeft20, top: Dimensions.rightLeft20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.borderSmallContainer20),topLeft: Radius.circular(Dimensions.borderSmallContainer20)),
                  //color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: 'Name of Food'),
                    SizedBox(height: Dimensions.firstSizedBox20),
                    bigText(text: 'Introduction'),
                  //the detail section of the item , it consists of a certain text which get hidden at a certain length
                    //Expandable text portion of the app*********************
                    SizedBox(height: Dimensions.firstSizedBox20),
                    Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableItemDetails(text: 'Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy Emeka is a village boy')),
                    ),
                  ],
                ),
              ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.secondScrollableStack120,
        padding: EdgeInsets.only(top: Dimensions.topBottom30,bottom: Dimensions.topBottom30,left: Dimensions.rightLeft20, right: Dimensions.rightLeft20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.borderSmallContainer20,),topRight: Radius.circular(Dimensions.borderSmallContainer20)),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.rightLeft20, bottom: Dimensions.rightLeft20,right: Dimensions.rightLeft20,left: Dimensions.rightLeft20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.borderSmallContainer20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: Colors.grey,),
                  SizedBox(width: Dimensions.firstSizedBox10),
                  bigText(text: '0'),
                  SizedBox(width: Dimensions.firstSizedBox10),
                  Icon(Icons.add, color: Colors.grey,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.rightLeft20, bottom: Dimensions.rightLeft20,right: Dimensions.rightLeft20,left: Dimensions.rightLeft20),
              child: bigText(text: '\$10 | Add to Cart', color: Colors.white),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.borderSmallContainer20),
                color: Colors.green.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
