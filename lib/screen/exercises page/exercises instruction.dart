import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';

import '../../model/exercises mode.dart';
import 'exersices Gif/exersices Gif.dart';
import 'exrecises information/exrecises information.dart';


class ExerciseDetailsPage extends StatefulWidget {
  ExercisesModel exercise;

  ExerciseDetailsPage({super.key, required this.exercise});

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageeState();
}

class _ExerciseDetailsPageeState extends State<ExerciseDetailsPage> {
  late List<Widget> pageViewWidgets;

  @override
  void initState() {
    super.initState();
    pageViewWidgets = [
      ExercisesGif(exercise: widget.exercise),
      ExercisesInformation(exercise: widget.exercise),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body:

        LoopPageView.builder(
          itemCount: 2,

          itemBuilder: (_, index) {
            return pageViewWidgets[index];},

        ));
  }
}

