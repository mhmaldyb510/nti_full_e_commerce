import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showCartSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          width: 300,
          height: 400,
          child: AlertDialog(
            contentPadding: const EdgeInsets.all(16),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Lottie Animation
                Expanded(
                  child: Lottie.asset(
                    'assets/animations/cart_success.json', // You'll need to add this Lottie animation
                    repeat: false,
                    onLoaded: (p0) {
                      Future.delayed(p0.duration, () {
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      });
                    },
                  ),
                ),

                // Success Text
                const Text(
                  'Added to Cart!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                // Subtile Text
                Text(
                  'Your item has been successfully added to the cart.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),

                // Continue Shopping Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Continue Shopping',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
