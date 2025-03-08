import 'package:flutter/material.dart';
import 'package:nti_full_e_commerce/common/models/product_model.dart';

class CartProductTile extends StatelessWidget {
  final ProductModel product;
  const CartProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
            ),
            child: Image.network(product.image),
          ),
          Spacer(
            flex: 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('unit price: ${product.price.toString()}'),
              Text('quantity: ${product.quantity.toString()}'),
              Text('total price: ${product.totalPrice.toString()}'),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
