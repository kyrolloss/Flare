import 'dart:async'; // لاستخدام Timer
import 'package:flare/shared/components/paragraoh%20widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';
import 'timer_state.dart'; // اسم الملف الذي يحتوي على TimerState

class TimerCubit extends Cubit<TimerState> {
   Timer? _timer ;
  TimerCubit()
      : super(TimerState(
      secondsCountDown: 59,
      minutesCountDown: 29,
      hoursCountDown: 1,
      remainingWater: 100.0)) {

  }
  static TimerCubit get(context) => BlocProvider.of(context);

  void subtractWater(double waterPerHourAndHalf) {
    double remainingWater = state.remainingWater - waterPerHourAndHalf;
    if (remainingWater <= 0) {
      remainingWater = 0;
    }

    emit(TimerState(
      secondsCountDown: state.secondsCountDown,
      minutesCountDown: state.minutesCountDown,
      hoursCountDown: state.hoursCountDown,
      remainingWater: remainingWater,
    ));
  }

   void showMyDialog() {
     showDialog(
         context: navigatorKey.currentContext!,
         builder: (context) => Center(
           child: BuildDialog(

           )
         )
     );
   }
   void setSecondsCountdownTo30() {
     emit(state.copyWith(
       minutesCountDown: 30, // تحديد العد التنازلي للثواني إلى 30 ثانية
     ));
   }
  void startTimer(BuildContext context , Widget widget ) {
    emit(state.copyWith());
Duration duration = Duration(
      hours: state.hoursCountDown,
      minutes: state.minutesCountDown,
      seconds: state.secondsCountDown,
    );
  print(secondsCountDown);
    // البدء في التحديث كل ثانية
    _timer =Timer.periodic(Duration(seconds: 1), (Timer timer) {
    if(remainingWater == 0){
      cancelTimerFunction();
      isStart = false;
    }
    else
    {
      if (duration.inSeconds > 0 && isStart == true) {
        duration -= Duration(seconds: 1);
        emit(TimerState(
          remainingWater: remainingWater,

          secondsCountDown: duration.inSeconds % 60,
          minutesCountDown: (duration.inSeconds ~/ 60) % 60,
          hoursCountDown: duration.inSeconds ~/ 3600,

        ));
        print(secondsCountDown);
      } else {
        timer.cancel();
        showMyDialog();// إيقاف التايمر عند الانتهاء
      }
    }
    });
  }


  void restartTimer() {

    emit(TimerState(secondsCountDown: 5, minutesCountDown: 0, hoursCountDown: 0,                    remainingWater: remainingWater,
    ));
  }

  double calculateWaterPerHourAndHalf(
      {required double totalWaterPerDay, required int hoursAwake}) {
    double waterPerHourAndHalf = totalWaterPerDay / (hoursAwake / 1.5);
    return waterPerHourAndHalf;
  }

   void cancelTimerFunction() {
     if (_timer!.isActive) {
       _timer?.cancel();
       emit(state.copyWith(secondsCountDown: 59, minutesCountDown: 29, hoursCountDown: 1));
     }
   }


  List<double> data = [0];


  late bool isFailure;


  bool isStart = false;

  final items = ['4 Liters', '5 Liters', '6 Liters'];

  List<String> hoursItems = ['12', '13', '14', '15', '16', '17', '18'];


  String selectedValue = '4 Liters';

  String selectedHour = '12';



  double waterPerHourAndHalf=0;

  double remainingWater = 0;


  bool showTimer = false;

  int secondsCountDown=5;
  int minutesCountDown = 0 ;
  int hoursCountDown=0;

}