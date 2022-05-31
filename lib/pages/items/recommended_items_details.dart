//import 'dart:html';

import 'package:building_portfolio/utils/dimension_responsive.dart';
import 'package:building_portfolio/widgets/big_text.dart';
import 'package:building_portfolio/widgets/expandable_item_details.dart';
import 'package:flutter/material.dart';

class RecommendedItemDetail extends StatelessWidget {
  const RecommendedItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(// note that scaffold is not a good widget for parenting
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(// this appears as an app bar but it is scrollable
            toolbarHeight: 60,// To avoid cutting of some edges of the icons at the top
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.clear),
                Icon(Icons.shopping_cart),

              ],
            ),
            bottom: PreferredSize(// At certain height, i want a text to be showing
              preferredSize: Size.fromHeight(20),// The amount of pixels to be drawn down from the appbar
              child: Container(
                //color: Colors.white,
                child: Center(child: bigText(text: 'Name of the item')),
                width: double.maxFinite,
                padding: EdgeInsets.only(bottom: 10, top: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.borderSmallContainer20), topLeft: Radius.circular(Dimensions.borderSmallContainer20)),
                ),
              ),
            ),
            pinned: true,// to make the pics to stuck at the default appbar height
            backgroundColor: Colors.red,
            expandedHeight: 300,// making the sliver to be scrollable from that particular amount of time
           flexibleSpace: FlexibleSpaceBar(// what should take over the whole height as specified
             background: Image.asset('assets/heart.png',
             width: double.maxFinite,
             fit: BoxFit.cover,),
           ),
          ),
          SliverToBoxAdapter(// container like
           child: Column(
             children: [
               Container(
                 child: ExpandableItemDetails(text: 'John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy v John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy John is a village boy',),
               margin: EdgeInsets.only(left: Dimensions.rightLeft20, right: Dimensions.rightLeft20),
               ),
             ],
           ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,// Takes the minimum size at the buttom
        children: [
          Container(
            padding: EdgeInsets.only(left: Dimensions.rightLeft20 * 2, right: Dimensions.rightLeft20 * 2, top: Dimensions.topBottom10, bottom: Dimensions.topBottom10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.rightLeft20 /2, bottom: Dimensions.rightLeft20 /2,right: Dimensions.rightLeft20 /2,left: Dimensions.rightLeft20 /2),
                    child: Icon(Icons.remove, color: Colors.white,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.borderSmallContainer20),
                  color: Colors.redAccent,
                ),
                ),
                bigText(text: '\$12.10' + '  X  ' + '  0  ', size: Dimensions.bigTextSize26),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.rightLeft20 /2, bottom: Dimensions.rightLeft20 /2,right: Dimensions.rightLeft20 /2,left: Dimensions.rightLeft20 /2),
                    child: Icon(Icons.add, color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.borderSmallContainer20),
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
          Container(
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
                    color: Colors.redAccent,
                  ),
                  child: Icon(Icons.favorite, color: Colors.white,),
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
        ],
      ),
    );
  }
}
