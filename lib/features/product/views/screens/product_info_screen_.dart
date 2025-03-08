import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_full_e_commerce/common/models/product_model.dart';
import 'package:nti_full_e_commerce/features/product/cubit/product_cubit.dart';
import 'package:nti_full_e_commerce/features/product/views/widgets/show_cart_success_dialog.dart';

class ProductInfoScreen extends StatelessWidget {
  final ProductModel product;
  const ProductInfoScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String image = product.image;
    bool isDescriptionExpanded = false;
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Info'),
          shadowColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: BlocConsumer<ProductCubit, ProductState>(
                listener: (context, state) {
              if (state is ImageChangedState) {
                image = state.image;
              }
              if (state is DescriptionExpandedState) {
                isDescriptionExpanded = true;
              } else if (state is DescriptionCollapsedState) {
                isDescriptionExpanded = false;
              }
              if (state is AddedToCartState) {
                showCartSuccessDialog(context);
              }
            }, builder: (context, state) {
              return BlocConsumer<ProductCubit, ProductState>(
                listener: (context, state) {
                  if (state is ImageChangedState) {
                    image = state.image;
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: Image.network(
                          image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: SizedBox(
                          height: 50,
                          child: ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10);
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: product.images.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  context
                                      .read<ProductCubit>()
                                      .changeProductImage(
                                          product.images[index]);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  width: 40,
                                  height: 40,
                                  child: Image.network(product.images[index]),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // description
                      GestureDetector(
                        onTap: () {
                          if (isDescriptionExpanded) {
                            context.read<ProductCubit>().collapseDescription();
                          } else {
                            context.read<ProductCubit>().expandDescription();
                          }
                        },
                        child: Text(
                          product.description,
                          maxLines: isDescriptionExpanded ? null : 3,
                          overflow: isDescriptionExpanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      // end of description
                      // ================================

                      // start of price and other info
                      Row(
                        children: [
                          Text(
                            'Price: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${(product.price * 1.2).toStringAsFixed(2)} \$',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              decorationColor: Colors.red,
                              decorationThickness: 2,
                              decorationStyle: TextDecorationStyle.wavy,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${product.price.toStringAsFixed(2)} \$',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      // end of price and other info
                      // ================================

                      // start of add to cart button
                      ElevatedButton(
                        onPressed: () async {
                          var response = await context
                              .read<ProductCubit>()
                              .addToCart(product.id);
                          log(response.toString());
                        },
                        style: ElevatedButton.styleFrom(
                          iconColor: Colors.white,
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart),
                            SizedBox(width: 10),
                            Text('Add to Cart'),
                          ],
                        ),
                      ),
                      // end of add to cart button
                      // ================================

                      // start of buy now button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          iconColor: Colors.white,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.attach_money, size: 20),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Buy Now'),
                          ],
                        ),
                      ),
                      // end of buy now button
                      // ================================

                      SizedBox(
                        height: 10,
                      ),

                      // start of company info
                      RichText(
                        text: TextSpan(
                          text: 'Company: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: product.company,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // end of company info
                      // ================================
                      // start of category info
                      RichText(
                        text: TextSpan(
                          text: 'Category: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: product.category,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // end of category info
                      // ================================

                      // start of stock info
                      RichText(
                        text: TextSpan(
                          text: 'Count in Stock: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: product.countInStock.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(text: ' units'),
                          ],
                        ),
                      ),
                      // end of stock info
                      // ================================

                      // start of sales info
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Sold: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: product.sales.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: ' units have been sold'),
                          ],
                        ),
                      ),
                      // end of sales info
                      // ================================

                      SizedBox(
                        height: 10,
                      ),
                      // start of status info
                      RichText(
                        text: TextSpan(
                          text: 'Status: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: product.status,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      // end of status info
                      // ================================
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
