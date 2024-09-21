import 'package:flutter/material.dart';
import 'package:practice_project/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text('Product Name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: Code'),
          Text('Price: \$120'),
          Text('Quantity: 2'),
          Text('Total Price: \$240'),
          ButtonBar(
            children: [
              TextButton.icon(
                icon: Icon(Icons.edit),
                label: Text('Edit'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdateProductScreen(),
                    ),
                  );
                },
              ),
              TextButton.icon(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: Text('Delete'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
