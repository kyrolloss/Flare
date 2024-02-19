import 'package:flare/cubit/App%20cubit/app_cubit.dart';

import 'package:flare/screen/Home%20Layout/home%20Layout.dart';
import 'package:flare/screen/welcome%20Screen/welcome%20Screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/timer cubit/timer_cubit.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FlareApp());
}

class FlareApp extends StatelessWidget {
  const FlareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return AppCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return TimerCubit();
          },
        )
      ],
      child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: welcomePage()),
    );
  }
}
