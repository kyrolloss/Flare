import 'package:flare/dataBase/data.dart';
import 'package:flare/screen/exercises%20page/exercises%20instruction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/App cubit/app_cubit.dart';
import '../../../../shared/components/Text.dart';
import '../../../../shared/components/components.dart';

class brachialis extends StatelessWidget {
  const brachialis({Key? key}) : super(key: key);

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
        var BrachialisExercises =bicepsModel
            .where((exercise) => exercise.targetMuscle == 'Brachialis')
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
                            text: 'Brachialis',
                            size: 30,
                            bold: true,
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                        height: height * .9,

                        child: GridView.builder(
                          itemCount: BrachialisExercises.length,

                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){navigateTo(context, ExerciseDetailsPage(exercise: BrachialisExercises[index]));},
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

                                          ,child: Image.asset('images/${BrachialisExercises[index].gif}',fit: BoxFit.cover)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: BuildText(text: BrachialisExercises[index].name , color: Colors.black,),
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

