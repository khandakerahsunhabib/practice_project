import 'package:flutter/material.dart';
import 'package:practice_project/widgets/shopping_cart.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  double totalPrice = 0.0;

  void _handleTotalPriceChange(double newTotalPrice) {
    totalPrice = newTotalPrice;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ShoppingCart(
                onTotalPriceChanged: _handleTotalPriceChange,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Amount:'),
                Text(
                  '${totalPrice.toStringAsFixed(0)}\$',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Congratulations! You are ready to proceed'),
                    ),
                  );
                },
                child: const Text('CHECK OUT'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
