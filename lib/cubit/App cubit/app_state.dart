part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class ValueAdded extends AppState {}
class ChangeLuckyWheelExercises extends AppState {}


class ChangeProgressExercisesLoading extends AppState {}
class ChangeProgressExercises extends AppState {}

class ChangeProgressBool extends AppState {}



class StartTimer extends AppState {}
class CancelTimer extends AppState {}


class ChangeNumberProgress extends AppState {}
class ChangeBoolProgress extends AppState {}

class AppPlaying extends AppState {}
class AppPaused extends AppState {}


class ChangeMinutes extends AppState {}
class ChangeHours extends AppState {}


class GetExercisesLoading extends AppState {}
class GetExercisesSuccess extends AppState {}
class GetExercisesError extends AppState {}

class ValueIncremented extends AppState {}

class ValueDecremented extends AppState {
}

class UpdatedTimerValues extends AppState {
  final int secondsCountDown;
  final int minutesCountDown;
  final int hoursCountDown;

  UpdatedTimerValues({
    required this.secondsCountDown,
    required this.minutesCountDown,
    required this.hoursCountDown,
  });
}

class DoneSuccess extends AppState {}
class WaterPerHourAndHalf extends AppState {}


class ChangeTime extends AppState {}


class ChangeNumber extends AppState {}
class changeprogressName extends AppState {}


class RowInsertedLoading extends AppState {}
class RowInsertedSuccess extends AppState {}
class RowInsertedFailed extends AppState {}


class ResultUpdated extends AppState {}
class ResultDeleted extends AppState {}


class RepsIsGot extends AppState {}
class WeightIsGot extends AppState {}
class AddedToChartList extends AppState {}



class ChartDrown extends AppState {}




class TimerTick extends AppState {
  final int hours;
  final int minutes;
  final int seconds;

  TimerTick({required this.hours, required this.minutes, required this.seconds});
}


class PositionChanged extends AppState{}

class ShowMusicBarSucc extends AppState {

}






