import 'package:flare/screen/detailed%20exrecises/detailed%20chest/Lower%20chest.dart';
import 'package:flare/screen/detailed%20exrecises/detailed%20chest/upper%20chest.dart';
import 'package:flare/shared/components/Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/App cubit/app_cubit.dart';
import '../../../dataBase/data.dart';
import '../../../model/exercises mode.dart';
import '../../../shared/components/color.dart';
import 'Middle chest.dart';

// ignore: camel_case_types
class chooseChestDirection extends StatefulWidget {
  final List<ExercisesModel> chestmodel = chestModel;

   chooseChestDirection({Key? key}) : super(key: key);

  @override
  State<chooseChestDirection> createState() => _chooseChestDirectionState();
}

// ignore: camel_case_types
class _chooseChestDirectionState extends State<chooseChestDirection> with TickerProviderStateMixin{
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BuildText(text: 'Chest',size: 35,bold: true,),
              SizedBox(
                height: height*.6,
                child: GridView.builder(
                  itemCount: cubit.chestImages.length,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        if (index == 0){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const UpperChest();
                          },));
                        }
                        else if (index == 1){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return  middleChest();
                          },));
                        }

                        else if (index == 2){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const LowerChest();
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
                            child: Image.asset('images/${cubit.chestImages[index]}'),
                          ),
                          SizedBox(
                            height: height*.005,
                          ),
                          Center(child: BuildText(text: cubit.chestNames[index],size: 25,bold: true,))
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
