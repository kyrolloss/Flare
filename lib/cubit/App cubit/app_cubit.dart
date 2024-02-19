import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flare/dataBase/local/My%20Data%20Base.dart';
import 'package:flare/model/music/music%20data.dart';
import 'package:flare/model/music/musicModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:meta/meta.dart';

import '../../dataBase/data.dart';
import '../../main.dart';
import '../../screen/exercises page/exersices Gif/exersices Gif.dart';
import '../../screen/exercises page/exrecises information/exrecises information.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
 bool playing = false;
 bool progresss = false;
 late int numberOfProgress ;
 bool startPlaying = false;
 late int numberOfMuscle;
 String SelectedProgressItemm = 'Flat Barbell Bench Press';
 final dbHelper = DatabaseHelper();

 List<FlSpot> points = [
 ];


 List<Map<String,dynamic>> result = [];




 List<FlSpot> chartDataList =[];



Future<void> progressResults()async{
  result = await dbHelper.getAllData(result: result, exerciseName: SelectedProgressItemm);
  print('result is $result');
  emit(ResultUpdated());

  int horizontalAxis = 0;


  for (var item in result) {
    String exerciseName = item['name']; // افترض أن العنصر يحتوي على مفتاح 'name' يحتوي على اسم التمرين



    // التحقق من اسم التمرين قبل إضافة البيانات إلى قائمة الرسم البياني
    if (exerciseName == SelectedProgressItemm) {
      int reps = item['reps'];
      int weight = item['weight'];
      int volume = reps * weight;


      chartDataList.add(FlSpot(horizontalAxis.toDouble(), volume.toDouble()));
      horizontalAxis += 100;
      emit(ChartDrown());


    }


  }  }

 Future<void> progressFirstResults() async {
   result = await dbHelper.getAllData(result: result, exerciseName: SelectedProgressItemm);
   print('result is $result');
   emit(ResultUpdated());

   int horizontalAxis = 0;

   chartDataList.clear();

   for (var item in result) {
     String exerciseName = item['name'];

     if (exerciseName == "Flat Barbell Bench Press") {
       int reps = item['reps'];
       int weight = item['weight'];
       int volume = reps * weight;

       chartDataList.add(FlSpot(horizontalAxis.toDouble(), volume.toDouble()));
       horizontalAxis += 100;
     }
   }

   // إصدار حدث لإعلام المستمعين بتغيير البيانات
   emit(ChartDrown());
 }


 List <String> luckyExersices=[];
  List <String> progress = [];

 List<String> back = backModel
     .where((exercise) => exercise.targetMuscle == 'Latissimus Dorsi' || exercise.targetMuscle == 'Upper Back')
     .map((exercise) => exercise.name)
     .toList();

 List<String> chest = chestModel
     .where((exercise) => exercise.targetMuscle == 'Lower Chest' || exercise.targetMuscle == 'Middle Chest' || exercise.targetMuscle == 'Upper Chest')
     .map((exercise) => exercise.name)
     .toList();

 List<String> shoulder = shoulderModel
     .where((exercise) => exercise.targetMuscle == 'Anterior Deltoid' || exercise.targetMuscle == 'Lateral Deltoid' || exercise.targetMuscle == 'Posterior Deltoid')
     .map((exercise) => exercise.name)
     .toList();
 List<String> biceps = bicepsModel
     .where((exercise) => exercise.targetMuscle == 'Biceps Brachii (Short Head)' || exercise.targetMuscle == 'Biceps (Long Head)' || exercise.targetMuscle == 'Biceps Brachii' )
     .map((exercise) => exercise.name)
     .toList();

 List<String> triceps = tricepsModel
     .where((exercise) =>  exercise.targetMuscle == 'Triceps'||exercise.targetMuscle == 'Triceps (Long Head)')
     .map((exercise) => exercise.name)
     .toList();

 List<String> Legs = leg
     .where((exercise) =>  exercise.targetMuscle == 'Hamstrings'||exercise.targetMuscle == 'Quadriceps'||exercise.targetMuscle == 'Gluteus Maximus'||exercise.targetMuscle == 'Calf'||exercise.targetMuscle == 'Hip adductors')
     .map((exercise) => exercise.name)
     .toList();


