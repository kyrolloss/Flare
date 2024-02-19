import 'package:flare/shared/components/Text.dart';
import 'package:flare/shared/components/color.dart';
import 'package:flare/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../../dataBase/data.dart';
import '../show schedule.dart';

class PullSchedule extends StatelessWidget {
  const PullSchedule({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){navigateTo(context, showSchedule(exercise: PullExercises1,));},

                  child: Container(
                    height: height*.275,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(image:
                        AssetImage('images/Push Pull1.jpg') ,fit: BoxFit.fitWidth,
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
                          right: 20,
                          bottom: 20,

                          child: Column(
                            children: [
                              BuildText(text: 'Schedule 1' , color: Colors.yellow[400], bold: true,size: 30,),


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
                  onTap: (){navigateTo(context, showSchedule(exercise: PullExercises2,));},

                  child: Container(
                    height: height*.275,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(image:
                        AssetImage('images/Push Pull2.jpg' , ) ,fit: BoxFit.fitWidth,
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
                          right: 20,
                          bottom: 20,

                          child: Row(

                            children: [
                              BuildText(text: 'Schedule 2' , color: Colors.yellow[400], bold: true,size: 30,),


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
                  onTap: (){navigateTo(context, showSchedule(exercise: PullExercises3,));},

                  child: Container(
                    height: height*.275,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(image:
                        AssetImage('images/Push Pull3.jpg' , ) ,fit: BoxFit.fitWidth,
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
                          right: 20,
                          bottom: 20,

                          child: Column(
                            children: [
                              BuildText(text: 'Schedule 3' , color: Colors.yellow[400], bold: true,size: 30,),

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
                  onTap: (){navigateTo(context, showSchedule(exercise: PullExercises4,));},

                  child: Container(

                    height: height*.275,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(image:
                        AssetImage('images/Push Pull4.jpg' , ) ,fit: BoxFit.fitWidth,
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
                          right: 20,
                          bottom: 20,

                          child: Column(
                            children: [
                              BuildText(text: 'Schedule 4' , color: Colors.yellow[400], bold: true,size: 30,),

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
                  onTap: (){navigateTo(context, showSchedule(exercise: PullExercises5,));},

                  child: Container(
                    height: height*.275,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(image:
                        AssetImage('images/Push Pull5.jpg' ) ,fit: BoxFit.fitWidth,
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
                          right: 20,
                          bottom: 20,

                          child: Column(
                            children: [
                              BuildText(text: 'Schedule 5' , color: Colors.yellow[400], bold: true,size: 30,),

                            ],
                          ),
                        ),

                      ],
                    ),

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
