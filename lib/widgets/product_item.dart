import 'package:flutter/material.dart';
import 'package:practice_project/models/product.dart';
import 'package:practice_project/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, required this.onDelete});

  final Product product;
  final Function(String) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text('Product Name: ${product.productName}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode}'),
          Text('Price: \$${product.unitPrice}'),
          Text('Quantity: ${product.quantity}'),
          Text('Total Price: \$${product.totalPrice}'),
          ButtonBar(
            children: [
              TextButton.icon(
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UpdateProductScreen(product: product),
                    ),
                  );
                },
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const Text('Delete'),
                onPressed: () {
                  onDelete(product.id);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
