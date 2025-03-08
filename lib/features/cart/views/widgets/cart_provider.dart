import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_full_e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:nti_full_e_commerce/features/cart/views/screens/cart_screen.dart';

class CartProvider extends StatelessWidget {
  final String id;
  const CartProvider({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartItems(id: id),
      child: CartScreen(),
    );
  }
}
