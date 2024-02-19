import 'dart:async';

import 'package:flare/cubit/App%20cubit/app_cubit.dart';
import 'package:flare/screen/Exercise%20schedule/Exercise%20schedule.dart';
import 'package:flare/screen/creatine%20page/creatine%20two.dart';
import 'package:flare/screen/progres/progress%20Page.dart';
import 'package:flare/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/timer cubit/timer_cubit.dart';
import '../../dataBase/data.dart';
import '../../shared/lucky Wheel.dart';
import '../../shared/components/Text.dart';
import '../../shared/components/color.dart';
import '../Exercise schedule/show schedule.dart';
import '../exercises page/choseMuscle.dart';

class mainLayout extends StatefulWidget {
  const mainLayout({Key? key}) : super(key: key);

  @override
  State<mainLayout> createState() => _mainLayoutState();
}

// ignore: camel_case_types
class _mainLayoutState extends State<mainLayout> {
  List<double> data = [];
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }







    TextEditingController weightController = TextEditingController();
    TextEditingController repsController = TextEditingController();
    bool isFailure = false;
    @override
    Widget build(BuildContext context) {
      List iconsList = [
        'images/dumbbell.png',
        'images/protein.png',
        'images/stairs.png',
        'images/abs.png'
      ];
      List<String> iconsNames = [
        'Exercises',
        'Creatine Alarm',
        'Progress',
        'schedule'

      ];
      var height = MediaQuery
          .of(context)
          .size
          .height;
      var width = MediaQuery
          .of(context)
          .size
          .width;
      return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {

          var cubit = AppCubit.get(context);
          var cubit2 = TimerCubit.get(context);

          return SafeArea(

            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,

                title: BuildText(
                  text: 'Flare',
                  bold: true,
                  size: 30,
                  color: Colors.black,
                  letterSpacing: 2,
                ),
                centerTitle: true,


                elevation: 0,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, right: 5, left: 5, bottom: 5),
                  child: Container(
                    height: height * .15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)

                    ),
                  ),
                ),

              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .15,
                      child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (index == 2) {
                                    navigateTo(context, const ProgressPage());
                                  }
                                  else if (index == 0) {
                                    navigateTo(context, const choseMuscle());
                                  }

                                  else if (index == 1) {
                                    navigateTo(context, const creatinePage2());
                                  }

                                  else if (index == 3) {
                                    navigateTo(context, const ExerciseSchedule());
                                  }




                                },
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                        maxRadius: 35,


                                        backgroundColor: Colors.white,
                                        child: Image.asset(iconsList[index])
                                    ),
                                    Spacer(),
                                    BuildText(text: iconsNames[index],
                                      size: 15,
                                      bold: true,)
                                  ],
                                ),

                              )
                          );
                        },),
                    ),


                    SizedBox(
                      height: height * .07,
                    ),


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
                                    BuildText(text: 'PULL SCHEDULE' , color: Colors.yellow[400], bold: true,size: 20,),


                                  ],
                                ),
                              ),

                            ],
                          ),

                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){navigateTo(context, showSchedule(exercise: PushExercise2,));},

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
                                left: 20,
                                bottom: 20,

                                child: Row(

                                  children: [
                                    BuildText(text: 'PUSH SCHEDULE' , color: Colors.yellow[400], bold: true,size: 20,),


                                  ],
                                ),
                              ),

                            ],
                          ),

                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .07,
                    ),
                    GestureDetector(
                      onTap: (){

                        showDialog(context: context, builder: (context) {
                         return Dialog(
                            child: Container(
                              height: height*.35,
                              width: width*.6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: BuildText(text: 'Choose Muscle' , color: AppColor.lightColor,wordSpacing: 2,size: 25,bold: true),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: (){

                                              cubit.Changenumber(cubit.numberOfMuscle, 1);
                                              cubit.changeLuckyWheelExercises(cubit.luckyExersices, cubit.chest);

                                              Navigator.pop(context);
                                              },
                                            child: Container(
                                              height: height*.035,
                                              width: width*.2,
                                              decoration: BoxDecoration(
                                                color: AppColor.lightColor,
                                                borderRadius: BorderRadius.circular(25)
                                              ),
                                              child: Center(child: BuildText(text: 'Chest' , bold: true,size: 15,)),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              cubit.Changenumber(cubit.numberOfMuscle, 2);
                                              cubit.changeLuckyWheelExercises(cubit.luckyExersices, cubit.back);

                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: height*.035,
                                              width: width*.2,
                                              decoration: BoxDecoration(
                                                  color: AppColor.lightColor,
                                                  borderRadius: BorderRadius.circular(25)
                                              ),
                                              child: Center(child: BuildText(text: 'Back' , bold: true,size: 15,)),
                                            ),
                                          ),



                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          cubit.Changenumber(cubit.numberOfMuscle, 3);
                                          cubit.changeLuckyWheelExercises(cubit.luckyExersices, cubit.shoulder);

                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: height*.035,
                                          width: width*.2,
                                          decoration: BoxDecoration(
                                              color: AppColor.lightColor,
                                              borderRadius: BorderRadius.circular(25)
                                          ),
                                          child: Center(child: BuildText(text: 'Shoulder' , bold: true,size: 15,)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:GestureDetector(
                                        onTap: (){
                                          cubit.Changenumber(cubit.numberOfMuscle, 4);
                                          cubit.changeLuckyWheelExercises(cubit.luckyExersices, cubit.biceps);

                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: height*.035,
                                          width: width*.2,
                                          decoration: BoxDecoration(
                                              color: AppColor.lightColor,
                                              borderRadius: BorderRadius.circular(25)
                                          ),
                                          child: Center(child: BuildText(text: 'Biceps' , bold: true,size: 15,)),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: (){
                                              cubit.Changenumber(cubit.numberOfMuscle, 5);
                                              cubit.changeLuckyWheelExercises(cubit.luckyExersices, cubit.triceps);


                                              Navigator.pop(context);

                                            },
                                            child: Container(
                                              height: height*.035,
                                              width: width*.2,
                                              decoration: BoxDecoration(
                                                  color: AppColor.lightColor,
                                                  borderRadius: BorderRadius.circular(25)
                                              ),
                                              child: Center(child: BuildText(text: 'Triceps' , bold: true,size: 15,)),
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: (){
                                              cubit.Changenumber(cubit.numberOfMuscle, 6);
                                              cubit.changeLuckyWheelExercises(cubit.luckyExersices, cubit.Legs);


                                              Navigator.pop(context);

                                            },
                                            child: Container(
                                              height: height*.035,
                                              width: width*.2,
                                              decoration: BoxDecoration(
                                                  color: AppColor.lightColor,
                                                  borderRadius: BorderRadius.circular(25)
                                              ),
                                              child: Center(child: BuildText(text: 'Legs' , bold: true,size: 15,)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },);
                        cubit.startPlaying = true;
                      },
                      child: Container(
                        height: height*.05,
                        width: width*.3,
                        decoration: BoxDecoration(
                          color: const Color(0xffAEEDBF),
                          borderRadius: BorderRadius.circular(50),



                        ),
                        child: Center(child: BuildText(text: 'Start Playing',
                          color: Colors.black.withOpacity(.8),bold: true,)),
                      ),
                    ),
                   cubit.startPlaying == true || cubit.numberOfMuscle> 0 ?

                   SizedBox(
                        height: height*.5,
                        width: width*.8,
                        child: LuckyWheel())
                       : const SizedBox()


                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
