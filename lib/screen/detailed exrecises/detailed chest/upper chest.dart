import 'package:flare/dataBase/data.dart';
import 'package:flare/screen/exercises%20page/exercises%20instruction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/App cubit/app_cubit.dart';
import '../../../../shared/components/Text.dart';
import '../../../../shared/components/components.dart';

class UpperChest extends StatelessWidget {
  const UpperChest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        var cubit = AppCubit.get(context);
        var upperChestExercises = chestModel
            .where((exercise) => exercise.targetMuscle == 'Upper Chest')
            .toList();

        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(

                  children: [
                    Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BuildText(
                            text: 'Upper Chest',
                            size: 30,
                            bold: true,
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                        height: height * .9,

                        child: GridView.builder(
                          itemCount: upperChestExercises.length,

                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){navigateTo(context, ExerciseDetailsPage(exercise: upperChestExercises[index]));},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.black26,width: .8)
                                  ),
                                  height: height*.4,
                                  width: width*.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      SizedBox(
                                          height: height*.1,
                                          width: width*.25

                                          ,child: Image.asset('images/${upperChestExercises[index].gif}',fit: BoxFit.cover)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: BuildText(text: upperChestExercises[index].name , color: Colors.black,),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },)
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//ListView.builder(
//
//                           itemCount: tricepsExercises.length,
//                           itemBuilder: (context, index) {
//                             var exercise = tricepsExercises[index];
//
//                             return exercise.targetMuscle == 'Triceps' ||  exercise.targetMuscle == 'Triceps (Long Head)'
//                                 ? Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 8.0),
//                               child: GestureDetector(
//                                 onTap: (){
//                                   navigateTo(context,ExerciseDetailsPage(exercise: tricepsExercises[index],));
//
//                                 },
//                                 child: Container(
//                                   height: height * .15,
//                                   decoration:  BoxDecoration(
//
//                                       color: Colors.white24,
//                                       borderRadius: BorderRadius.circular(25)
//
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.start,
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         SizedBox(
//                                             width: width*.3
//                                             ,child: Image.asset('images/${exercise.gif}',fit: BoxFit.cover)),
//                                         SizedBox(width: width*.04,),
//
//                                         SizedBox(
//                                           width: width*.5,
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Padding(
//                                                 padding: const EdgeInsets.all(8.0),
//                                                 child: BuildText(text: exercise.name,bold: true,size: 15,color: Colors.white,),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//
//
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                                 : const SizedBox();
//                           },
//