// ignore_for_file: camel_case_types


import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flare/shared/components/Text.dart';
import 'package:flare/shared/components/color.dart';
import 'package:flare/shared/components/paragraoh%20widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/App cubit/app_cubit.dart';
import '../../cubit/timer cubit/timer_cubit.dart';
import '../../cubit/timer cubit/timer_state.dart';

class creatinePage2 extends StatefulWidget {
  const creatinePage2({Key? key}) : super(key: key);

  @override
  State<creatinePage2> createState() => _creatinePageState();
}

class _creatinePageState extends State<creatinePage2> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        var cubit = TimerCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: height * .07,
              ),
              Center(
                  child: BuildText(
                    text: 'Flare',
                    size: 35,
                    bold: true,
                    color: AppColor.lightColor,
                  )),
              SizedBox(
                height: height * .07,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Select Item',
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
                            items: cubit.items
                                .map((String item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.lightColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                                .toList(),
                            value: cubit.selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                cubit.selectedValue = value as String;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: 160,
                              padding:
                              const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: IconStyleData(
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: AppColor.lightColor,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              offset: const Offset(-20, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * .002,
                        ),
                        SizedBox(
                            width: width * .5,
                            child: Column(
                              children: [
                                BuildText(
                                  text: 'Required Water Amount ',
                                  size: 20,
                                  bold: true,
                                  color: Colors.black38,
                                  maxLines: 3,
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Select hour',
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
                            items: cubit.hoursItems
                                .map((String items) =>
                                DropdownMenuItem<String>(
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
                            value: cubit.selectedHour,
                            onChanged: (String? value) {
                              setState(() {
                                cubit.selectedHour = value!;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: 160,
                              padding:
                              const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: IconStyleData(
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: AppColor.lightColor,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              offset: const Offset(-20, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * .002,
                        ),
                        SizedBox(
                            width: width * .5,
                            child: Column(
                              children: [
                                BuildText(
                                  text: 'Expected Waking Hours',
                                  size: 20,
                                  bold: true,
                                  color: Colors.black38,
                                  maxLines: 3,
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    cubit.isStart == false
                        ? GestureDetector(
                      onTap: () {
                        cubit.startTimer(context , BuildDialog() , );
                        print(state);


                        cubit.isStart = true;
                        cubit.waterPerHourAndHalf =
                            cubit.calculateWaterPerHourAndHalf(
                              totalWaterPerDay: cubit.selectedValue ==
                                  '4 Liters'
                                  ? 4
                                  : cubit.selectedValue == '5 Liters'
                                  ? 5
                                  : 6,
                              hoursAwake: cubit.selectedHour == '12'
                                  ? 12
                                  : cubit.selectedHour == '13'
                                  ? 13
                                  : cubit.selectedHour == '14'
                                  ? 14
                                  : cubit.selectedHour == '15'
                                  ? 15
                                  : cubit.selectedHour == '16'
                                  ? 16
                                  : cubit.selectedHour == '17'
                                  ? 17
                                  : 18,
                            );
                        cubit.showTimer = true;
                        cubit.remainingWater = cubit.selectedValue == '4 Liters'
                            ? 4
                            : cubit.selectedValue == '5 Liters'
                            ? 5
                            : 6;
                      },
                      child: Container(
                        height: height * .05,
                        width: width * .3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColor.lightColor),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: BuildText(
                            text: 'Start',
                            bold: true,
                            size: 17,
                            color: AppColor.lightColor,
                          ),
                        ),
                      ),
                    )
                        : GestureDetector(
                      onTap: () {
                        cubit.isStart = false;
                         cubit.cancelTimerFunction();
                      },
                      child: Container(
                        height: height * .05,
                        width: width * .3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColor.lightColor),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: BuildText(
                            text: 'Cancel',
                            bold: true,
                            size: 17,
                            color: AppColor.lightColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      BuildText(
                        text: '${ cubit.waterPerHourAndHalf.toStringAsPrecision(
                            2)} L',
                        color: AppColor.lightColor,
                        size: 35,
                        bold: true,
                      ),
                      BuildText(
                        text: 'required water',
                        color: AppColor.lightColor,
                        size: 25,
                        bold: true,
                      ),
                      BuildText(
                        text: 'every 1.5 hour',
                        color: AppColor.lightColor,
                        size: 25,
                        bold: true,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      BuildText(
                        text: '${cubit.remainingWater.toStringAsPrecision(
                            2)} L',
                        color: AppColor.lightColor,
                        size: 35,
                        bold: true,
                      ),
                      BuildText(
                        text: 'Remaining',
                        color: AppColor.lightColor,
                        size: 25,
                        bold: true,
                      ),
                      BuildText(
                        text: 'Water',
                        color: AppColor.lightColor,
                        size: 25,
                        bold: true,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * .07,
              ),
              Center(
                child: Container(
                  height: height * .15,
                  width: width * .85,
                  decoration: BoxDecoration(
                      color: AppColor.lightColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Container(
                        height: height * .4,
                        width: width * .6,
                        decoration: BoxDecoration(
                          color: AppColor.lightColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuildText(
                              text: 'Timer',
                              size: 25,
                              color: Colors.white,
                              bold: true,
                              letterSpacing: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: height * .065,
                                  width: width * .1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white),
                                  child: Center(
                                    child: BuildText(
                                      text: state.hoursCountDown.toString(),
                                      size: 25,
                                      bold: true,
                                      color: AppColor.lightColor,
                                    ),
                                  ),
                                ),
                                BuildText(
                                  text: ':',
                                  color: Colors.white,
                                  bold: true,
                                  size: 25,
                                ),
                                Container(
                                  height: height * .065,
                                  width: width * .1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white),
                                  child: Center(
                                    child: BuildText(
                                      text: state.minutesCountDown.toString(),
                                      size: 25,
                                      bold: true,
                                      color: AppColor.lightColor,
                                    ),
                                  ),
                                ),
                                BuildText(
                                  text: ':',
                                  color: Colors.white,
                                  bold: true,
                                  size: 25,
                                ),
                                Container(
                                  height: height * .065,
                                  width: width * .1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white),
                                  child: Center(
                                    child: BuildText(
                                      text: state.secondsCountDown.toString(),
                                      size: 25,
                                      bold: true,
                                      color: AppColor.lightColor,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        );
      },
    );
  }


}

