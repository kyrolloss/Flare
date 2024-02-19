import 'package:flare/screen/Exercise%20schedule/pro%20Split/choose%20muscle%20direction%20.dart';
import 'package:flare/shared/components/Text.dart';
import 'package:flare/shared/components/color.dart';
import 'package:flare/shared/components/components.dart';
import 'package:flutter/material.dart';

import 'Push _ Pull_legs/choosePushPullLegDirection.dart';

class ExerciseSchedule extends StatelessWidget {
  const ExerciseSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
      
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){navigateTo(context, const choosePushPullLegDirection());},
                  child: Container(
                    height: height*.275,
                    width: width*.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image:const  DecorationImage(image:
                       AssetImage('images/push_pull_leg Exercises.jpg' , ) ,fit: BoxFit.fitWidth,
                      )
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: height*.275,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),

                              color: Colors.black.withOpacity(.7)
                          ),


                        ),
                        Positioned(
                          left: 20,
                          bottom: 20,

                          child: Column(
                            children: [
                              BuildText(text: 'Push - Pull' , color: Colors.yellow[400], bold: true,size: 30,),
                              BuildText(text: 'Legs' , color: Colors.yellow[400], bold: true,size: 30,)

                            ],
                          ),
                        ),

                      ],
                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){navigateTo(context, chooseMuscle());},
                  child: Container(
                    height: height*.275,
                    width: width*.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(image:
                        AssetImage('images/Pro splet.jpg' , ) ,fit: BoxFit.fitWidth,
                        )
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: height*.275,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),

                              color: Colors.black.withOpacity(.7)
                          ),


                        )
                        ,
                        Positioned(
                          left: 20,
                          bottom: 20,

                          child: Row(

                            children: [
                              BuildText(text: 'Pro ' , color: Colors.yellow[400], bold: true,size: 35,),
                              BuildText(text: 'Split' , color: Colors.yellow[400], bold: true,size: 30,)


                            ],
                          ),
                        ),

                      ],
                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height*.275,
                  width: width*.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(image:
                      AssetImage('images/arnold Splet.jpg' , ) ,fit: BoxFit.fitWidth,
                      )
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: height*.275,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                            color: Colors.black.withOpacity(.7)
                        ),


                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,

                        child: Column(
                          children: [
                            BuildText(text: 'Arnold' , color: Colors.yellow[400], bold: true,size: 35,),
                            BuildText(text: 'Split' , color: Colors.yellow[400], bold: true,size: 30,)

                          ],
                        ),
                      ),

                    ],
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height*.275,
                  width: width*.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(image:
                      AssetImage('images/Upper & lower.jpg' , ) ,fit: BoxFit.fitWidth,
                      )
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: height*.275,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                            color: Colors.black.withOpacity(.7)
                        ),


                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,

                        child: Column(
                          children: [
                            BuildText(text: 'Upper &' , color: Colors.yellow[400], bold: true,size: 30,),
                            BuildText(text: 'Lower' , color: Colors.yellow[400], bold: true,size: 30,)

                          ],
                        ),
                      ),

                    ],
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height*.275,
                  width: width*.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(image:
                      AssetImage('images/full body.jpg' ) ,fit: BoxFit.fitWidth,
                      )
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: height*.275,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),

                            color: Colors.black.withOpacity(.7)
                        ),


                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,

                        child: Column(
                          children: [
                            BuildText(text: 'Full' , color: Colors.yellow[400], bold: true,size: 30,),
                            BuildText(text: 'Body' , color: Colors.yellow[400], bold: true,size: 30,)

                          ],
                        ),
                      ),

                    ],
                  ),

                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
