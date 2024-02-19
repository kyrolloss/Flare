import 'dart:async';

import 'package:flutter/material.dart';

import '../../shared/components/Text.dart';
import '../../shared/components/color.dart';


class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  bool _isRunning = false;

  @override
  void dispose() {
    _stopwatch.stop();
    _timer.cancel();
    super.dispose();
  }

  void _startStopwatch() {
    if (_isRunning) {
      _stopwatch.stop();
      _timer.cancel();
    } else {
      _stopwatch.start();
      _timer = Timer.periodic(const Duration(milliseconds: 100), _updateTimer);
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void _resetStopwatch() {
    if (_isRunning) {
      _stopwatch.stop();
      _timer.cancel();
    }
    setState(() {
      _stopwatch.reset();
      _isRunning = false;
    });
  }

  void _updateTimer(Timer timer) {
    if (_stopwatch.isRunning) {
      setState(() {});
    } else {
      timer.cancel();
    }
  }

  String _formatTime(Duration duration) {
    String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String milliseconds =
    (duration.inMilliseconds.remainder(1000) ~/ 10).toString().padLeft(2, '0');
    return '$minutes:$seconds:$milliseconds';
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: BuildText(
          text: 'Flare',
          bold: true,
          size: 32.5,
          color: AppColor.lightColor,
          letterSpacing: 2,
        ),centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.timer,color: AppColor.lightColor,size: 100,),
            SizedBox(height: height*.007,),
            Text(
              _formatTime(_stopwatch.elapsed),

              style: TextStyle(fontSize: 60 , color: AppColor.lightColor , fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: _startStopwatch,
                  child: Container(
                    height: height*.055,
                    width: width*.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColor.lightColor
                    ),
                    child: Center(child: Text(_isRunning ? 'Stop' : 'Start' ,style: const TextStyle(color: Colors.white ,fontWeight: FontWeight.w600),)),


                  ),
                ),
                GestureDetector(
                  onTap: _resetStopwatch,
                  child: Container(
                    height: height*.055,
                    width: width*.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColor.lightColor
                    ),
                    child: const Center(child: Text('Reset' ,style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w600),)),


                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
