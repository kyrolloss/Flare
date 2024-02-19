import 'package:flare/screen/detailed%20exrecises/legs%20detailed/calves.dart';
import 'package:flare/screen/detailed%20exrecises/legs%20detailed/gluteus.dart';
import 'package:flare/screen/detailed%20exrecises/legs%20detailed/hamstring.dart';
import 'package:flare/screen/detailed%20exrecises/legs%20detailed/quadriceps.dart';
import 'package:flare/shared/components/Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/App cubit/app_cubit.dart';
import '../../../shared/components/color.dart';

// ignore: camel_case_types
class chooseLegDirection extends StatelessWidget {
  const chooseLegDirection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child:  Scaffold(
            body: Column(
              children: [
                BuildText(text: 'Legs',size: 35,bold: true,),
                SizedBox(
                  height: height*.6,
                  child: GridView.builder(
                    itemCount: cubit.legsImages.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          if (index == 0){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const quadriceps();
                            },));
                          }
                          else if (index == 1){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return  const hamstring();
                            },));
                          }

                          else if (index == 2){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const Gluteus();
                            },));
                          }

                          else if (index == 3){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const Calf();
                            },));
                          }




                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset('images/${cubit.legsImages[index]}'),
                              backgroundColor: AppColor.lightColor.withOpacity(.3),
                              maxRadius: 40,
                              minRadius: 0,
                            ),
                            SizedBox(
                              height: height*.005,
                            ),
                            Center(child: BuildText(text: cubit.legsNames[index],size: 25,bold: true,))
                          ],
                        ),
                      );
                    },),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
