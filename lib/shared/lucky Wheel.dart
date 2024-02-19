import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import 'components/text.dart';
import 'components/color.dart';
import '../cubit/App cubit/app_cubit.dart';

class LuckyWheel extends StatefulWidget {
  @override
  _LuckyWheelState createState() => _LuckyWheelState();
}

class _LuckyWheelState extends State<LuckyWheel> {
  StreamController<int> selected = StreamController<int>();
  int selectedIndex = 0;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return GestureDetector(
          onTap: () {
            selectedIndex = Fortune.randomInt(0, cubit.luckyExersices.length);
            selected.add(selectedIndex);
          },
          child: Column(
            children: [
              Expanded(
                child: FortuneWheel(
                  onAnimationEnd: () {
                    setupDialog(context, cubit.luckyExersices[selectedIndex]);
                  },
                  rotationCount: 10,
                  selected: selected.stream,
                  styleStrategy: UniformStyleStrategy(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    color: AppColor.lightColor.withOpacity(.9),
                    borderColor: Colors.black,
                    borderWidth: .1,
                    textAlign: TextAlign.center,
                  ),
                  items: [
                    for (var it in cubit.luckyExersices)
                      FortuneItem(child: Text(it)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void setupDialog(BuildContext context, String selectedExercise) {

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(

        backgroundColor: Colors.blue,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: BuildText(
              text:  selectedExercise,
              color: AppColor.lightColor,
              size: 25,
              bold: true,
            ),
          ),
        ),
      );
    },
  );
}
