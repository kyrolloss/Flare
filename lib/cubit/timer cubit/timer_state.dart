class TimerState {
   int secondsCountDown = 5;
   int minutesCountDown = 0;
   int hoursCountDown = 0;
  final double remainingWater; // إضافة المتغير المطلوب

  TimerState({
    required this.secondsCountDown,
    required this.minutesCountDown,
    required this.hoursCountDown,
    required this.remainingWater, // تعيين القيمة للمتغير المضاف
  });

  TimerState copyWith({
    int? secondsCountDown,
    int? minutesCountDown,
    int? hoursCountDown,
    double? remainingWater, // تحديث الدالة copyWith
  }) {
    return TimerState(
      secondsCountDown: secondsCountDown ?? this.secondsCountDown,
      minutesCountDown: minutesCountDown ?? this.minutesCountDown,
      hoursCountDown: hoursCountDown ?? this.hoursCountDown,
      remainingWater: remainingWater ?? this.remainingWater,
    );
  }
}
