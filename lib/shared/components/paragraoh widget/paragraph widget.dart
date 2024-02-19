import 'package:flutter/material.dart';

import '../Text.dart';
import '../color.dart';
class ParagraphWidget extends StatefulWidget {
  @override
  _ParagraphWidgetState createState() => _ParagraphWidgetState();
}

class _ParagraphWidgetState extends State<ParagraphWidget> {
  bool _showFullText = false;

  String getDisplayedText(Text1 , Text2) {
    if (_showFullText) {
      return Text1;
    } else {
      return Text2;
    }
  }

  String orderText1 = 'Chicken marinated in a spiced yogurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice';
  String orderText2 ='Chicken marinated in a spiced yogurt is placed in a large pot, then layered with fried on...' ;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildText(text: getDisplayedText( orderText1
        ,orderText2
        ),maxLines: 4, wordSpacing: 6,bold: true,color: Colors.black26,),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            setState(() {
              _showFullText = !_showFullText;
            });
          },
          child:BuildText(
            text: _showFullText ? 'see less' : 'see more' ,bold:true,color: AppColor.secondColor,
          )
          // Text(_showFullText ? 'See less' : 'See more',),


        ),
      ],
    );
  }
}







