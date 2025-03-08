import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_full_e_commerce/common/models/product_model.dart';
import 'package:nti_full_e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:nti_full_e_commerce/features/cart/views/widgets/cart_product_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartLoaded) {
          log('success');
          List<ProductModel> products = state.products;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return CartProductTile(product: products[index]);
            },
          );
        } else if (state is CartError) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
