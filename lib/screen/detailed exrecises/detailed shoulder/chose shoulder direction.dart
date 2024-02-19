import 'package:flare/screen/detailed%20exrecises/detailed%20shoulder/Anterior%20Deltoid.dart';
import 'package:flare/screen/detailed%20exrecises/detailed%20shoulder/Lateral%20head.dart';
import 'package:flare/screen/detailed%20exrecises/detailed%20shoulder/Posterior.dart';
import 'package:flare/shared/components/Text.dart';
import 'package:flare/shared/components/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/App cubit/app_cubit.dart';

// ignore: camel_case_types
class chooseShoulderDirection extends StatelessWidget {
  const chooseShoulderDirection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
                  BuildText(text: 'Shoulder',size: 35,bold: true,),
                  SizedBox(
                    height: height*.6,
                    child: GridView.builder(
                      itemCount: cubit.ShoulderImages.length,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            if (index == 0){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const Anterior();
                              },));
                            }
                            else if (index == 1){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return  const Lateral();
                              },));
                            }

                            else if (index == 2){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const Posterior();
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
                                child: Image.asset('images/${cubit.ShoulderImages[index]}'),
                              ),
                              SizedBox(
                                height: height*.005,
                              ),
                              Center(child: BuildText(text: cubit.ShoulderNames[index],size: 25,bold: true,))
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
