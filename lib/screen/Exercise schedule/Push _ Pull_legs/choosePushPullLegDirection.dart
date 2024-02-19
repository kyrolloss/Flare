import 'package:flare/screen/detailed%20exrecises/detailed%20back/Lumbar.dart';
import 'package:flare/screen/detailed%20exrecises/detailed%20back/lats.dart';
import 'package:flare/screen/detailed%20exrecises/detailed%20back/trapezius.dart';
import 'package:flare/screen/detailed%20exrecises/detailed%20back/upper%20back.dart';
import 'package:flare/shared/components/Text.dart';
import 'package:flare/shared/components/color.dart';
import 'package:flare/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/App cubit/app_cubit.dart';
import 'Pull.dart';
import 'Push.dart';

// ignore: camel_case_types
class choosePushPullLegDirection extends StatelessWidget {
  const choosePushPullLegDirection({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> exercises = [
'push-up.png',
      'pull-up.png',
      'running.png'
    ];
    List<String> exercisesName = [
      'Push',
      'Pull',
      'Legs'
    ];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BuildText(text: 'Push Pull Legs',size: 35,bold: true,),
              SizedBox(
                height: height*.6,
                child: GridView.builder(
                  itemCount: 3,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        if(index == 0){
                          navigateTo(context, const PushSchedule());
                        }
                        if(index == 1){
                          navigateTo(context, const PullSchedule());
                        }

                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColor.lightColor.withOpacity(.3),
                            maxRadius: 40,
                            minRadius: 0,
                            child: Image.asset('images/${exercises[index]}'),
                          ),
                          SizedBox(
                            height: height*.005,
                          ),
                          Center(child: BuildText(text: exercisesName[index],size: 25,bold: true,))
                        ],
                      ),
                    );
                  },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
