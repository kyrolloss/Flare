import 'package:flare/screen/detailed%20exrecises/detalied%20Arms/biceps/biceps%20screen.dart';
import 'package:flare/screen/detailed%20exrecises/detalied%20Arms/brachialis/brachialis.dart';
import 'package:flare/screen/detailed%20exrecises/detalied%20Arms/foreArms/foreArms.dart';
import 'package:flare/screen/detailed%20exrecises/detalied%20Arms/triceps/triceps%20screen.dart';
import 'package:flare/shared/components/Text.dart';
import 'package:flare/shared/components/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/App cubit/app_cubit.dart';

// ignore: camel_case_types
class chooseArmsDirection extends StatelessWidget {
  const chooseArmsDirection({Key? key}) : super(key: key);

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
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BuildText(text: 'Arms',size: 35,bold: true,),
                  SizedBox(
                    height: height*.6,
                    child: GridView.builder(
                      itemCount: cubit.armsImages.length,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            if (index == 0){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const  bicepsScreen();
                              },));
                            }
                            else if (index == 1){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return  const tricepsScreen();
                              },));
                            }
                            else if (index == 2){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return  const brachialis();
                              },));
                            }
                            else if (index == 3){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return  const foreArms();
                              },));
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
                                child: Image.asset('images/${cubit.armsImages[index]}'),
                              ),
                              SizedBox(
                                height: height*.005,
                              ),
                              Center(child: BuildText(text: cubit.armsNames[index],size: 25,bold: true,))
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
      },
    );
  }
}
