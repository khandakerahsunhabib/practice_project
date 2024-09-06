import 'package:flutter/material.dart';
import 'package:practice_project/widgets/shopping_cart.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ShoppingCart(),
            ShoppingCart(),
            ShoppingCart(),
          ],
        ),
      ),
    );
  }
}
