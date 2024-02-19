import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/App cubit/app_cubit.dart';
import '../../../cubit/timer cubit/timer_cubit.dart';
import '../../../cubit/timer cubit/timer_state.dart';
import '../Text.dart';
import '../color.dart';

class BuildDialog extends StatelessWidget {
  const BuildDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = TimerCubit.get(context);

        return  AlertDialog(
          icon: Icon(Icons.local_drink_outlined,color: AppColor.lightColor,),
          content: BuildText(
            text: 'U should Drink ${cubit.waterPerHourAndHalf } L Now',
            bold: true,
            color: AppColor.lightColor,
            size: 18
          ), 
          actions: [
            TextButton(
              onPressed: () {
              TimerState(
                  secondsCountDown: state.secondsCountDown ,
                  minutesCountDown: state.minutesCountDown,
                  hoursCountDown: state.hoursCountDown,
                  remainingWater: state.remainingWater);
              cubit.remainingWater =cubit.remainingWater -cubit.waterPerHourAndHalf;
                cubit.restartTimer();
               cubit. startTimer(context , BuildDialog());
                Navigator.of(context).pop();
              },
              child: BuildText(
                text: 'Done',
                bold: true,
                color: AppColor.lightColor,
                size: 15,
              ),
            ),
            TextButton(
              onPressed: () {
               TimerState(
                  secondsCountDown: state.secondsCountDown,
                  minutesCountDown: state.minutesCountDown,
                  hoursCountDown: state.hoursCountDown,
                  remainingWater: cubit.remainingWater,
                );

               cubit.setSecondsCountdownTo30();
                cubit.startTimer(context , const BuildDialog());
                Navigator.of(context).pop();
              },
              child: BuildText(
                text: 'Add 30 Minutes',
                bold: true,
                color: AppColor.lightColor,
                size: 15,
              ), 
            ),
          ],
        );
      },
    );
  }
}
