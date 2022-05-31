// be able to scroll left and right, contains stack of items, we are going to make use of pageabuilder for the sliddable portion
import 'package:building_portfolio/widgets/big_text.dart';
import 'package:building_portfolio/widgets/icon_text.dart';
import 'package:building_portfolio/widgets/reusable_column.dart';
//import 'package:building_portfolio/widgets/image_container.dart';
import 'package:building_portfolio/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';



import '../../utils/dimension_responsive.dart';


class SliddablePage extends StatefulWidget {
  const SliddablePage({Key? key}) : super(key: key);

  @override
  _SliddablePageState createState() => _SliddablePageState();
}

class _SliddablePageState extends State<SliddablePage> {
  PageController pageController = PageController(viewportFraction: 0.85);// for allowing us see the left and right of the scrollable at the same time
  @override

  var _scrollPageValue = 0.0;// for the purpose of zooming in zooming out
  double _scaleFactor = 0.8;// the value of the height of the previous or next page in %
  double _height = Dimensions.firstScrollableStack220;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _scrollPageValue = pageController.page!;
      });
    });
  }

  //try dispose the page number as you leave the page to avoid memory leak

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // sliding section of the app **************
          Container(
      //color: Colors.green,
      // margin: EdgeInsets.only(top: 20,left: 10, right: 10),
             height: Dimensions.parentContainer320,
             child: PageView.builder(
                 controller: pageController,
                 itemCount: 5,
                 itemBuilder: (context, index){
                  return _buildScroll(index);// the function that will build the scrollable part of our app
          }),
    ),
          // dots indicator in action****************
          DotsIndicator(
              dotsCount: 5,
              position: _scrollPageValue,
              decorator: DotsDecorator(
                activeColor: Colors.blue,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),
        // The header and scrolling portion of the app *************
        SizedBox(height: Dimensions.topBottom30),
        //container for the header section of the app
        Container(
          margin: EdgeInsets.only(left: Dimensions.rightLeft30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              bigText(text: 'Popular'),
              SizedBox(width: Dimensions.firstSizedBox10),
              Container(
                margin:const EdgeInsets.only(bottom: 3) ,
                  child: bigText(text: '.', color: Colors.grey,),
              ),
              Container(
                margin:const EdgeInsets.only(bottom: 2) ,
                child: SmallText(text: 'Food pairing',color: Colors.grey,),
              ),
              SizedBox(width: Dimensions.firstSizedBox10),
            ],
          ),
        ),
        //the scrollable portion making use of listview
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
            itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.only(left: Dimensions.rightLeft20, right: Dimensions.rightLeft20, bottom: Dimensions.topBottom15, top: Dimensions.topBottom15),
            child: Row(
              children: [
                //container holding the image **************************
                Container(
                  height: Dimensions.secondScrollableStack120,
                  width: Dimensions.secondScrollableStack120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.borderSmallContainer20),
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/performance.png'),
                    ),
                  ),
                ),
                // the text section ***************************
                Expanded(
                  child: Container(
                    height: Dimensions.topBottom100, //******
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.borderSmallContainer20),bottomRight: Radius.circular(Dimensions.borderSmallContainer20)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimensions.rightLeft10, right: Dimensions.rightLeft10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          bigText(text: 'Nutritious food bla bla bla bla bla bla'),
                          SizedBox(height: Dimensions.topBottom10),
                          SmallText(text: 'with bla bla bla bla '),
                          SizedBox(height: Dimensions.topBottom10),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              const IconText(iconColor: Colors.orange, icon: Icons.circle_sharp, text: 'Normal',size: 15,),
                              const IconText(iconColor: Colors.blue, icon: Icons.location_on_outlined, text: '2km', size: 15,),
                              IconText(iconColor: Colors.orange.withOpacity(0.5), icon: Icons.access_time_rounded, text: '32min', size: 15,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // contents of the sliding portion of the app ************
  Widget _buildScroll(int index){

    Matrix4 matrix = Matrix4.identity();//for scaling in and out using the page number. It consist of x,y,z coordinate in you can play around with to bring the effect you want.
    if (index == _scrollPageValue.floor()){
      var currScale = 1 - ((_scrollPageValue - index)*(1 - _scaleFactor));// always return 1 that is 100% at the time the page value equals the index
      var heightChange = _height * (1 - currScale)/2;// Still maintain its original height for index == _scrollPageValue

      matrix = Matrix4.diagonal3Values(1, currScale, 1) ..setTranslationRaw(0, heightChange, 0);//after the scaling is done, we now translate or change position
    }
    else if (index == _scrollPageValue + 1){// takes care of next page slide when both are in the same page
      var currScale = _scaleFactor + ((_scrollPageValue - index * 1) * (1 - _scaleFactor));//this will now return 80% of the next slide height making it to appear smaller than the current page view
      var heightChange = _height * (1 - currScale)/2;// returns 0.1*height as currScale equals 0.8
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1) ..setTranslationRaw(0, heightChange, 0);
    }
    else if (index == _scrollPageValue - 1){// takes care of previous slide page slide when both are in the same page
      var currScale = 1 - ((_scrollPageValue - index)*(1 - _scaleFactor));//this will now return 80% of the next slide height making it to appear smaller than the current page view
      var heightChange = _height * (1 - currScale)/2;// returns 0.1*height as currScale equals 0.8
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1) ..setTranslationRaw(0, heightChange, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor)/2, 0);

    }


    //to see the effect of the scaling, wrap the widget being applied to in transform widget
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
        Container(
        height: Dimensions.firstScrollableStack220,
        margin:EdgeInsets.only(left: Dimensions.rightLeft10, right: Dimensions.rightLeft10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.borderBigContainer30),
          color: index.isEven ? Colors.blue.withOpacity(0.5): Colors.blue.withOpacity(0.5),
          image: const DecorationImage(
            //fit: BoxFit.cover,
            image: AssetImage('assets/heart.png'),
          ),
        ),
      ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.secondScrollableStack120,
              margin: EdgeInsets.only(left: Dimensions.rightLeft30, right: Dimensions.rightLeft30, bottom: Dimensions.topBottom30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.borderSmallContainer20),
                color: index.isEven ? Colors.white.withOpacity(0.9): Colors.white.withOpacity(0.9),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    offset: Offset(0, 6),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ]
              ),
              child: Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(Dimensions.borderSmallContainer20),
                // ),
                padding: EdgeInsets.only(top: Dimensions.paddingTopBottom10, right: 15,left: 15),
                child: AppColumn(text: 'Name of the food/items',),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
