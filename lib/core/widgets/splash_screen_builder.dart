import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_full_e_commerce/core/cubits/splash_cubit/splash_cubit.dart';
import 'package:nti_full_e_commerce/core/screens/splash_screen.dart';
import 'package:nti_full_e_commerce/core/widgets/main_layout.dart';

class SplashScreenBuilder extends StatelessWidget {
  const SplashScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..loading(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadedState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => MainLayout(
                  ),
                ),
                (route) => false);
          }
        },
        child: const SplashScreen(),
      ),
    );
  }
}
