class Product {
  final String name;
  final double price;
  final String imagePath;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });
}
