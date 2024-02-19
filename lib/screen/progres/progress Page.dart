import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/App cubit/app_cubit.dart';
import '../../dataBase/local/My Data Base.dart';
import '../../shared/LineChart/LineChart.dart';
import '../../shared/components/Text.dart';
import '../../shared/components/color.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  final dbHelper = DatabaseHelper();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {

        if (state is ChartDrown) {
          setState(() {}); // Force a rebuild to update the UI
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        TextEditingController weightController = TextEditingController();
        TextEditingController repsController = TextEditingController();
        return Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: BuildText(
                text: 'Flare',
                bold: true,
                size: 30,
                color: AppColor.secondColor,
                letterSpacing: 2,
              ),
              centerTitle: true,
              elevation: 0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, right: 5, left: 5, bottom: 5),
                child: Container(
                  height: height * .15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(
                    height: height*.02,

                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                height: height * .35,
                                width: width * .6,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: BuildText(
                                            text: 'Choose Muscle',
                                            color: AppColor.lightColor,
                                            wordSpacing: 2,
                                            size: 25,
                                            bold: true),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                cubit.changeProgressExercises(
                                                    cubit.progress, cubit.chest);
                                                cubit.changeProgressBool();
                                                cubit.changeProgressName(cubit.chest.first);
                                                cubit.progressFirstResults();

                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: height * .035,
                                                width: width * .25,
                                                decoration: BoxDecoration(
                                                    color: AppColor.lightColor,
                                                    borderRadius:
                                                        BorderRadius.circular(25)),
                                                child: Center(
                                                    child: BuildText(
                                                  text: 'Chest',
                                                  bold: true,
                                                  size: 17.5,
                                                )),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                cubit.changeProgressExercises(
                                                    cubit.progress, cubit.back);
                                                cubit.changeProgressBool();
                                                cubit.changeProgressName(cubit.back.first);
                                                cubit.progressFirstResults();


                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: height * .035,
                                                width: width * .25,
                                                decoration: BoxDecoration(
                                                    color: AppColor.lightColor,
                                                    borderRadius:
                                                        BorderRadius.circular(25)),
                                                child: Center(
                                                    child: BuildText(
                                                  text: 'Back',
                                                  bold: true,
                                                  size: 17.5,
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            cubit.changeProgressExercises(
                                                cubit.progress, cubit.shoulder);
                                            cubit.changeProgressBool();
                                            cubit.changeProgressName(cubit.shoulder.first);

                                            cubit.progressFirstResults();

                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: height * .035,
                                            width: width * .25,
                                            decoration: BoxDecoration(
                                                color: AppColor.lightColor,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Center(
                                                child: BuildText(
                                              text: 'Shoulder',
                                              bold: true,
                                              size: 17.5,
                                            )),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            cubit.changeProgressExercises(
                                                cubit.progress, cubit.biceps);
                                            cubit.changeProgressBool();
                                            cubit.changeProgressName(cubit.biceps.first);
                                            cubit.progressFirstResults();

                                          },
                                          child: Container(
                                            height: height * .035,
                                            width: width * .25,
                                            decoration: BoxDecoration(
                                                color: AppColor.lightColor,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Center(
                                                child: BuildText(
                                              text: 'Biceps',
                                              bold: true,
                                              size: 17.5,
                                            )),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                cubit.changeProgressExercises(
                                                    cubit.progress, cubit.triceps);
                                                cubit.changeProgressBool();
                                                cubit.changeProgressName(cubit.triceps.first);
                                                cubit.progressFirstResults();


                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: height * .035,
                                                width: width * .25,
                                                decoration: BoxDecoration(
                                                    color: AppColor.lightColor,
                                                    borderRadius:
                                                        BorderRadius.circular(25)),
                                                child: Center(
                                                    child: BuildText(
                                                  text: 'Triceps',
                                                  bold: true,
                                                  size: 17.5,
                                                )),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                cubit.changeProgressExercises(
                                                    cubit.progress, cubit.Legs);
                                                cubit.changeProgressBool();
                                                cubit.changeProgressName(cubit.Legs.first);
                                                cubit.progressFirstResults();


                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: height * .035,
                                                width: width * .25,
                                                decoration: BoxDecoration(
                                                    color: AppColor.lightColor,
                                                    borderRadius:
                                                    BorderRadius.circular(25)),
                                                child: Center(
                                                    child: BuildText(
                                                      text: 'Legs',
                                                      bold: true,
                                                      size: 17.5,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: height * .05,
                        width: width * .55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: AppColor.lightColor,
                        ),
                        child: Center(
                            child: BuildText(
                                text: 'Choose Muscle',
                                color: Colors.white,
                                size: 20,
                                bold: true,
                                letterSpacing: 2)),
                      ),
                    ),
                  ),

                  cubit.progresss == true
                      ? Column(
                        children: [
                          SizedBox(
                            height: height*.02,

                          ),
                          DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Select Exercise',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.lightColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: cubit.progress.toSet().toList()
                                  .map((String items) => DropdownMenuItem<String>(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.lightColor,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: cubit.SelectedProgressItemm,
                                onChanged: (String? value) async {
                                  setState(() {
                                    if(value == cubit.SelectedProgressItemm){
                                      cubit.result.clear();
                                      cubit.SelectedProgressItemm = value!;
                                    }
                                    else{
                                      cubit.SelectedProgressItemm = value!;
                                    }
                                  });
                                  cubit.progressResults();



                                  print(' chart list is${cubit.chartDataList}');
                                  cubit.chartDataList.clear();
                                  cubit.result.clear();

                                },
                            )
                          ),
                          SizedBox(
                            height: height*.02,

                          ),
                          SizedBox(
                              height: height*.3,
                              width: width*.9,
                              child: const LineChartWidget()
                          ),
              TextFormField(
                keyboardType: TextInputType.number,


                style: TextStyle(
                    color:AppColor.lightColor
                ),
                controller: weightController,
                cursorColor: AppColor.lightColor,


                decoration: InputDecoration(


                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 6,),
                    borderRadius:  BorderRadius.vertical(
                      bottom: Radius.circular(70), //
                      // Adjust this value for the shorter line
                    ),
                  ),

                  enabledBorder: const UnderlineInputBorder(

                    borderSide: BorderSide(color: Colors.black38,width: 2,),
                    borderRadius:  BorderRadius.vertical(
                      bottom: Radius.circular(27), // Adjust this value for the shorter line
                    ),



                  ),


                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Weight',
                  contentPadding: const EdgeInsets.all(0),
                  hintStyle: TextStyle(
                    color: AppColor.lightColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,


                  ),
                  prefix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.add,color: AppColor.lightColor,grade: 50),
                  ),



                ),

              ),
                          SizedBox(
                            height: height*.02,

                          ),


                          TextFormField(
                            keyboardType: TextInputType.number,


                            style: TextStyle(
                                color:AppColor.lightColor
                            ),
                            controller: repsController,
                            cursorColor: AppColor.lightColor,


                            decoration: InputDecoration(


                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black,width: 6,),
                                borderRadius:  BorderRadius.vertical(
                                  bottom: Radius.circular(70), //
                                  // Adjust this value for the shorter line
                                ),
                              ),

                              enabledBorder: const UnderlineInputBorder(

                                borderSide: BorderSide(color: Colors.black38,width: 2,),
                                borderRadius:  BorderRadius.vertical(
                                  bottom: Radius.circular(27), // Adjust this value for the shorter line
                                ),



                              ),


                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: 'Reps',
                              contentPadding: const EdgeInsets.all(0),
                              hintStyle: TextStyle(
                                color: AppColor.lightColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,


                              ),
                              prefix: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.add,color: AppColor.lightColor,grade: 50),
                              ),



                            ),

                          ),
                          SizedBox(
                            height: height*.02,

                          ),


                          GestureDetector(
                            onTap: (


                                ){

                              cubit.insertData(name: cubit.SelectedProgressItemm,reps: repsController.text, weight: weightController.text);

                            },
                            child: Container(
                              height: height * .05,
                              width: width * .25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: AppColor.lightColor,
                              ),
                              child: Center(
                                  child: BuildText(
                                      text: 'Add',
                                      color: Colors.white,
                                      size: 20,
                                      bold: true,
                                      letterSpacing: 2)),
                            ),
                          ),


                        ],
                      )
                      : const SizedBox(),

                ],
              ),
            )
        );
      },
    );
  }
}
