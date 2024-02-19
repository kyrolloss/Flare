
import 'package:flutter/material.dart';

import '../../cubit/App cubit/app_cubit.dart';
import 'Text.dart';
import 'color.dart';


void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToToFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}





