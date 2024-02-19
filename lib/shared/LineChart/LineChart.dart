import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/App cubit/app_cubit.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {

  @override
  void initState() {

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {

        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);



              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 26.0,
                      ),
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                               spots: cubit.chartDataList,

                              isCurved: false,
                              color: const Color(0xff33cccc),
                              barWidth: 4,
                              isStrokeCapRound: true,
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                          minY: 0,
                          titlesData: const FlTitlesData(
                              rightTitles: AxisTitles(drawBelowEverything: true),
                              topTitles: AxisTitles(drawBelowEverything: true)),
                        ),
                      ),
                    ),
                  ),
                ],
              );

          },


    );
  }
}





