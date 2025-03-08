import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_full_e_commerce/features/home/cubit/home_cubit.dart';
import 'package:nti_full_e_commerce/features/home/views/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is ProductsLoadedState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .65,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: state.products[index]);
              },
            ),
          );
        } else if (state is ProductsErrorState) {
          return Center(
            child: Text(
              state.error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
