import 'package:flutter/material.dart';

class ExercisesModel {
  late String name;
  late String targetMuscle;
  late String Synergists;
  late String secondaryMuscles;
  late String gif;
  late String? instructionGif1;
  late String? instructionGif2;
  late String? instructionGif3;
  late String shortDescription;
  late String instruction;
  late ExercisesModel? sameExercises;

  ExercisesModel({

    required this.name,
    required this.shortDescription,
    required this.gif,
    required this.instruction,
     this.instructionGif1,
     this.instructionGif2,
     this.instructionGif3,
    required this.secondaryMuscles,
    required this.Synergists,
    required this.targetMuscle,
    this.sameExercises
  });
}
