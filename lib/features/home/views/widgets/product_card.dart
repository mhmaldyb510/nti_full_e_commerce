import 'package:flutter/material.dart';
import 'package:nti_full_e_commerce/common/models/product_model.dart';
import 'package:nti_full_e_commerce/features/product/views/screens/product_info_screen_.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductInfoScreen(product: product)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(child: Image.network(product.image)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  product.name,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xff2162a1),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'sold ${product.sales} times',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${product.price.toString().split('.').first}.',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      product.price.toString().split('.').last,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
