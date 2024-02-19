// ignore_for_file: camel_case_types

import 'package:flare/cubit/App%20cubit/app_cubit.dart';
import 'package:flare/screen/Exercise%20schedule/pro%20Split/arms.dart';
import 'package:flare/screen/Exercise%20schedule/pro%20Split/back&%20bicep.dart';
import 'package:flare/screen/Exercise%20schedule/pro%20Split/chest%20&%20tri.dart';
import 'package:flare/screen/Exercise%20schedule/pro%20Split/legs.dart';
import 'package:flare/screen/Exercise%20schedule/pro%20Split/shoulder.dart';
import 'package:flare/shared/components/color.dart';
import 'package:flare/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/Text.dart';
import '../../detailed exrecises/detailed back/chose back direction.dart';
import '../../detailed exrecises/detailed chest/choose chest direction.dart';
import '../../detailed exrecises/detailed shoulder/chose shoulder direction.dart';
import '../../detailed exrecises/detalied Arms/chose arms direction.dart';
import '../../detailed exrecises/legs detailed/choose leg direction.dart';



class chooseMuscle extends StatelessWidget {

  List <String>names = ['Chest & Triceps' , 'Back & Biceps' , 'Shoulder','Arms' ,'Legs'];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: BuildText(
          text: 'Exercises',
          bold: true,
          size: 30,
          color: Colors.black,
          letterSpacing: 2,
        ),
        centerTitle: true,


        elevation: 0,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 10.0,right: 5,left: 5,bottom: 5),
          child: Container(
            height: height*.15,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)

            ),
          ),
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.error_outline,color: AppColor.primeColor,),
                SizedBox(
                  width: width*.02,
                ),

              ],
            ),
          ),

          SizedBox(
            height: height*.6,
            child: GridView.builder(
              itemCount: names.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    if (index == 0){
                      navigateTo(context ,   const chestAndTri());
                    }
                    else if (index == 1){
                      navigateTo(context , const  backAndBicep());
                    }

                    else if (index == 4){
                      navigateTo(context , const  Legs());
                    }
                    else if (index == 3){
                      navigateTo(context , const  arms());
                    }
                    else if (index == 2){
                      navigateTo(context , const  shoulder());
                    }

                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.lightColor.withOpacity(.25),
                        maxRadius: 40,
                        minRadius: 0,
                        child: Image.asset('images/${cubit.exercisesImages[index]}'),

                      ),
                      Center(child: BuildText(text: names[index],size: 20,bold: true,))
                    ],
                  ),
                );
              },),
          ),

        ],
      ),
    );
  }
}
