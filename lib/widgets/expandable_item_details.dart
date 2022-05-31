import 'package:building_portfolio/utils/dimension_responsive.dart';
import 'package:building_portfolio/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableItemDetails extends StatefulWidget {

  final String text;


  const ExpandableItemDetails({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableItemDetailsState createState() => _ExpandableItemDetailsState();
}

class _ExpandableItemDetailsState extends State<ExpandableItemDetails> {

  late String firstSectionText;
  late String secondSectionText;
  bool hideMe = true;
  double textHeight = Dimensions.screenHeight/4.9; // if the total length of the text is greater than this screen height, the remaining will be hidden

  @override
  void initState(){
    super.initState();
    if (widget.text.length > textHeight){
      firstSectionText = widget.text.substring(0,textHeight.toInt());
      secondSectionText = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    }
    else {
      firstSectionText = widget.text;
      secondSectionText = '';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondSectionText.isEmpty ? SmallText(height:1.6,size: Dimensions.smallText16,text: firstSectionText) : Column(
        children: [
          SmallText(height:1.6,size: Dimensions.smallText16,text: hideMe?(firstSectionText + '...'):(firstSectionText + secondSectionText) ),
          InkWell(
            onTap:() {
               //toggling the dropdown icon thereby making it false will fall back to the second condition of showing the second section
              setState(() {
                hideMe = !hideMe;
              });
            },
            child: Row(
              children: [
                SmallText(text: hideMe ? 'show more' : 'show less'),
                Icon(hideMe ? Icons.arrow_drop_down : Icons.arrow_drop_up, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
