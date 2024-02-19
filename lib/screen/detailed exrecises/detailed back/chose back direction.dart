import 'package:flare/screen/detailed%20exrecises/detailed%20back/Lumbar.dart';
import 'package:flare/screen/detailed%20exrecises/detailed%20back/lats.dart';
import 'package:flare/screen/detailed%20exrecises/detailed%20back/trapezius.dart';
import 'package:flare/screen/detailed%20exrecises/detailed%20back/upper%20back.dart';
import 'package:flare/shared/components/Text.dart';
import 'package:flare/shared/components/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/App cubit/app_cubit.dart';

// ignore: camel_case_types
class chooseBackDirection extends StatelessWidget {
  const chooseBackDirection({Key? key}) : super(key: key);

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
                  BuildText(text: 'Back',size: 35,bold: true,),
                  SizedBox(
                    height: height*.6,
                    child: GridView.builder(
                      itemCount: cubit.backImages.length,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            if (index == 0){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const Trapezius();
                              },));
                            }
                            else if (index == 1){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const lats();
                              },));
                            }

                            else if (index == 2){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const UpperBack();
                              },));
                            }

                            else if (index == 3){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const Lumbar();
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
                                child: Image.asset('images/${cubit.backImages[index]}'),
                              ),
                              SizedBox(
                                height: height*.005,
                              ),
                              Center(child: BuildText(text: cubit.backNames[index],size: 25,bold: true,))
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
