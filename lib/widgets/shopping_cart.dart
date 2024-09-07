import 'package:flutter/material.dart';
import 'package:practice_project/models/product.dart';

class ShoppingCart extends StatefulWidget {
  final Function(double) onTotalPriceChanged;

  const ShoppingCart({super.key, required this.onTotalPriceChanged});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  Map<String, Product> products = {
    "Product 1": Product(
        name: 'Pullover', price: 51, imagePath: 'assets/images/shirt.jpg'),
    "Product 2": Product(
        name: 'T-Shirt', price: 30, imagePath: 'assets/images/shirt-one.jpg'),
    "Product 3": Product(
        name: 'Sport Dress',
        price: 43,
        imagePath: 'assets/images/shirt-two.jpg'),
  };

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    products.forEach((key, product) {
      totalPrice += product.price * product.quantity;
    });
    return totalPrice;
  }

  void _updateTotalPrice() {
    double totalPrice = calculateTotalPrice();
    widget.onTotalPriceChanged(totalPrice);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        Product product = products.values.elementAt(index);
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  product.imagePath,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Color: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                                TextSpan(
                                  text: 'Black',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Size: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'L',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0, 3),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  )
                                ]),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  if (product.quantity > 1) {
                                    product.quantity--;
                                    _updateTotalPrice();
                                  }
                                  setState(() {});
                                },
                                icon: Transform.translate(
                                  offset: const Offset(0, -5),
                                  child: const Icon(
                                    Icons.minimize_rounded,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            product.quantity.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0, 3),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  )
                                ]),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  product.quantity++;
                                  _updateTotalPrice();
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.more_vert,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "${(product.price * product.quantity).toStringAsFixed(0)}\$",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: products.length,
    );
  }
}
