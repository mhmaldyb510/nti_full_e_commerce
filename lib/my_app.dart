import 'package:flutter/material.dart';
import 'package:nti_full_e_commerce/core/widgets/splash_screen_builder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenBuilder(),
    );
  }
}