// AppCubit() : super(AppInitial());


 AppCubit() : super(
     AppInitial()
 ){
   playing =false;


   startPlaying = false;
   numberOfMuscle = 0;


   for (var data in result) {
     int firstNum =0;
     if (data['name'] == "Flat Barbell Bench Press") {
       var reps = data['reps'];
       var weight = data['weight'];
       var volume = reps*weight;
       chartDataList.add(FlSpot(firstNum.toDouble(), volume.toDouble()));
     }
   }
 }

void Changenumber(int number1 , int number2){
   number1 = number2;
   emit(ChangeNumber());
 }




void changeProgressName(String exercise){
  SelectedProgressItemm = exercise;
  emit(changeprogressName());
}


  Future<List<Map<String, dynamic>>> fetchProgressData() async {
    return fetchProgressData();
  }




  static AppCubit get(context) => BlocProvider.of(context);

  List<double> data = [0];

  late bool isFailure;

 late musicModel Song ;

  bool isStart = false;
  void changeLuckyWheelExercises(List empty , List<String> exersices){

    empty.clear();

    empty.addAll(exersices);
    emit(ChangeLuckyWheelExercises());
  }


  void changeProgressExercises(List empty , List<String> exersices){

emit(ChangeProgressExercisesLoading());
    empty.clear();

    empty.addAll(exersices);
    emit(ChangeProgressExercises());
  }


void changeProgressBool(){
    progresss = true;
    emit(ChangeProgressBool());
}



  void insertData({
    required String name,
    required String reps , required String weight}) async {

    // Example of inserting data
    emit(RowInsertedLoading());

    Map<String, dynamic> progressMap = {
      'name': name,
      'reps': reps,
      'weight': weight,
      'date': DateTime.now().weekday
    };
    int id = await dbHelper.insertProgress(progressMap);
    print('Inserted row id: $id');
    print(progressMap);
    emit(RowInsertedSuccess());
  }


  final items = ['4 Liters', '5 Liters', '6 Liters'];

  List<String> hoursItems = ['12', '13', '14', '15', '16', '17', '18'];

  String selectedValue = '4 Liters';

  String selectedHour = '12';

  double waterPerHourAndHalf = 0;

  double remainingWater = 0;

  bool showTimer = false;

  int secondsCountDown = 5;
  int minutesCountDown = 0;

  int hoursCountDown = 0;



  void addValue(double weight, double reps, List<double> data) {
    data.add(weight * reps);
    emit(ValueAdded());
    print(state);
  }



  List<String> exercisesNames = [
    'Chest',
    'Back',
    'Shoulder',
    'Arms',
    'Legs',
  ];

  List<String> exercisesImages = [
    'chest.png',
    'back.png',
    'shoulder.png',
    'arms.png',
    'leg.png',
  ];

  List<String> chestImages = [
    'upper chest.jpg',
    'middel chest.jpg',
    'lower chest.jpg',
  ];

  List<String> chestNames = [
    'upper chest',
    'middle chest',
    'lower chest',
  ];

  List<String> backImages = [
    'trapezius.png',
    'lats.png',
    'upper back.png',
    'Lumbar muscles.png',
  ];

  List<String> backNames = [
    'Trapezius',
    'Lats',
    'Upper Back',
    'Lumbar',
  ];

  List<String> legsNames = [
    'Quadriceps',
    'Hamstring',
    'Gluteus',
    'Calves',
  ];
  List<String> legsImages = [
    'quadricep.png',
    'hamstring.png',
    'teez.jpg',
    'calves.png',
  ];

  List<String> armsNames = [
    'Biceps',
    'Triceps',
    'Brachialis',
    'Forearm',
  ];
  List<String> armsImages = [
    'biceps.png',
    'triceps.png',
    'brachialis.png',
    'forearm.png',
  ];

  List<String> ShoulderImages = [
    'anterior head.jpg',
    'midel head.jpg',
    'posterior head.jpg',
  ];
  List<String> ShoulderNames = [
    'Anterior head',
    'Lateral Deltoid',
    'Posterior head',
  ];

  // ignore: non_constant_identifier_names



}
