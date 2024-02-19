import 'package:flare/model/exercises%20mode.dart';
import 'package:flare/screen/exercises%20page/exrecises%20information/exrecises%20information.dart';
import 'package:flare/shared/components/Text.dart';
import 'package:flare/shared/components/color.dart';
import 'package:flare/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagination_flutter/pagination.dart';

import '../../dataBase/data.dart';
import '../exercises page/exercises instruction.dart';

class showscheduleprosplit extends StatefulWidget {
  List <ExercisesModel> exercise;
  showscheduleprosplit({required this.exercise});


  @override
  State<showscheduleprosplit> createState() => _showScheduleState();
}

class _showScheduleState extends State<showscheduleprosplit> {

  int selectedPage = 1;

  setSelectedPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }


  @override

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height*.4,
              width: width*.6,
              child: PageView.builder(



                itemCount:5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (){navigateTo(context, ExerciseDetailsPage(exercise: widget.exercise[selectedPage-1]));},



                      child: Image.asset('images/'+widget.exercise[selectedPage-1].gif));
                },),
            ),
            SizedBox(
              height: height*.005,
            ),
            Center(
              child: BuildText(text: widget.exercise[selectedPage-1].name,maxLines: 4,bold: true,
                size: 20,
              ),
            ),
            SizedBox(
              height: height*.005,
            ),

            SizedBox(
              height: height*.15,
              width: width*.5,
              child: BuildText(text: widget.exercise[selectedPage-1].shortDescription,maxLines: 4,bold: true,letterSpacing: 1,wordSpacing: 1.8,),
            ),


            Pagination(
              numOfPages: 5,
              selectedPage: selectedPage,
              pagesVisible: 3,
              onPageChanged: (page) {
                setState(() {
                  selectedPage = page;
                });
              },
              nextIcon:  Icon(
                Icons.arrow_forward_ios,
                color: AppColor.lightColor,
                size: 14,
              ),
              previousIcon:  Icon(
                Icons.arrow_back_ios,
                color: AppColor.lightColor,
                size: 14,
              ),
              activeTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              activeBtnStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(   AppColor.lightColor,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38),
                  ),
                ),
              ),
              inactiveBtnStyle: ButtonStyle(

                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(38),
                )),
              ),
              inactiveTextStyle:  TextStyle(
                color: AppColor.lightColor,

                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        )
    );
  }
}
