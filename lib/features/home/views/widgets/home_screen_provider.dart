import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_full_e_commerce/features/home/cubit/home_cubit.dart';
import 'package:nti_full_e_commerce/features/home/views/screens/home_screen.dart';

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(category: 'Laptops'),
      child: const HomeScreen(),
    );
  }
}
