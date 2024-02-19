import 'package:flutter/material.dart';

import '../../../model/exercises mode.dart';
import '../../../shared/animation circle/container.dart';
import '../../../shared/components/color.dart';

class ExercisesGif extends StatelessWidget {
  final ExercisesModel exercise;

  const ExercisesGif({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height*.1,
          ),

          Container(
            height: height*.3,
            width: width*.7,
            decoration:  BoxDecoration(
                image: DecorationImage(image: AssetImage('images/${exercise.gif}'))
            ),

          ),
          SizedBox(
            height: height*.1,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(exercise.name, style: TextStyle(letterSpacing: 2,color: AppColor.lightColor,fontWeight: FontWeight.w900 ,fontSize: 20 ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20 , right: 20 , left: 20),
            child: Text(exercise.shortDescription, style: TextStyle(color: AppColor.lightColor,fontWeight: FontWeight.w900 ,fontSize: 15 ),),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: height*.2,
                  width: width*.3,
                  child: const Image(image: AssetImage('images/fast-backward.gif'))),


              SizedBox(
                  height: height*.2,
                  width: width*.3,

                  child: const Image(image: AssetImage('images/fast-forward.gif')))
            ],
          )

        ],
      ),
    );
  }
}
