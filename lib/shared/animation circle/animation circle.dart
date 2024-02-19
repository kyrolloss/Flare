import 'dart:math';

import 'package:flutter/material.dart';

import '../components/color.dart';

class AnimatedCircle extends StatefulWidget {
  final double height;
  final double width;
  final String image;

  const AnimatedCircle({
    Key? key,
    required this.height,
    required this.width, required this.image,
  }) : super(key: key);

  @override
  _AnimatedCircleState createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _animation = Tween(begin: 0.0, end: 2 * pi).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(

        angle: _animation.value,
        child: Container(

          width: widget.width, // استخدام العرض المحدد من الخاصية
          height: widget.height, // استخدام الطول المحدد من الخاصية
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(widget.image)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColor.veryLightColor,
                AppColor.lightColor,
                AppColor.veryLightColor,
                AppColor.lightColor
              ],
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
