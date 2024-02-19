import 'package:flare/shared/components/Text.dart';
import 'package:flare/shared/components/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../../../model/exercises mode.dart';
import '../../timer Screen/timer Screen.dart';

class ExercisesInformation extends StatelessWidget {
  const ExercisesInformation({Key? key, required this.exercise}) : super(key: key);
  final ExercisesModel exercise;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          toolbarHeight: height*.08,
          leading:
          IconButton( onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const TimerPage();
          },));
          },icon:const Icon(Icons.timer ,size: 30, ),color: AppColor.lightColor,)
          ,
          title: BuildText(
          text: 'Flare',
          bold: true,
          size: 32.5,
          color: AppColor.lightColor,
          letterSpacing: 2,
        ),centerTitle: true,
          actions: [
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: ()
            {
              showDialog(



                context: context,
                builder: (context) {
                return Dialog(
                  backgroundColor: Colors.white, // تعيين لون الخلفية للون الأبيض هنا

                  insetPadding: EdgeInsets.symmetric(horizontal: 16,vertical:height*.3 ),
                  surfaceTintColor: Colors.white,

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                          height: height*.08,
                          width: width*.8,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.red,Colors.red,Colors.white
                                ]
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: BuildText(text: 'Target Muscle' , color: Colors.white,bold: true, ),
                              ),
                            ],
                          )

                        ) ,
                        SizedBox(height: height*.03,),

                        Container(
                          height: height*.08,
                          width: width*.8,
                          decoration: const  BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  CupertinoColors.activeBlue, Colors.lightBlue,Colors.white,Colors.white
                                ]
                            ),
                          ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: BuildText(text: 'Synergists Muscle' , color: Colors.white,bold: true, ),
                                ),
                              ],
                            )

                        ) ,
                        SizedBox(height: height*.03,),

                        Container(
                          height: height*.08,
                          width: width*.8,
                          decoration:  const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xff80F24B), Color(0xff80F24B) ,Colors.lightGreenAccent ,Colors.white,Colors.white,Colors.white ,Colors.white,
                                ]
                            ),
                          ),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: BuildText(text: 'Stabilizers Muscle' , color: Colors.white,bold: true, ),
                              ),
                            ],
                          )

                        ) ,

                      ],
                    ),
                  ),
                );


              },);
          },
            icon:const Icon(Icons.circle_notifications_sharp ,size: 30, ),color: AppColor.lightColor,),
        ),
            IconButton( onPressed: (){},icon:const Icon(Icons.stairs ,size: 30, ),color: AppColor.lightColor,)


        ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height*.08,
                  width: width*.8,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.red,Colors.red,Colors.white
                        ]
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 12),
                        child: SizedBox(
                          height: height*.05,
                          width: width*.65,
                          child: Marquee(

                            text: exercise.targetMuscle,
                            style: const TextStyle(fontSize: 24.0 ,color: Colors.white ,fontWeight: FontWeight.w800,), // حجم النص
                            scrollAxis: Axis.horizontal, // اتجاه الحركة
                            crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص
                            blankSpace: 20.0, // المسافة بين الجمل
                            velocity: 50.0, // سرعة الحركة
                            pauseAfterRound: const Duration(seconds: 1), // وقت التوقف بعد كل دورة
                            startPadding: 10.0, // المسافة الابتدائية من اليمين
                            accelerationDuration: const Duration(seconds: 1), // مدة التسارع
                            accelerationCurve: Curves.linear, // منحنى التسارع
                            decelerationDuration: const Duration(milliseconds: 500), // مدة التباطؤ
                            decelerationCurve: Curves.easeOut, // منحنى التباطؤ
                          ),
                        ),
                      ),
                    ],
                  ),

                ) ,
                SizedBox(height: height*.02,),


                Container(
                  height: height*.08,
                  width: width*.8,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          CupertinoColors.activeBlue, Colors.lightBlue,Colors.white,Colors.white
                        ]
                    ),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 12),
                        child: SizedBox(
                          height: height*.05,
                          width: width*.5,
                          child: Marquee(

                            text: exercise.Synergists,
                            style: const TextStyle(fontSize: 24.0 ,color: Colors.white ,fontWeight: FontWeight.w800,), // حجم النص
                            scrollAxis: Axis.horizontal, // اتجاه الحركة
                            crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص
                            blankSpace: 20.0, // المسافة بين الجمل
                            velocity: 50.0, // سرعة الحركة
                            pauseAfterRound: const Duration(seconds: 1), // وقت التوقف بعد كل دورة
                            startPadding: 10.0, // المسافة الابتدائية من اليمين
                            accelerationDuration: const Duration(seconds: 1), // مدة التسارع
                            accelerationCurve: Curves.linear, // منحنى التسارع
                            decelerationDuration: const Duration(milliseconds: 500), // مدة التباطؤ
                            decelerationCurve: Curves.easeOut, // منحنى التباطؤ
                          ),
                        ),
                      ),
                    ],
                  ),

                ) ,

                SizedBox(height: height*.02,),

                Container(
                  height: height*.08,
                  width: width*.8,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff80F24B), Color(0xff80F24B) ,Colors.lightGreenAccent ,Colors.white,Colors.white,Colors.white ,Colors.white,
                        ]
                    ),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 12),
                        child: SizedBox(
                          height: height*.05,
                          width: width*.5,
                          child: Marquee(

                            text: exercise.secondaryMuscles,
                            style: const TextStyle(fontSize: 24.0 ,color: Colors.white ,fontWeight: FontWeight.w800,), // حجم النص
                            scrollAxis: Axis.horizontal, // اتجاه الحركة
                            crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص
                            blankSpace: 20.0, // المسافة بين الجمل
                            velocity: 50.0, // سرعة الحركة
                            pauseAfterRound:const Duration(seconds: 1), // وقت التوقف بعد كل دورة
                            startPadding: 10.0, // المسافة الابتدائية من اليمين
                            accelerationDuration: const Duration(seconds: 1), // مدة التسارع
                            accelerationCurve: Curves.linear, // منحنى التسارع
                            decelerationDuration: const  Duration(milliseconds: 500), // مدة التباطؤ
                            decelerationCurve: Curves.easeOut, // منحنى التباطؤ
                          ),
                        ),
                      ),
                    ],
                  ),

                ) ,
                SizedBox(height: height*.03,),

                Center(child: BuildText(text: 'Instructions' , color: AppColor.lightColor,bold: true,size: 25,)) ,
                SizedBox(height: height*.025,),
                Center(child: BuildText(text: exercise.instruction , color: AppColor.lightColor,bold: true,size: 25,maxLines: 100,)) ,



              ],
            ),
          ),
        ),
      
      ),
    );
  }
}
